/**
 * sf-bridge — lets the patched chess.com on your phone run Game Review on the Stockfish of your own
 * computer instead of the phone's.
 *
 * The phone has no WebSocket library, so the bridge speaks plain UCI over a raw TCP socket: the
 * phone's extension opens a socket, authenticates once, and from then on talks to a private
 * Stockfish process exactly as it would talk to its own.
 *
 *   server: sf-bridge 1 cores 12
 *   client: auth <token>
 *   server: auth ok                        (or "auth fail", and the connection is closed)
 *   ... then plain UCI in both directions, one command per line, verbatim
 *
 * Every connection gets its own Stockfish, so a review running several engines side by side works
 * over the network as it does on the phone.
 *
 * Nothing leaves your network: the bridge listens on one port, the phone connects to it, and there
 * is no outbound traffic anywhere.
 *
 *   node server.js          (Node 18 or newer; no dependencies to install)
 */

'use strict';

const { spawn } = require('child_process');
const crypto = require('crypto');
const fs = require('fs');
const net = require('net');
const os = require('os');
const path = require('path');

/** The only port: what the patched app connects to. Nothing else listens. */
const TCP_PORT = Number(process.env.TCP_PORT || 7892);
const TOKEN_FILE = path.join(__dirname, 'token.txt');
const SF_PATH = process.env.SF_PATH || path.join(__dirname, 'stockfish.exe');
/** A connection that never authenticates is dropped, so a port scan does not tie up sockets. */
const AUTH_TIMEOUT_MS = 10_000;

// The token: generated on first start and kept in token.txt next to this file, so the phone only
// has to be told it once. Delete the file to get a new one (and re-enter it on the phone).
let TOKEN;
if (fs.existsSync(TOKEN_FILE)) {
  TOKEN = fs.readFileSync(TOKEN_FILE, 'utf8').trim();
} else {
  TOKEN = crypto.randomBytes(16).toString('hex');
  fs.writeFileSync(TOKEN_FILE, TOKEN, 'utf8');
}

if (!fs.existsSync(SF_PATH)) {
  console.error(`No Stockfish at ${SF_PATH}.`);
  console.error('Put stockfish.exe next to server.js (see README.md), or set SF_PATH to it.');
  process.exit(1);
}

const uciServer = net.createServer((socket) => {
  const remote = `${socket.remoteAddress}:${socket.remotePort}`;
  console.log(`[tcp] ${remote} connected, waiting for auth`);
  socket.setEncoding('utf8');
  socket.setNoDelay(true);
  // The core count goes in the greeting, so the phone's "Auto" threads can mean this machine's cores.
  socket.write(`sf-bridge 1 cores ${os.cpus().length}\n`);

  let authed = false;
  let engine = null;
  let buffer = '';
  let closing = false;

  const authTimer = setTimeout(() => {
    if (!authed) {
      console.log(`[tcp] ${remote} did not authenticate in 10 s`);
      socket.destroy();
    }
  }, AUTH_TIMEOUT_MS);

  const startEngine = () => {
    engine = spawn(SF_PATH, [], { cwd: path.dirname(SF_PATH) });
    engine.stdout.setEncoding('utf8');
    let out = '';
    engine.stdout.on('data', (chunk) => {
      out += chunk;
      let idx;
      while ((idx = out.indexOf('\n')) >= 0) {
        if (!socket.destroyed && socket.writable) socket.write(out.slice(0, idx + 1));
        out = out.slice(idx + 1);
      }
    });
    // Stockfish's banner goes to stderr: swallowed, so the client only ever sees UCI.
    engine.stderr.setEncoding('utf8');
    engine.stderr.on('data', () => {});
    engine.on('exit', (code) => {
      engine = null;
      if (!socket.destroyed && socket.writable) {
        socket.write(`info string bridge: stockfish exited (code ${code})\n`);
        socket.end();
      }
    });
  };

  socket.on('data', (chunk) => {
    buffer += chunk;
    let idx;
    while ((idx = buffer.indexOf('\n')) >= 0) {
      const line = buffer.slice(0, idx).replace(/\r$/, '');
      buffer = buffer.slice(idx + 1);

      if (!authed) {
        const match = /^auth\s+(\S+)$/.exec(line.trim());
        if (match && match[1] === TOKEN) {
          authed = true;
          clearTimeout(authTimer);
          socket.write('auth ok\n');
          console.log(`[tcp] ${remote} authenticated`);
          startEngine();
        } else {
          socket.write('auth fail\n');
          socket.end();
          console.log(`[tcp] ${remote} — wrong token`);
        }
        continue;
      }
      if (!engine) continue; // the engine has already exited; nowhere to send this
      engine.stdin.write(line + '\n');
    }
  });

  const shutdown = () => {
    if (closing) return;
    closing = true;
    clearTimeout(authTimer);
    const dying = engine;
    engine = null;
    if (dying) {
      try { dying.stdin.write('quit\n'); } catch { /* already closed */ }
      setTimeout(() => { try { dying.kill(); } catch { /* already gone */ } }, 2_000);
    }
    console.log(`[tcp] ${remote} disconnected`);
  };

  socket.on('close', shutdown);
  socket.on('error', shutdown);
});

uciServer.listen(TCP_PORT, '0.0.0.0', () => {
  const addresses = [];
  for (const name of Object.keys(os.networkInterfaces())) {
    for (const net of os.networkInterfaces()[name] || []) {
      if (net.family === 'IPv4' && !net.internal) addresses.push(net.address);
    }
  }
  console.log(`sf-bridge: UCI over TCP on port ${TCP_PORT}`);
  for (const address of addresses) console.log(`  on your network: ${address}:${TCP_PORT}  (the address the phone wants)`);
  console.log(`  cores:           ${os.cpus().length}`);
  console.log(`  token:           ${TOKEN.slice(0, 8)}…${TOKEN.slice(-6)}   (whole one in ${TOKEN_FILE})`);
  console.log('Waiting for the phone. Ctrl+C to stop.');
});
