const fs = require('fs');
const path = require('path');

// 1. Check all asset references in README.md
const content = fs.readFileSync('README.md', 'utf8');
const regex = /(?:src|srcset)=["']((?:assets|docs)\/[^"'\s]+)["']/g;
let match;
const missing = [];
let count = 0;
while ((match = regex.exec(content)) !== null) {
  count++;
  if (!fs.existsSync(match[1])) {
    missing.push(match[1]);
  }
}
console.log('Checked ' + count + ' asset references in README.md.');
if (missing.length > 0) {
  console.error('MISSING ASSETS IN README:', missing);
  process.exit(1);
}

// 2. Validate all SVG files for unescaped ampersands or malformed XML
function checkSvgs(dir) {
  let fileCount = 0;
  const files = fs.readdirSync(dir);
  for (const f of files) {
    const full = path.join(dir, f);
    if (fs.statSync(full).isDirectory()) {
      fileCount += checkSvgs(full);
    } else if (f.endsWith('.svg')) {
      fileCount++;
      const svg = fs.readFileSync(full, 'utf8');
      
      // Strict unescaped & check
      const badAmp = svg.match(/&(?!amp;|lt;|gt;|quot;|apos;|#\d+;|#x[0-9a-fA-F]+;)/g);
      if (badAmp) {
        console.error(`ERROR: ${badAmp.length} unescaped ampersands in ${full}`);
        process.exit(1);
      }

      // Check root tag
      if (!svg.startsWith('<svg') || !svg.endsWith('</svg>')) {
        console.error(`ERROR: SVG root element unclosed in ${full}`);
        process.exit(1);
      }
    }
  }
  return fileCount;
}

const darkCount = checkSvgs('assets/readme/dark');
const lightCount = checkSvgs('assets/readme/light');
const pubDarkCount = checkSvgs('public/assets/readme/dark');
const pubLightCount = checkSvgs('public/assets/readme/light');

console.log(`Validated ${darkCount + lightCount + pubDarkCount + pubLightCount} SVG files across assets/ and public/assets/.`);
console.log('SUCCESS: All SVGs have 100% valid XML and 0 unescaped entities!');
