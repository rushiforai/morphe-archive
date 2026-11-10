import { execFileSync } from 'node:child_process';

const expression = process.argv.slice(2).join(' ') || '1';
const pkg = 'com.overdrive.mobile.android.libby';

function adb(args) {
  return execFileSync('adb', args, { encoding: 'utf8' }).trim();
}

const devices = adb(['devices']);
if (!/^\S+\s+device$/m.test(devices)) {
  throw new Error('No adb device online.');
}

const pid = adb(['shell', 'pidof', pkg]);
if (!pid) {
  throw new Error('Libby is not running.');
}

const socket = `webview_devtools_remote_${pid}`;
try {
  adb(['forward', '--remove', 'tcp:9222']);
} catch {
  // Nothing to remove.
}
adb(['forward', 'tcp:9222', `localabstract:${socket}`]);

const targets = await (await fetch('http://127.0.0.1:9222/json')).json();
const target =
  targets.find((item) => (item.url || '').includes('read.libbyshelf.com')) ||
  targets.find((item) => item.type === 'page');

if (!target || !target.webSocketDebuggerUrl) {
  throw new Error('No WebView page target found. Is the reader open?');
}

const ws = new WebSocket(target.webSocketDebuggerUrl);
await new Promise((resolve, reject) => {
  ws.addEventListener('open', resolve, { once: true });
  ws.addEventListener('error', reject, { once: true });
});

const reply = await new Promise((resolve, reject) => {
  const id = 1;
  ws.addEventListener('message', (event) => {
    const message = JSON.parse(event.data);
    if (message.id === id) {
      resolve(message);
    }
  });
  ws.addEventListener('error', reject, { once: true });
  ws.send(JSON.stringify({
    id,
    method: 'Runtime.evaluate',
    params: {
      expression,
      awaitPromise: true,
      returnByValue: true,
    },
  }));
});

ws.close();
console.log(JSON.stringify(reply.result, null, 2));
