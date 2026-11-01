/**
 * Checks the bridge the way the phone's NetEngine does: connect, authenticate, ask one position for
 * a best move. Run it while server.js is running, from this folder.
 *
 *   node test-tcp.mjs
 *   TEST_NODES=1000000 node test-tcp.mjs     (PowerShell: $env:TEST_NODES='1000000'; node test-tcp.mjs)
 *   TEST_HOST=192.168.1.10 node test-tcp.mjs (from another machine on the network)
 */
import net from 'node:net';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const dir = path.dirname(fileURLToPath(import.meta.url));
const TOKEN = fs.readFileSync(path.join(dir, 'token.txt'), 'utf8').trim();
const HOST = process.env.TEST_HOST || '127.0.0.1';
const PORT = Number(process.env.TCP_PORT || 7892);
const NODES = Number(process.env.TEST_NODES || 300_000);

const started = Date.now();
let buffer = '';
let stage = 'greeting';
const socket = new net.Socket();
const send = (line) => socket.write(line + '\n');

socket.setEncoding('utf8');
socket.connect(PORT, HOST, () => console.log(`connected to ${HOST}:${PORT}`));

socket.on('data', (chunk) => {
  buffer += chunk;
  let idx;
  while ((idx = buffer.indexOf('\n')) >= 0) {
    const line = buffer.slice(0, idx).trim();
    buffer = buffer.slice(idx + 1);
    if (!line) continue;

    if (stage === 'greeting') {
      console.log(`server: ${line}`);
      send(`auth ${TOKEN}`);
      stage = 'auth';
      continue;
    }
    if (stage === 'auth') {
      console.log(`server: ${line}`);
      if (line !== 'auth ok') {
        console.error('AUTH FAILED: the token here and on the phone must be the one in token.txt');
        process.exit(1);
      }
      stage = 'uci';
      send('uci');
      continue;
    }
    if (line === 'uciok') {
      send(`setoption name Threads value ${Number(process.env.TEST_THREADS || 8)}`);
      send('setoption name Hash value 256');
      send('setoption name MultiPV value 3');
      send('isready');
      stage = 'ready';
      continue;
    }
    if (stage === 'ready' && line === 'readyok') {
      send('ucinewgame');
      send('position fen r1bq1rk1/pp2ppbp/2np1np1/8/2BNP3/2N1BP2/PPPQ2PP/R3K2R w KQ - 0 10');
      send(`go nodes ${NODES}`);
      console.log(`engine ready, searching ${NODES.toLocaleString('en')} nodes`);
      stage = 'search';
      continue;
    }
    if (stage === 'search') {
      if (line.startsWith('bestmove')) {
        console.log(`bestmove: ${line.split(/\s+/)[1]}`);
        console.log(`total: ${((Date.now() - started) / 1000).toFixed(2)} s from connecting`);
        send('quit');
        socket.end();
        return;
      }
      const m = /^info .*?depth (\d+).*?score (cp|mate) (-?\d+).*?(?:multipv (\d+))?.*? pv (.+)$/.exec(line);
      if (m) console.log(`  d${m[1]} ${m[2]} ${m[3]} | pv ${m[5].split(' ').slice(0, 6).join(' ')}`);
    }
  }
});

socket.on('close', () => {
  console.log('connection closed');
  process.exit(0);
});
socket.on('error', (e) => {
  console.error('ERROR:', e.message);
  process.exit(1);
});
setTimeout(() => {
  console.error('timed out after 60 s');
  process.exit(1);
}, 60_000);
