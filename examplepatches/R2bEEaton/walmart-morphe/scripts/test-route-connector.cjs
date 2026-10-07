// Exercise the actual injected script with an SVG boundary fixture. Android bridge coordinates
// deliberately differ from SVG coordinates: drawing must use the visible pins' anchors.
const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const source = fs.readFileSync('extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java', 'utf8');
const block = source.slice(source.lastIndexOf('String js = String.format(Locale.US,'), source.lastIndexOf('webView.evaluateJavascript(js,'));
const template = [...block.matchAll(/"(?:[^"\\]|\\.)*"/g)].map(m => JSON.parse(m[0])).join('');
let group, observer;
const container = { firstChild: null, insertBefore(p) { group = p; p.parentNode = this; } };
function makeNode() {
  const node = {
    attrs: {},
    childNodes: [],
    setAttribute(k, v) { this.attrs[k] = String(v); },
    appendChild(child) { child.parentNode = node; this.childNodes.push(child); },
    removeChild(child) {
      const idx = this.childNodes.indexOf(child);
      if (idx >= 0) this.childNodes.splice(idx, 1);
      return child;
    },
    get lastChild() { return this.childNodes[this.childNodes.length - 1]; },
    remove() { group = undefined; },
  };
  return node;
}
const pins = [
  { data: { data: { zone: 'A', aisle: '16', section: '14' } }, style: { transformOrigin: '4500px 8000px' } },
  { data: { data: { zone: 'A', aisle: '25', section: '2' } }, style: { transformOrigin: '4700px 6200px' } },
  { data: { data: { zone: 'A', aisle: '30', section: '5' } }, style: { transformOrigin: '4900px 5000px' } },
];
const svg = { querySelector: () => container, querySelectorAll: () => pins };
const document = {
  querySelector: () => svg,
  getElementById: () => group,
  createElementNS: () => makeNode(),
};
const context = { document, console, MutationObserver: class {
  constructor(fn) { observer = fn; } observe() {} disconnect() {}
} };
function run(stops, active = -1) {
  const script = template.replace('%s', JSON.stringify(stops)).replace('%d', String(active));
  return vm.runInNewContext(script, context);
}
const stops = [{zone:'A',aisle:'16',section:'14'}, {zone:'A',aisle:'25',section:'2'}];

assert.equal(run(stops), true);
assert.equal(group.childNodes.length, 1, 'Two stops draw one leg');
assert.equal(group.childNodes[0].attrs.d, 'M 4500 8000 L 4700 6200');
assert.equal(group.childNodes[0].attrs['pointer-events'], 'none');
group = undefined; // Native map clears and recreates its pins.
observer();
assert.equal(group.childNodes[0].attrs.d, 'M 4500 8000 L 4700 6200');
assert.equal(run(stops.slice(1)), true);
assert.equal(group, undefined, 'One unchecked stop needs no line');
assert.equal(run(stops), true);
assert.equal(run([]), true);
assert.equal(group, undefined, 'All checked items clear the line');
pins.length = 0;
assert.equal(run(stops), false, 'Wait for matching DOM pins instead of using bridge coordinates');
pins.push(
  { data: { data: { zone: 'A', aisle: '16', section: '14' } }, style: { transformOrigin: '4500px 8000px' } },
  { data: { data: { zone: 'A', aisle: '25', section: '2' } }, style: { transformOrigin: '4700px 6200px' } },
  { data: { data: { zone: 'A', aisle: '30', section: '5' } }, style: { transformOrigin: '4900px 5000px' } },
);

// Three stops: progress greys out the leg leading to an already-passed stop while the leg
// currently being walked, and legs still ahead, stay the active blue.
const threeStops = [
  {zone:'A',aisle:'16',section:'14'},
  {zone:'A',aisle:'25',section:'2'},
  {zone:'A',aisle:'30',section:'5'},
];
group = undefined;
assert.equal(run(threeStops, 1), true);
assert.equal(group.childNodes.length, 2, 'Three stops draw two legs');
const [leg0, leg1] = group.childNodes;
assert.equal(leg0.attrs.d, 'M 4500 8000 L 4700 6200');
assert.equal(leg1.attrs.d, 'M 4700 6200 L 4900 5000');
assert.equal(leg0.attrs.stroke, '#0071dc', 'Leg leading to the active stop is not greyed');
assert.notEqual(leg1.attrs.stroke, '#8a93a3', 'Leg still ahead of the active stop is not greyed');
assert.equal(run(threeStops, 2), true);
assert.equal(leg0.attrs.stroke, '#8a93a3', 'Leg leading to an already-passed stop is greyed');
assert.equal(leg1.attrs.stroke, '#0071dc', 'Leg leading to the active stop is not greyed');
assert.equal(run(threeStops, -1), true);
assert.equal(leg0.attrs.stroke, '#0071dc', 'No active stop means nothing is greyed');
assert.equal(leg1.attrs.stroke, '#0071dc', 'No active stop means nothing is greyed');

console.log('Route connector SVG tests passed');
