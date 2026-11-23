// Writes the Quora session of a signed-in patched app on a phone, as "m-b=…; m-s=…", to stdout,
// for the feed test's QUORA_TEST_COOKIES secret. Pipe it straight into the secret so it isn't
// shown anywhere:
//
//   adb forward tcp:9222 localabstract:webview_devtools_remote_$(adb shell pidof <package>)
//   node .github/scripts/export-quora-session.mjs | gh secret set QUORA_TEST_COOKIES
//
// The app needs WebView debugging (a test build, see feed-test.yml) and must be signed in to the
// test account, never to your own. Only the cookies that hold the session are written.
const SESSION_COOKIES = ['m-b', 'm-b_lax', 'm-b_strict', 'm-s', 'm-lat', 'm-uid', 'm-login'];

const list = await (await fetch('http://localhost:9222/json')).json();
const page = list.find((p) => p.type === 'page' && p.url.startsWith('https://www.quora.com'));
if (!page) {
  console.error('No Quora page to read: is the app open and forwarded to port 9222?');
  process.exit(1);
}
const ws = new WebSocket(page.webSocketDebuggerUrl);
await new Promise((r) => (ws.onopen = r));
ws.send(JSON.stringify({ id: 1, method: 'Network.getCookies', params: { urls: ['https://www.quora.com/'] } }));
// A page of an app in the background doesn't answer; say so instead of waiting forever.
const result = await new Promise((r) => {
  setTimeout(() => {
    console.error('The page doesn\'t answer: open the app so it is on the screen, then try again.');
    process.exit(1);
  }, 15000);
  ws.onmessage = (m) => {
    const d = JSON.parse(m.data);
    if (d.id === 1) r(d.result);
  };
});
ws.close();
const cookies = result.cookies.filter((c) => SESSION_COOKIES.includes(c.name));
if (!cookies.some((c) => c.name === 'm-b') || !cookies.some((c) => c.name === 'm-login' && c.value === '1')) {
  console.error('The app is not signed in.');
  process.exit(1);
}
process.stdout.write(cookies.map((c) => `${c.name}=${c.value}`).join('; '));
console.error(`Wrote ${cookies.length} cookies: ${cookies.map((c) => c.name).join(', ')}`);
process.exit(0);
