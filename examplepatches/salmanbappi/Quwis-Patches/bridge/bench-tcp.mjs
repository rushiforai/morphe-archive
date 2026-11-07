/**
 * What the app's "Benchmark your computer" button does, from the command line: one connection, one
 * Stockfish, then 100k / 300k / 1M / 5M nodes on one position each. Stockfish's start-up is timed
 * separately, because a review starts it once for the whole game and not for every move.
 *
 *   node bench-tcp.mjs
 */
import net from 'node:net';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const dir = path.dirname(fileURLToPath(import.meta.url));
const TOKEN = fs.readFileSync(path.join(dir, 'token.txt'), 'utf8').trim();
const HOST = process.env.TEST_HOST || '127.0.0.1';
const PORT = Number(process.env.TCP_PORT || 7892);
const BUDGETS = [100_000, 300_000, 1_000_000, 5_000_000];
const FEN = 'r1bq1rk1/pp2ppbp/2np1np1/8/2BNP3/2N1BP2/PPPQ2PP/R3K2R w KQ - 0 10';

let cores = 8;
const socket = new net.Socket().connect(PORT, HOST);
socket.setEncoding('utf8');

let buffer = '';
const lines = [];
let waiter = null;
const nextLine = () => new Promise((resolve) => {
  if (lines.length) return resolve(lines.shift());
  waiter = resolve;
});

const send = (line) => socket.write(line + '\n');
const until = async (prefix) => {
  for (;;) {
    const line = await nextLine();
    if (line.startsWith(prefix)) return line;
  }
};

socket.on('data', (chunk) => {
  buffer += chunk;
  let idx;
  while ((idx = buffer.indexOf('\n')) >= 0) {
    const line = buffer.slice(0, idx).trim();
    buffer = buffer.slice(idx + 1);
    if (!line) continue;
    if (waiter) { const w = waiter; waiter = null; w(line); } else lines.push(line);
  }
});

const opened = Date.now();
const greeting = await until('sf-bridge');
const coresMatch = /cores\s+(\d+)/.exec(greeting);
if (coresMatch) cores = Number(coresMatch[1]);

send(`auth ${TOKEN}`);
await until('auth ok');
send('uci');
await until('uciok');
const threads = Number(process.env.TEST_THREADS || cores);
const hash = Math.max(128, Math.min(1024, cores * 32));
send(`setoption name Threads value ${threads}`);
send(`setoption name Hash value ${hash}`);
send('setoption name MultiPV value 1');
send('isready');
await until('readyok');
const startup = Date.now() - opened;

const times = [];
for (const nodes of BUDGETS) {
  send('ucinewgame');
  send(`position fen ${FEN}`);
  const started = process.hrtime.bigint();
  send(`go nodes ${nodes}`);
  await until('bestmove');
  times.push(Number(process.hrtime.bigint() - started) / 1e6);
}
send('quit');

const label = (n) => (n >= 1e6 ? `${n / 1e6}M` : `${n / 1e3}k`);
console.log(`Startup (once per review): ${(startup / 1000).toFixed(2)} s`);
console.log(`threads ${threads}, hash ${hash} MB\n`);
BUDGETS.forEach((n, i) => console.log(`${label(n).padEnd(4)} nodes a move: ${(times[i] / 1000).toFixed(2)} s`));
socket.end();
