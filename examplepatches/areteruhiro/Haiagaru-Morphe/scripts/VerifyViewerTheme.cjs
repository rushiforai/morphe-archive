// Validate the actual Java-generated JavaScript, not a hand-maintained copy.
// Run: node scripts/VerifyViewerTheme.cjs [path/to/HissiMenuActivity.java]
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const file = process.argv[2] || path.join(__dirname,
  '../extensions/chmate/src/main/java/app/morphe/extension/chmate/HissiMenuActivity.java');
const source = fs.readFileSync(file, 'utf8');
const start = source.indexOf('String script =', source.indexOf('private void applyViewerTheme('));
const end = source.indexOf('\n            String javascript =', start);
if (start < 0 || end < 0) throw new Error('Theme script boundaries missing');
// This expression uses the shared Java/JS string, + and ternary syntax only.
const expression = source.slice(start + 'String script ='.length, end).trim().replace(/;$/, '');
for (const theme of [0, 1, 2, 3]) {
  for (const systemDark of [false, true]) {
    const dark = theme === 3 ? false : theme === 1 || theme === 2 || systemDark;
    const context = { dark, theme, MONA_FONT_PATH: '/__haiagaru__/MonaLite.ttf',
      bg: theme === 2 ? '#000000' : dark ? '#1e1e20' : '#ffffff',
      fg: dark ? '#ebebf0' : '#1e1e1e', link: dark ? '#8ab4f8' : '#1558a6' };
    const js = vm.runInNewContext('(' + expression + ')', context).replace(/^javascript:/, '');
    new vm.Script(js); // catches quotes in CSS accidentally terminating the JS string
    if (!js.includes('haiagaru-viewer-style') || !js.includes('overflow-wrap:anywhere')
        || !js.includes('touchstart') || !js.includes(context.fg)) {
      throw new Error('Theme/layout/long-press rules missing');
    }
    console.log(`PASS theme=${theme} systemDark=${systemDark}: JavaScript syntax and rules`);
  }
}
