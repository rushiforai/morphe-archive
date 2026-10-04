const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const root = path.resolve(__dirname, '..');
const routes = new Map([
  ['/', ['tests/browser.html', 'text/html; charset=utf-8']],
  ['/bundle.js', ['dist/youtube-thread-ripper.user.js', 'text/javascript; charset=utf-8']]
]);
const server = http.createServer((request, response) => {
  const route = routes.get(new URL(request.url, 'http://localhost').pathname);
  if (!route) { response.writeHead(404); response.end('Not found'); return; }
  response.writeHead(200, { 'Content-Type': route[1], 'Cache-Control': 'no-store' });
  fs.createReadStream(path.join(root, route[0])).pipe(response);
});
server.listen(0, '127.0.0.1', () => console.log(`Browser fixture: http://127.0.0.1:${server.address().port}/`));
