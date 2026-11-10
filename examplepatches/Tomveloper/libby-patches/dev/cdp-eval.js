// Evaluates a JS expression in the live Libby reader WebView.
// Usage: node dev/cdp-eval.js "expression"
// Requires: adb forward tcp:9222 localabstract:webview_devtools_remote_<pid>

const expression = process.argv[2];
if (!expression) {
  console.error('usage: node dev/cdp-eval.js "expression"');
  process.exit(1);
}

const targets = await (await fetch('http://localhost:9222/json')).json();
const target = targets.find((t) => t.url && t.url.includes('read.libbyshelf.com'))
  || targets[0];
if (!target) {
  console.error('no page target');
  process.exit(1);
}

const ws = new WebSocket(target.webSocketDebuggerUrl);
let id = 0;
const pending = new Map();

ws.addEventListener('message', (event) => {
  const msg = JSON.parse(event.data);
  if (msg.id && pending.has(msg.id)) {
    pending.get(msg.id)(msg);
    pending.delete(msg.id);
  }
});

function send(method, params) {
  return new Promise((resolve) => {
    const callId = ++id;
    pending.set(callId, resolve);
    ws.send(JSON.stringify({ id: callId, method, params }));
  });
}

await new Promise((resolve, reject) => {
  ws.addEventListener('open', resolve);
  ws.addEventListener('error', reject);
});

const result = await send('Runtime.evaluate', {
  expression,
  returnByValue: true,
  awaitPromise: true,
  userGesture: true,
});

if (result.result && result.result.exceptionDetails) {
  console.error(JSON.stringify(result.result.exceptionDetails, null, 2));
  process.exit(1);
}
const value = result.result && result.result.result
  ? result.result.result.value
  : undefined;
if (typeof value === 'string') {
  console.log(value);
} else {
  console.log(JSON.stringify(value, null, 2));
}
ws.close();
