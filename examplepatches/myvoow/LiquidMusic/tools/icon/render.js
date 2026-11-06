// Renders the launcher icon of the "Liquid Glass icon" patch from adaptive.svg, with Chromium,
// into patches/src/main/resources/liquidmusic/icon. Run: node tools/icon/render.js
const { chromium } = require('playwright');
const { readFileSync, mkdirSync, writeFileSync } = require('node:fs');
const { dirname, join } = require('node:path');

const here = __dirname;
const out = join(here, '../../patches/src/main/resources/liquidmusic/icon');
const svg = readFileSync(join(here, 'adaptive.svg'), 'utf8');
// Adaptive layers are 108 dp, legacy icons 48 dp.
const densities = { mdpi: 1, hdpi: 1.5, xhdpi: 2, xxhdpi: 3, xxxhdpi: 4 };

(async () => {
const browser = await chromium.launch();
const page = await browser.newPage();
async function render(size, round, file) {
  const clip = round ? 'border-radius:50%;' : '';
  await page.setViewportSize({ width: size, height: size });
  await page.setContent(`<html><body style="margin:0;background:transparent">
    <div style="width:${size}px;height:${size}px;overflow:hidden;${clip}">${svg.replace('width="200" height="200"', `width="${size}" height="${size}"`)}</div></body></html>`);
  const png = await page.screenshot({ omitBackground: true, clip: { x: 0, y: 0, width: size, height: size } });
  mkdirSync(dirname(file), { recursive: true });
  writeFileSync(file, png);
}
for (const [name, scale] of Object.entries(densities)) {
  await render(Math.round(108 * scale), false, join(out, `mipmap-${name}/liquidmusic_icon_background.png`));
  await render(Math.round(48 * scale), true, join(out, `mipmap-${name}/ic_launcher.png`));
  await render(Math.round(48 * scale), true, join(out, `mipmap-${name}/ic_launcher_round.png`));
}
await browser.close();
})();
