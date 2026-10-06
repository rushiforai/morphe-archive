const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname,
  '../extensions/chmate/src/main/java/app/morphe/extension/chmate/HissiMenuActivity.java'), 'utf8').replace(/\r\n/g, '\n');
const start = source.indexOf('webView.evaluateJavascript(', source.indexOf('analysis.setOnClickListener'));
const end = source.indexOf(',\n                    result ->', start);
const script = vm.runInNewContext(source.slice(start + 'webView.evaluateJavascript('.length, end));
new vm.Script(script);
function check({trend = false, execution = null, chart = false, opened = false}, expected) {
  let mode = opened ? 'sidebar' : null;
  const panel = {querySelector: () => ({})};
  panel.querySelector = selector => selector === '#wt' || trend ? {} : null;
  const document = {
    body: {hasAttribute: () => mode !== null, removeAttribute: () => {mode = null;},
      setAttribute: (_, value) => {mode = value;}},
    querySelector: selector => selector === '#b>.right-column' ? panel : chart ? {} : null,
    querySelectorAll: () => execution ? [{getAttribute: () => execution}] : []
  };
  const location = new URL('https://www.kyodemo.net/sdemo/b/anotherboard/?bs=hi&k=anotherID');
  const result = vm.runInNewContext(script, {document, location, URL, JSON,
    window: {scrollTo() {}}, requestAnimationFrame() {}});
  if (result !== expected) throw new Error(`Expected ${expected}, got ${result}`);
  return mode;
}
if (check({trend:true}, 'opened') !== 'sidebar') throw new Error('Trend must take priority');
check({execution:'?bs=hi&k=anotherID&c=abc&fetch=a'}, 'unavailable');
check({execution:'https://evil.example/sdemo/b/anotherboard/?fetch=a'}, 'unavailable');
check({execution:'/sdemo/b/differentboard/?fetch=a'}, 'unavailable');
check({execution:'?bs=hi&k=differentID&fetch=a'}, 'unavailable');
check({}, 'unavailable');
check({trend:true,opened:true}, 'closed');
console.log('PASS: board-independent analysis links, trend display, close and unsafe-link rejection');
const requestStart = source.indexOf('webView.evaluateJavascript(', source.indexOf('private void requestKyodemoAnalysis('));
const requestEnd = source.indexOf(', result ->', requestStart);
const requestScript = vm.runInNewContext(source.slice(requestStart + 'webView.evaluateJavascript('.length, requestEnd));
new vm.Script(requestScript);
console.log('PASS: explicit analysis request JavaScript syntax');
function request(link, expected) {
  const location = new URL('https://www.kyodemo.net/sdemo/b/anotherboard/?bs=hi&k=anotherID');
  const result = vm.runInNewContext(requestScript, {location, URL, document:{
    querySelectorAll: () => [{getAttribute: () => link}]
  }});
  if (result !== expected) throw new Error(`Request: expected ${expected}, got ${result}`);
}
request('?bs=hi&k=anotherID&c=abc&fetch=a',
  'https://www.kyodemo.net/sdemo/b/anotherboard/?bs=hi&k=anotherID&c=abc&fetch=a');
request('?bs=hi&k=differentID&fetch=a', '');
request('https://evil.example/sdemo/b/anotherboard/?k=anotherID&fetch=a', '');
if (/execution:|fetch=a|loadUrl/.test(script)) throw new Error('Display action must never request analysis');
console.log('PASS: automatic display cannot resend analysis; explicit request matches current ID');
