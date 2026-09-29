// Local HTTPS fixture for Android password providers that exclude localhost.
// Requires autofill_server.py, adb reverse tcp:8766 tcp:8766, and
// adb forward tcp:9223 localabstract:chrome_devtools_remote.
// Pass the DevTools ID of a newly opened disposable tab. Never use a real login.
const endpoint = 'http://localhost:9223';
const version = await (await fetch(`${endpoint}/json/version`)).json();
if (version['Android-Package'] !== 'app.matthew.chrome.test') {
    throw Error('DevTools must belong to the separate Chrome Morphe installation');
}
const pages = await (await fetch(`${endpoint}/json`)).json();
const page = pages.find(p => p.id === process.argv[2] && p.type === 'page');
if (!page || !['', 'about:blank', 'chrome://newtab/', 'chrome-native://newtab/',
    'http://localhost:8766/login'].includes(page.url)) {
    throw Error('Pass the ID of a new blank or loopback fixture tab');
}
const prefix = '/morphe-autofill-fixture';
const socket = new WebSocket(page.webSocketDebuggerUrl);
await new Promise((resolve, reject) => {
    socket.onopen = resolve;
    socket.onerror = reject;
});
let sequence = 0;
const pending = new Map();
const call = (method, params = {}) => new Promise((resolve, reject) => {
    const id = ++sequence;
    pending.set(id, [resolve, reject]);
    socket.send(JSON.stringify({id, method, params}));
});
socket.onmessage = async event => {
    const message = JSON.parse(event.data);
    if (pending.has(message.id)) {
        const [resolve, reject] = pending.get(message.id);
        pending.delete(message.id);
        message.error ? reject(Error(message.error.message)) : resolve(message.result);
        return;
    }
    if (message.method !== 'Fetch.requestPaused') return;
    const {requestId, request} = message.params;
    try {
        const url = new URL(request.url);
        if (!['example.com', 'example.org'].includes(url.hostname)
                || !url.pathname.startsWith(`${prefix}/`)) {
            await call('Fetch.failRequest', {requestId, errorReason: 'BlockedByClient'});
            return;
        }
        // Forward only to the loopback fixture. It compares public dummy values
        // in memory and never logs request bodies. No POST reaches either domain.
        const path = url.pathname.slice(prefix.length) + url.search;
        const response = await fetch(`http://localhost:8766${path}`, {
            method: request.method,
            body: request.method === 'POST' ? request.postData : undefined,
            redirect: 'manual',
        });
        const headers = [{name: 'Content-Type', value: 'text/html; charset=utf-8'},
            {name: 'Cache-Control', value: 'no-store'}];
        const redirect = response.headers.get('location');
        if (redirect) headers.push({name: 'Location', value: prefix + redirect});
        const body = (await response.text())
            .replaceAll('action="/login"', `action="${prefix}/login"`)
            .replaceAll('href="/login"', `href="${prefix}/login"`);
        await call('Fetch.fulfillRequest', {requestId, responseCode: response.status,
            responseHeaders: headers, body: Buffer.from(body).toString('base64')});
    } catch {
        // Leave a failed interception blocked; never fall through to the network.
        await call('Fetch.failRequest', {requestId, errorReason: 'BlockedByClient'});
        console.error('Fixture request blocked because the local harness failed');
    }
};
await call('Fetch.enable', {patterns: [
    {urlPattern: 'https://example.com/morphe-autofill-fixture/*'},
    {urlPattern: 'https://example.org/morphe-autofill-fixture/*'},
]});
await call('Page.navigate', {url: `https://example.com${prefix}/login`});
console.log('HTTPS fixture active. Close this disposable tab before stopping the harness.');
