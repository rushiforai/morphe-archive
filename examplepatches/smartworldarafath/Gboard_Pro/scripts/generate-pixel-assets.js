const fs = require('fs');
const path = require('path');

// Output directories
const darkDir = path.join(__dirname, '..', 'assets', 'readme', 'dark');
const lightDir = path.join(__dirname, '..', 'assets', 'readme', 'light');
const pubDarkDir = path.join(__dirname, '..', 'public', 'assets', 'readme', 'dark');
const pubLightDir = path.join(__dirname, '..', 'public', 'assets', 'readme', 'light');

for (const d of [darkDir, lightDir, pubDarkDir, pubLightDir]) {
  fs.mkdirSync(d, { recursive: true });
}

// 12-point scalloped Material 3 Expressive flower path (precisely centered at 0, 0)
const CENTERED_FLOWER_PATH = "M24.6,5.0C24.2,5.5 23.8,5.9 23.4,6.4C23.1,6.9 22.7,7.3 22.5,7.8C22.2,8.3 22.0,8.7 21.8,9.2C21.7,9.8 21.6,10.3 21.5,10.9C21.4,11.4 21.4,12.0 21.4,12.6C21.3,13.2 21.3,13.9 21.2,14.5C21.1,15.1 20.9,15.7 20.7,16.3C20.4,16.8 20.1,17.3 19.7,17.8C19.3,18.2 18.9,18.6 18.4,18.9C17.8,19.2 17.2,19.4 16.7,19.6C16.1,19.8 15.4,19.9 14.8,20.0C14.2,20.2 13.6,20.3 13.1,20.4C12.5,20.5 12.0,20.7 11.5,20.9C11.0,21.1 10.6,21.4 10.2,21.7C9.7,22.0 9.3,22.4 8.9,22.9C8.5,23.3 8.1,23.7 7.6,24.2C7.2,24.6 6.7,25.0 6.2,25.4C5.7,25.8 5.2,26.1 4.7,26.3C4.1,26.5 3.5,26.6 2.9,26.7C2.3,26.7 1.7,26.6 1.1,26.4C0.6,26.3 -0.0,26.0 -0.6,25.8C-1.3,25.5 -1.8,25.2 -2.3,24.9C-2.8,24.6 -3.3,24.3 -3.8,24.1C-4.3,23.9 -4.8,23.7 -5.3,23.6C-5.8,23.5 -6.4,23.5 -6.9,23.5C-7.5,23.5 -8.0,23.5 -8.6,23.6C-9.2,23.6 -9.9,23.7 -10.5,23.8C-11.1,23.8 -11.7,23.8 -12.3,23.7C-12.9,23.6 -13.5,23.5 -14.1,23.2C-14.6,23.0 -15.1,22.6 -15.5,22.2C-15.9,21.8 -16.3,21.3 -16.6,20.8C-17.0,20.2 -17.2,19.6 -17.4,19.1C-17.7,18.5 -17.9,17.9 -18.1,17.4C-18.3,16.8 -18.5,16.3 -18.8,15.9C-19.1,15.4 -19.4,15.0 -19.8,14.6C-20.1,14.2 -20.5,13.8 -21.0,13.5C-21.5,13.1 -22.0,12.8 -22.5,12.5C-23.0,12.1 -23.5,11.8 -24.0,11.4C-24.4,11.0 -24.9,10.5 -25.3,10.1C-25.6,9.6 -25.9,9.0 -26.1,8.5C-26.3,7.9 -26.4,7.3 -26.4,6.7C-26.4,6.1 -26.3,5.5 -26.1,4.9C-26.0,4.3 -25.8,3.7 -25.6,3.1C-25.4,2.5 -25.2,2.0 -25.1,1.4C-24.9,0.9 -24.8,0.3 -24.7,-0.2C-24.7,-0.7 -24.7,-1.2 -24.7,-1.8C-24.8,-2.3 -24.9,-2.9 -25.1,-3.4C-25.2,-4.0 -25.4,-4.6 -25.6,-5.2C-25.7,-5.8 -25.9,-6.4 -26.0,-7.0C-26.0,-7.6 -26.0,-8.3 -25.9,-8.8C-25.8,-9.4 -25.7,-10.0 -25.4,-10.5C-25.1,-11.0 -24.7,-11.5 -24.3,-11.9C-23.9,-12.4 -23.4,-12.8 -22.9,-13.1C-22.4,-13.5 -21.8,-13.8 -21.3,-14.1C-20.8,-14.4 -20.3,-14.7 -19.8,-15.0C-19.4,-15.4 -19.0,-15.7 -18.6,-16.1C-18.3,-16.5 -18.0,-17.0 -17.7,-17.4C-17.4,-17.9 -17.2,-18.5 -17.0,-19.0C-16.7,-19.5 -16.5,-20.1 -16.2,-20.7C-15.9,-21.2 -15.6,-21.8 -15.2,-22.3C-14.8,-22.7 -14.4,-23.2 -13.9,-23.5C-13.4,-23.8 -12.9,-24.1 -12.3,-24.3C-11.7,-24.4 -11.1,-24.5 -10.5,-24.5C-9.9,-24.5 -9.2,-24.4 -8.6,-24.4C-8.0,-24.3 -7.4,-24.2 -6.8,-24.1C-6.3,-24.0 -5.8,-23.9 -5.3,-23.9C-4.6,-23.9 -4.1,-24.0 -3.6,-24.1C-3.1,-24.2 -2.5,-24.4 -2.0,-24.7C-1.5,-24.9 -1.0,-25.2 -0.4,-25.4C0.1,-25.7 0.7,-26.0 1.3,-26.2C1.9,-26.4 2.5,-26.6 3.1,-26.6C3.7,-26.7 4.3,-26.7 4.9,-26.6C5.4,-26.4 6.0,-26.2 6.5,-25.9C7.0,-25.6 7.5,-25.2 8.0,-24.8C8.4,-24.4 8.9,-23.9 9.3,-23.5C9.7,-23.0 10.1,-22.5 10.5,-22.1C10.9,-21.7 11.2,-21.3 11.7,-21.0C12.1,-20.7 12.6,-20.5 13.1,-20.2C13.6,-20.0 14.1,-19.9 14.7,-19.7C15.2,-19.6 15.9,-19.5 16.4,-19.3C17.0,-19.1 17.7,-18.9 18.2,-18.7C18.8,-18.4 19.3,-18.1 19.8,-17.8C20.2,-17.4 20.6,-16.9 21.0,-16.4C21.3,-15.9 21.5,-15.4 21.7,-14.8C21.8,-14.2 21.9,-13.6 21.9,-13.0C22.0,-12.3 22.0,-11.7 22.0,-11.1C22.0,-10.5 22.0,-9.9 22.1,-9.4C22.2,-8.8 22.3,-8.3 22.4,-7.8C22.6,-7.3 22.8,-6.8 23.1,-6.3C23.4,-5.9 23.7,-5.4 24.1,-4.9C24.4,-4.4 24.8,-3.9 25.2,-3.4C25.5,-2.9 25.8,-2.3 26.0,-1.7C26.3,-1.2 26.4,-0.6 26.5,0.0C26.5,0.6 26.5,1.2 26.3,1.8C26.2,2.3 25.9,2.9 25.5,3.4C25.3,4.0 24.9,4.5 24.6,5.0Z";

// XML Escape helper to ensure valid SVG XML on all parsers and GitHub Camo
function escapeXml(str) {
  if (!str) return '';
  return String(str)
    .replace(/&(?!(amp|lt|gt|quot|apos|#\d+|#x[0-9a-fA-F]+);)/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

// Helper to write file to both assets/readme and public/assets/readme
function saveSvg(subPath, content) {
  if (/&(?!amp;|lt;|gt;|quot;|apos;|#\d+;|#x[0-9a-fA-F]+;)/.test(content)) {
    throw new Error(`Unescaped ampersand detected in ${subPath}`);
  }
  fs.writeFileSync(path.join(__dirname, '..', 'assets', 'readme', subPath), content);
  fs.writeFileSync(path.join(__dirname, '..', 'public', 'assets', 'readme', subPath), content);
}

// Common SVG Icons (Pure paths, no hardcoded currentColor inside paths)
const ICONS = {
  download: `<path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>`,
  package: `<path d="M20 6h-4V4c0-1.11-.89-2-2-2h-4c-1.11 0-2 .89-2 2v2H4c-1.11 0-1.99.89-1.99 2L2 19c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V8c0-1.11-.89-2-2-2zm-6 0h-4V4h4v2z"/>`,
  github: `<path fill-rule="evenodd" clip-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>`,
  heart: `<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>`,
  bug: `<path d="M19 8h-1.81a5.985 5.985 0 0 0-1.82-1.96l1.24-1.24a.996.996 0 1 0-1.41-1.41L13.43 5.16C12.96 5.06 12.49 5 12 5s-.96.06-1.43.16L8.8 3.39a.996.996 0 1 0-1.41 1.41l1.24 1.24A5.985 5.985 0 0 0 6.81 8H5a1 1 0 1 0 0 2h1.17c-.11.64-.17 1.31-.17 2v1H5a1 1 0 1 0 0 2h1v1c0 .69.06 1.36.17 2H5a1 1 0 1 0 0 2h1.81c1.04 1.79 2.97 3 5.19 3s4.15-1.21 5.19-3H19a1 1 0 1 0 0-2h-1.17c.11-.64.17-1.31.17-2v-1h1a1 1 0 1 0 0-2h-1v-1c0-.69-.06-1.36-.17-2H19a1 1 0 1 0 0-2h-1v-1c0-.69-.06-1.36-.17-2H19a1 1 0 1 0 0-2zm-7 11c-2.76 0-5-2.24-5-5v-3c0-2.76 2.24-5 5-5s5 2.24 5 5v3c0 2.76-2.24 5-5 5z"/>`,
  license: `<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 14.5v1.5h-2v-1.5c-2.2-.4-3.5-1.8-3.5-3.5h2c0 1.1.9 2 2.5 2s2.5-.9 2.5-2c0-1.3-1-1.7-2.7-2.1-2.3-.5-4.3-1.2-4.3-3.4 0-1.7 1.3-3.1 3.5-3.5V6h2v1.5c1.8.4 3 1.6 3.2 3.1h-2c-.2-.9-.8-1.6-2.2-1.6-1.3 0-2.2.7-2.2 1.6 0 1.1.8 1.5 2.6 1.9 2.5.6 4.4 1.3 4.4 3.6 0 1.9-1.4 3.4-3.8 3.9z"/>`,
  shield: `<path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm-2 16l-4-4 1.41-1.41L10 14.17l6.59-6.59L18 9l-8 8z"/>`,
  rocket: `<path d="M12 2.5s4 1.5 6 6.5c1.2 3-.5 6-1.5 7.5L18 20l-3.5-1.5c-1.5 1-4.5 2.7-7.5 1.5-5-2-6.5-6-6.5-6s3.5-1.5 6.5-1.5c.5-1 1.5-2.5 3-4 1.5-1.5 3-3.5 3-6z"/>`,
  mic: `<path d="M12 14c1.66 0 3-1.34 3-3V5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3zm5.3-3c0 3-2.54 5.1-5.3 5.1S6.7 14 6.7 11H5c0 3.41 2.72 6.23 6 6.72V21h2v-3.28c3.28-.48 6-3.3 6-6.72h-1.7z"/>`,
  sparkles: `<path d="M9 3L7.5 7.5 3 9l4.5 1.5L9 15l1.5-4.5L15 9l-4.5-1.5z M19 11l-1 3-3 1 3 1 1 3 1-3 3-1-3-1z M17 3l-.6 1.8L14.6 5.4l1.8.6.6 1.8.6-1.8 1.8-.6-1.8-.6z"/>`,
  spellcheck: `<path d="M12.45 16h2.09L9.43 3H7.57L2.46 16h2.09l1.12-3h5.66l1.12 3zM6.37 11.25L8.5 5.48l2.13 5.77H6.37zM21.5 9l-7.79 7.79-3.21-3.2-1.41 1.41 4.62 4.62 9.21-9.21z"/>`,
  camera: `<path d="M9.4 4L7.6 6H4c-1.1 0-2 .9-2 2v11c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-3.6l-1.8-2h-5.2zm2.6 15c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.65 0-3 1.35-3 3s1.35 3 3 3 3-1.35 3-3-1.35-3-3-3z"/>`,
  keyboard: `<path d="M20 5H4c-1.1 0-1.99.9-1.99 2L2 17c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm-9 3h2v2h-2V8zm0 3h2v2h-2v-2zM8 8h2v2H8V8zm0 3h2v2H8v-2zm-1 2H5v-2h2v2zm0-3H5V8h2v2zm9 7H8v-2h8v2zm0-4h-2v-2h2v2zm0-3h-2V8h2v2zm3 3h-2v-2h2v2zm0-3h-2V8h2v2z"/>`,
  emoji: `<path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"/>`,
  clipboard: `<path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"/>`,
  devices: `<path d="M4 6h16v10H4V6zm18 12H2v2h20v-2zm-6-9h4v6h-4V9z"/>`,
  code: `<path d="M9.4 16.6L4.8 12l4.6-4.6L8 6l-6 6 6 6 1.4-1.4zm5.2 0l4.6-4.6-4.6-4.6L16 6l6 6-6 6-1.4-1.4z"/>`,
  terminal: `<path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 14H4V8h16v10zm-12-3l3.5-3.5L8 8l1.4-1.4 4.9 4.9-4.9 4.9L8 15zm7 0h4v2h-4v-2z"/>`,
  coffee: `<path d="M20 3H4v10c0 2.21 1.79 4 4 4h6c2.21 0 4-1.79 4-4v-3h2c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 5h-2V5h2v3zM4 19h16v2H4v-2z"/>`,
  lock: `<path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/>`,
  check: `<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>`,
  sync: `<path d="M12 4V1L8 5l4 4V6c3.31 0 6 2.69 6 6 0 1.01-.25 1.97-.7 2.8l1.46 1.46A7.93 7.93 0 0 0 20 12c0-4.42-3.58-8-8-8zm0 14c-3.31 0-6-2.69-6-6 0-1.01.25-1.97.7-2.8L5.24 7.74A7.93 7.93 0 0 0 4 12c0 4.42 3.58 8 8 8v3l4-4-4-4v3z"/>`,
  gallery: `<path d="M21 19V5c0-1.1-.9-2-2-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2zM8.5 13.5l2.5 3.01L14.5 12l4.5 6H5l3.5-4.5z"/>`,
  help: `<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 16h-2v-2h2v2zm1.07-7.75l-.9.92C12.45 11.9 12 12.5 12 14h-2v-.5c0-1.1.45-2.1 1.17-2.83l1.24-1.26c.37-.36.59-.86.59-1.41 0-1.1-.9-2-2-2s-2 .9-2 2H7c0-2.76 2.24-5 5-5s5 2.24 5 5c0 1.04-.42 1.99-1.07 2.65z"/>`,
  scale: `<path d="M12 3L2 12h3v8h14v-8h3L12 3zm0 4.5l5 4.5H7l5-4.5zM12 18a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/>`
};

function renderIcon(name, size, color) {
  let iconSvg = ICONS[name] || ICONS.sparkles;
  // Strictly enforce explicit hex color, no currentColor
  iconSvg = iconSvg.replace(/<path\b(?![^>]*\bfill=)/g, `<path fill="${color}" `);
  iconSvg = iconSvg.replace(/fill="currentColor"/g, `fill="${color}"`);
  const scale = size / 24;
  const offset = -size / 2;
  return `<g transform="translate(${offset}, ${offset}) scale(${scale})">${iconSvg}</g>`;
}

// -------------------------------------------------------------
// 1. ROTATING PIXEL BADGE (Height: 28, Flower Center: 14, 14)
// -------------------------------------------------------------
function generateBadge({ name, label, icon, flowerDark, flowerLight, iconDark, iconLight, width }) {
  const safeLabel = escapeXml(label);

  // DARK with active 8s SMIL rotation + CSS fallback
  const darkSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="28" viewBox="0 0 ${width} 28">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 8s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M14,0H${width - 14}A14,14 0 0 1 ${width},14V14A14,14 0 0 1 ${width - 14},28H14A14,14 0 0 1 0,14V14A14,14 0 0 1 14,0Z" fill="#221b24" stroke="#362938" stroke-width="1"/>
    <g transform="translate(14, 14)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="8s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(0.44)"/>
      </g>
      ${renderIcon(icon, 11, iconDark)}
    </g>
    <text x="27" y="18" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="11.5" font-weight="600" fill="#f0e2ee">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('dark', `badge-${name}.svg`), darkSvg);

  // LIGHT with active 8s SMIL rotation + CSS fallback
  const lightSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="28" viewBox="0 0 ${width} 28">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 8s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M14,0H${width - 14}A14,14 0 0 1 ${width},14V14A14,14 0 0 1 ${width - 14},28H14A14,14 0 0 1 0,14V14A14,14 0 0 1 14,0Z" fill="#f0e5ef" stroke="#ded0dd" stroke-width="1"/>
    <g transform="translate(14, 14)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="8s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(0.44)"/>
      </g>
      ${renderIcon(icon, 11, iconLight)}
    </g>
    <text x="27" y="18" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="11.5" font-weight="600" fill="#261b28">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('light', `badge-${name}.svg`), lightSvg);
}

// -------------------------------------------------------------
// 2. ROTATING ACTION BUTTON (Height: 68, Flower Center: 38, 34)
// -------------------------------------------------------------
function generateButton({ name, sublabel, label, icon, flowerDark, flowerLight, iconDark, iconLight, bgDark, bgLight, textDark, textLight, width = 216 }) {
  const safeSublabel = escapeXml(sublabel.toUpperCase());
  const safeLabel = escapeXml(label);

  // DARK with active 10s SMIL rotation + CSS fallback
  const darkSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="68" viewBox="0 0 ${width} 68">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 10s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M34,1H${width - 34}A33,33 0 0 1 ${width - 1},34V34A33,33 0 0 1 ${width - 34},67H34A33,33 0 0 1 1,34V34A33,33 0 0 1 34,1Z" fill="${bgDark || '#261e27'}" stroke="#3d2f3e" stroke-width="1"/>
    <g transform="translate(38, 34)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="10s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(1.05)" />
      </g>
      ${renderIcon(icon, 24, iconDark)}
    </g>
    <text x="74" y="27" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="10" font-weight="700" fill="${textDark ? textDark + '99' : '#caa7cd'}" letter-spacing="0.08em">${safeSublabel}</text>
    <text x="74" y="47" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="16" font-weight="700" fill="${textDark || '#ffffff'}">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('dark', `btn-${name}.svg`), darkSvg);

  // LIGHT
  const lightSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="68" viewBox="0 0 ${width} 68">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 10s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M34,1H${width - 34}A33,33 0 0 1 ${width - 1},34V34A33,33 0 0 1 ${width - 34},67H34A33,33 0 0 1 1,34V34A33,33 0 0 1 34,1Z" fill="${bgLight || '#f1e6f0'}" stroke="#dccbda" stroke-width="1"/>
    <g transform="translate(38, 34)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="10s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(1.05)" />
      </g>
      ${renderIcon(icon, 24, iconLight)}
    </g>
    <text x="74" y="27" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="10" font-weight="700" fill="${textLight ? textLight + '99' : '#695168'}" letter-spacing="0.08em">${safeSublabel}</text>
    <text x="74" y="47" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="16" font-weight="700" fill="${textLight || '#211824'}">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('light', `btn-${name}.svg`), lightSvg);
}

// -------------------------------------------------------------
// 3. ROTATING HEADER BANNER (1000 x 104, Flower Center: 56, 52)
// -------------------------------------------------------------
function generateHeader({ name, title, subtitle, icon, tags = [], flowerDark, flowerLight, iconDark, iconLight }) {
  const safeTitle = escapeXml(title);
  const safeSubtitle = escapeXml(subtitle);

  function renderTags(tagsList, isDark) {
    let x = 970;
    let out = '';
    const pillBg = isDark ? '#3d2e3f' : '#ddcedd';
    const textColor = isDark ? '#ffffff' : '#221824';
    
    for (let i = tagsList.length - 1; i >= 0; i--) {
      const t = tagsList[i];
      const pillWidth = t.length * 8 + 26;
      x -= pillWidth;
      out += `<g transform="translate(${x}, 36)">
        <rect width="${pillWidth}" height="32" rx="16" fill="${pillBg}"/>
        <text x="${pillWidth / 2}" y="20.5" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="13" font-weight="700" fill="${textColor}" text-anchor="middle">${escapeXml(t)}</text>
      </g>`;
      x -= 10;
    }
    return out;
  }

  // DESKTOP DARK
  const dDark = `<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="104" viewBox="0 0 1000 104">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M52,0H948A52,52 0 0 1 1000,52V52A52,52 0 0 1 948,104H52A52,52 0 0 1 0,52V52A52,52 0 0 1 52,0Z" fill="#231b24"/>
    <g transform="translate(56, 52)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(1.52)" />
      </g>
      ${renderIcon(icon, 36, iconDark)}
    </g>
    <text x="114" y="47" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="32" font-weight="700" fill="#ffffff">${safeTitle}</text>
    <text x="114" y="74" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="15" font-weight="400" fill="#cbb4ca">${safeSubtitle}</text>
    ${renderTags(tags, true)}
  </svg>`;
  saveSvg(path.join('dark', `h-${name}.svg`), dDark);

  // DESKTOP LIGHT
  const dLight = `<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="104" viewBox="0 0 1000 104">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M52,0H948A52,52 0 0 1 1000,52V52A52,52 0 0 1 948,104H52A52,52 0 0 1 0,52V52A52,52 0 0 1 52,0Z" fill="#ede2ed"/>
    <g transform="translate(56, 52)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(1.52)" />
      </g>
      ${renderIcon(icon, 36, iconLight)}
    </g>
    <text x="114" y="47" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="32" font-weight="700" fill="#211824">${safeTitle}</text>
    <text x="114" y="74" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="15" font-weight="400" fill="#675466">${safeSubtitle}</text>
    ${renderTags(tags, false)}
  </svg>`;
  saveSvg(path.join('light', `h-${name}.svg`), dLight);

  // MOBILE RESPONSIVE VERSION (640 x 90, Flower Center: 46, 45)
  const mDark = `<svg xmlns="http://www.w3.org/2000/svg" width="640" height="90" viewBox="0 0 640 90">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M45,0H595A45,45 0 0 1 640,45V45A45,45 0 0 1 595,90H45A45,45 0 0 1 0,45V45A45,45 0 0 1 45,0Z" fill="#231b24"/>
    <g transform="translate(46, 45)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(1.28)" />
      </g>
      ${renderIcon(icon, 30, iconDark)}
    </g>
    <text x="96" y="42" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="25" font-weight="700" fill="#ffffff">${safeTitle}</text>
    <text x="96" y="66" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="13" font-weight="400" fill="#cbb4ca">${safeSubtitle}</text>
  </svg>`;
  saveSvg(path.join('dark', `hm-${name}.svg`), mDark);

  const mLight = `<svg xmlns="http://www.w3.org/2000/svg" width="640" height="90" viewBox="0 0 640 90">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M45,0H595A45,45 0 0 1 640,45V45A45,45 0 0 1 595,90H45A45,45 0 0 1 0,45V45A45,45 0 0 1 45,0Z" fill="#ede2ed"/>
    <g transform="translate(46, 45)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(1.28)" />
      </g>
      ${renderIcon(icon, 30, iconLight)}
    </g>
    <text x="96" y="42" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="25" font-weight="700" fill="#211824">${safeTitle}</text>
    <text x="96" y="66" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="13" font-weight="400" fill="#675466">${safeSubtitle}</text>
  </svg>`;
  saveSvg(path.join('light', `hm-${name}.svg`), mLight);
}

// -------------------------------------------------------------
// 4. ROTATING FEATURE CARD (430 x 218, Flower Center: 64, 60)
// -------------------------------------------------------------
function generateCard({ name, title, lines, icon, flowerDark, flowerLight, iconDark, iconLight }) {
  const safeTitle = escapeXml(title);
  const tLines = lines.map((l, i) => `<tspan x="36" dy="${i === 0 ? 0 : 20}">${escapeXml(l)}</tspan>`).join('');

  // DARK
  const darkSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="430" height="218" viewBox="0 0 430 218">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <clipPath id="c_${name}"><rect width="430" height="218" rx="32" /></clipPath>
    <rect width="430" height="218" rx="32" fill="#1b131c" stroke="#362938" stroke-width="1"/>
    <g clip-path="url(#c_${name})">
      <path d="M440,110 C420,115 390,125 375,115 C360,105 340,65 315,55 C295,47 285,15 305,-5 C325,-25 355,-55 390,-55 C430,-55 470,20 475,50 C480,80 455,105 440,110 Z" fill="#261d28" />
    </g>
    <g transform="translate(64, 60)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(1.18)" />
      </g>
      ${renderIcon(icon, 30, iconDark)}
    </g>
    <text x="36" y="125" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="20" font-weight="700" fill="#ffffff">${safeTitle}</text>
    <text x="36" y="152" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="13.5" font-weight="400" fill="#beabbe">
      ${tLines}
    </text>
  </svg>`;
  saveSvg(path.join('dark', `card-${name}.svg`), darkSvg);

  // LIGHT
  const lightSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="430" height="218" viewBox="0 0 430 218">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 12s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <clipPath id="cl_${name}"><rect width="430" height="218" rx="32" /></clipPath>
    <rect width="430" height="218" rx="32" fill="#f4ebf4" stroke="#e0cee0" stroke-width="1"/>
    <g clip-path="url(#cl_${name})">
      <path d="M440,110 C420,115 390,125 375,115 C360,105 340,65 315,55 C295,47 285,15 305,-5 C325,-25 355,-55 390,-55 C430,-55 470,20 475,50 C480,80 455,105 440,110 Z" fill="#ece0ed" />
    </g>
    <g transform="translate(64, 60)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="12s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(1.18)" />
      </g>
      ${renderIcon(icon, 30, iconLight)}
    </g>
    <text x="36" y="125" font-family="system-ui, -apple-system, 'Google Sans', Roboto, sans-serif" font-size="20" font-weight="700" fill="#211824">${safeTitle}</text>
    <text x="36" y="152" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="13.5" font-weight="400" fill="#5f4e60">
      ${tLines}
    </text>
  </svg>`;
  saveSvg(path.join('light', `card-${name}.svg`), lightSvg);
}

// -------------------------------------------------------------
// 5. ROTATING TECH STACK PILL (Height: 42, Flower Center: 21, 21)
// -------------------------------------------------------------
function generateStackPill({ name, label, icon, flowerDark, flowerLight, iconDark, iconLight, width }) {
  const safeLabel = escapeXml(label);

  // DARK with active 8s SMIL rotation + CSS fallback
  const darkSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="42" viewBox="0 0 ${width} 42">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 8s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M21,0H${width - 21}A21,21 0 0 1 ${width},21V21A21,21 0 0 1 ${width - 21},42H21A21,21 0 0 1 0,21V21A21,21 0 0 1 21,0Z" fill="#231b24" stroke="#362938" stroke-width="1"/>
    <g transform="translate(21, 21)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="8s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerDark}" transform="scale(0.68)" />
      </g>
      ${renderIcon(icon, 17, iconDark)}
    </g>
    <text x="42" y="26" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="14.5" font-weight="600" fill="#f0e2ee">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('dark', `pill-${name}.svg`), darkSvg);

  // LIGHT
  const lightSvg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="42" viewBox="0 0 ${width} 42">
    <defs>
      <style>
        @keyframes m3e-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        .m3e-flower-spin { animation: m3e-spin 8s linear infinite; transform-origin: 0px 0px; }
      </style>
    </defs>
    <path d="M21,0H${width - 21}A21,21 0 0 1 ${width},21V21A21,21 0 0 1 ${width - 21},42H21A21,21 0 0 1 0,21V21A21,21 0 0 1 21,0Z" fill="#f0e5ef" stroke="#ded0dd" stroke-width="1"/>
    <g transform="translate(21, 21)">
      <g class="m3e-flower-spin">
        <animateTransform attributeName="transform" type="rotate" from="0 0 0" to="360 0 0" dur="8s" repeatCount="indefinite"/>
        <path d="${CENTERED_FLOWER_PATH}" fill="${flowerLight}" transform="scale(0.68)" />
      </g>
      ${renderIcon(icon, 17, iconLight)}
    </g>
    <text x="42" y="26" font-family="system-ui, -apple-system, Roboto, sans-serif" font-size="14.5" font-weight="600" fill="#261b28">${safeLabel}</text>
  </svg>`;
  saveSvg(path.join('light', `pill-${name}.svg`), lightSvg);
}

console.log('Generating living M3E animated badges, buttons, headers, and cards for Gboard_Pro...');

// 1. ACTION BUTTONS (216x68 rounded pill)
generateButton({ name: 'download', sublabel: 'STABLE SIGNED BUILD', label: 'Download APK', icon: 'download', flowerDark: '#2E6A45', flowerLight: '#C3EED0', iconDark: '#FFFFFF', iconLight: '#00210E', width: 220 });
generateButton({ name: 'mpp', sublabel: 'MORPHE PATCH ARCHIVE', label: 'Download .mpp', icon: 'package', flowerDark: '#2B4A75', flowerLight: '#D0E1FD', iconDark: '#FFFFFF', iconLight: '#071E3D', width: 224 });
generateButton({ name: 'github', sublabel: 'EXPLORE REPOSITORY', label: 'Source Code', icon: 'github', flowerDark: '#4A3B4F', flowerLight: '#E8DCEB', iconDark: '#FFFFFF', iconLight: '#251A29', width: 210 });
generateButton({ name: 'sponsor', sublabel: 'LIKE GBOARD_PRO?', label: 'Support Project', icon: 'heart', flowerDark: '#853B55', flowerLight: '#FFD8E4', iconDark: '#FFFFFF', iconLight: '#3B071F', width: 224 });
generateButton({ name: 'issues', sublabel: 'HAVE A QUESTION?', label: 'Report Issue', icon: 'bug', flowerDark: '#734375', flowerLight: '#FBD7FC', iconDark: '#FFFFFF', iconLight: '#2C132E', width: 210 });
generateButton({ name: 'license', sublabel: 'OPEN SOURCE MOD', label: 'GPLv3 License', icon: 'license', flowerDark: '#455173', flowerLight: '#D8E2FF', iconDark: '#FFFFFF', iconLight: '#001A41', width: 210 });

// 2. BADGES (Height: 28px)
generateBadge({ name: 'nonroot', label: 'Zero Root Needed', icon: 'shield', flowerDark: '#2E6A45', flowerLight: '#C3EED0', iconDark: '#FFFFFF', iconLight: '#00210E', width: 148 });
generateBadge({ name: 'version', label: 'v18.4.1-V7 Stable', icon: 'rocket', flowerDark: '#6750A4', flowerLight: '#EADDFF', iconDark: '#FFFFFF', iconLight: '#21005D', width: 154 });
generateBadge({ name: 'android', label: 'Android 10 - 16', icon: 'devices', flowerDark: '#006969', flowerLight: '#CCE8E8', iconDark: '#FFFFFF', iconLight: '#002020', width: 140 });
generateBadge({ name: 'arm64', label: 'arm64-v8a ABI', icon: 'code', flowerDark: '#2B4A75', flowerLight: '#D0E1FD', iconDark: '#FFFFFF', iconLight: '#071E3D', width: 136 });
generateBadge({ name: 'rambler', label: 'Gemini Rambler', icon: 'mic', flowerDark: '#8A5128', flowerLight: '#FFDCC1', iconDark: '#FFFFFF', iconLight: '#351500', width: 146 });
generateBadge({ name: 'ai', label: 'AI Writing Tools', icon: 'sparkles', flowerDark: '#776228', flowerLight: '#FFE193', iconDark: '#FFFFFF', iconLight: '#251A00', width: 150 });
generateBadge({ name: 'm3e', label: 'Material 3 Belka', icon: 'keyboard', flowerDark: '#754877', flowerLight: '#FBD7FC', iconDark: '#FFFFFF', iconLight: '#2C132E', width: 148 });
generateBadge({ name: 'coexist', label: 'Side-by-Side Coexist', icon: 'sync', flowerDark: '#3A5E53', flowerLight: '#CCE8DE', iconDark: '#FFFFFF', iconLight: '#042018', width: 168 });
generateBadge({ name: 'gpl', label: 'GPL-3.0 License', icon: 'license', flowerDark: '#455173', flowerLight: '#D8E2FF', iconDark: '#FFFFFF', iconLight: '#001A41', width: 138 });

// 3. HEADERS (Desktop: 1000x104, Mobile: 640x90)
generateHeader({ name: 'overview', title: 'Overview', subtitle: 'Supercharged Gboard with Pixel Gemini Rambler & AI Writing Suite', icon: 'keyboard', tags: ['Rambler Dictation', 'AI Proofread', 'Non-Root'], flowerDark: '#6750A4', flowerLight: '#EADDFF', iconDark: '#FFFFFF', iconLight: '#21005D' });
generateHeader({ name: 'downloads', title: 'Downloads & Releases', subtitle: 'Direct installable APKs, Morphe patch archives, and clean base APK', icon: 'download', tags: ['v18.4.1-V7', 'APK (127MB)', 'Patch (1.6MB)'], flowerDark: '#2E6A45', flowerLight: '#C3EED0', iconDark: '#FFFFFF', iconLight: '#00210E' });
generateHeader({ name: 'showcase', title: 'Visual Showcase', subtitle: 'Tactile Material 3 Belka keys, Rambler dictation & Advanced Settings', icon: 'gallery', tags: ['Belka UI', 'Rambler', 'Settings'], flowerDark: '#3A5E53', flowerLight: '#CCE8DE', iconDark: '#FFFFFF', iconLight: '#042018' });
generateHeader({ name: 'features', title: 'Features & Capabilities', subtitle: 'Comprehensive breakdown of unlocked Google features and optimizations', icon: 'sparkles', tags: ['Rambler', 'Camera OCR', 'Belka Keys'], flowerDark: '#776228', flowerLight: '#FFE193', iconDark: '#FFFFFF', iconLight: '#251A00' });
generateHeader({ name: 'dictation', title: 'Rambler Voice Typing', subtitle: 'Gemini conversational voice engine with zero idle battery drain', icon: 'mic', tags: ['Speech Cleanup', 'Auto Punctuation', 'Direct Boot'], flowerDark: '#8A5128', flowerLight: '#FFDCC1', iconDark: '#FFFFFF', iconLight: '#351500' });
generateHeader({ name: 'writing', title: 'AI Writing Assistant', subtitle: 'Inline grammar proofreading, tone rewriting, and Android 16 safeguards', icon: 'sparkles', tags: ['Proofread', 'Tone Rewrite', 'Tools V2'], flowerDark: '#2A5D75', flowerLight: '#C3E8FF', iconDark: '#FFFFFF', iconLight: '#001E2E' });
generateHeader({ name: 'setup', title: 'Setup & Activation', subtitle: 'Zero-restart live activation for Rambler dictation and AI features', icon: 'sync', tags: ['Instant Reload', 'Live Sync', 'Zero Restart'], flowerDark: '#754877', flowerLight: '#FBD7FC', iconDark: '#FFFFFF', iconLight: '#2C132E' });
generateHeader({ name: 'install', title: 'Installation Methods', subtitle: 'Direct phone installation, ADB sideload, or Morphe Manager on-device', icon: 'terminal', tags: ['Direct APK', 'ADB', 'Morphe Manager'], flowerDark: '#38634B', flowerLight: '#BDEFD2', iconDark: '#FFFFFF', iconLight: '#002111' });
generateHeader({ name: 'stack', title: 'Engineering & Architecture', subtitle: 'Kotlin bytecode transformations, Smali patches & Android runtime extension', icon: 'code', tags: ['Kotlin 2.0', 'Java 21', 'Morphe Patcher'], flowerDark: '#5E5268', flowerLight: '#E8DEF8', iconDark: '#FFFFFF', iconLight: '#1D192B' });
generateHeader({ name: 'specs', title: 'Technical Specifications', subtitle: 'Compatibility matrix, independent package ID, and target builds', icon: 'scale', tags: ['arm64-v8a', 'Android 10-16', 'Gboard 18.4.1'], flowerDark: '#455173', flowerLight: '#D8E2FF', iconDark: '#FFFFFF', iconLight: '#001A41' });
generateHeader({ name: 'support', title: 'Support & Sponsor', subtitle: 'SupportKori, nsave, RedotPay, Payoneer & GitHub Sponsors', icon: 'coffee', tags: ['SupportKori', 'RedotPay', 'Payoneer'], flowerDark: '#853B55', flowerLight: '#FFD8E4', iconDark: '#FFFFFF', iconLight: '#3B071F' });
generateHeader({ name: 'faq', title: 'FAQ & Security', subtitle: 'Answers about non-root safety, coexistence, and hardware requirements', icon: 'help', tags: ['Non-Root', 'Pixel Gated', 'Coexistence'], flowerDark: '#4A3B4F', flowerLight: '#E8DCEB', iconDark: '#FFFFFF', iconLight: '#251A29' });
generateHeader({ name: 'license', title: 'License & Legal Notice', subtitle: 'GNU General Public License v3.0, upstream credits, and trademark notice', icon: 'license', tags: ['GPLv3', 'Open Source', 'Fair Use'], flowerDark: '#006969', flowerLight: '#CCE8E8', iconDark: '#FFFFFF', iconLight: '#002020' });

// 4. BENTO GRID CARDS (430 x 218)
generateCard({
  name: 'rambler',
  title: 'Gemini Rambler Voice',
  lines: [
    'Natural speech cleanup removing filler words,',
    'automatic thought self-correction, instant context',
    'punctuation, and direct-boot offline models.'
  ],
  icon: 'mic',
  flowerDark: '#8A5128', flowerLight: '#FFDCC1', iconDark: '#FFFFFF', iconLight: '#351500'
});

generateCard({
  name: 'ai',
  title: 'In-Line AI Writing Suite',
  lines: [
    'One-tap grammar proofreading, 4 adaptive tone styles,',
    'suggested style chips, describe-your-edit prompt,',
    'and Android 16 quick-insert span guards.'
  ],
  icon: 'sparkles',
  flowerDark: '#2A5D75', flowerLight: '#C3E8FF', iconDark: '#FFFFFF', iconLight: '#001E2E'
});

generateCard({
  name: 'spellcheck',
  title: 'Modern Spell Checker Chips',
  lines: [
    'Bytecode-level hooks forcing Android 12+ inline',
    'suggestion chips, dictionary addition UI, and',
    'system-level Gboard_Pro Spell Checker branding.'
  ],
  icon: 'spellcheck',
  flowerDark: '#6750A4', flowerLight: '#EADDFF', iconDark: '#FFFFFF', iconLight: '#21005D'
});

generateCard({
  name: 'camera',
  title: 'Scan Text OCR & Screenshot',
  lines: [
    'CameraX live viewfinder to extract real-world text',
    'directly into cursor, plus floating screenshot chips',
    'for 1-tap clipboard image pasting.'
  ],
  icon: 'camera',
  flowerDark: '#3A5E53', flowerLight: '#CCE8DE', iconDark: '#FFFFFF', iconLight: '#042018'
});

generateCard({
  name: 'belka',
  title: 'Material 3 Belka Keys',
  lines: [
    'Google\'s expressive pill-shaped rounded keycaps',
    'with dynamic runtime Phenotype flag management and',
    'customizable toggle inside Advanced Settings.'
  ],
  icon: 'keyboard',
  flowerDark: '#754877', flowerLight: '#FBD7FC', iconDark: '#FFFFFF', iconLight: '#2C132E'
});

generateCard({
  name: 'emoji',
  title: 'Emoji Palette V2 & Scaling',
  lines: [
    'Dedicated recent vs. frequent tabs, restored',
    'emoji size slider, and 100% alpha opacity for',
    'vibrant suggestion strip candidates.'
  ],
  icon: 'emoji',
  flowerDark: '#776228', flowerLight: '#FFE193', iconDark: '#FFFFFF', iconLight: '#251A00'
});

generateCard({
  name: 'superinsert',
  title: 'Super Insert & Smart Compose',
  lines: [
    'Unified clipboard, emoji, and contact drawer with',
    'Gmail-style in-line ghost predictions extending',
    'across all third-party Android apps.'
  ],
  icon: 'rocket',
  flowerDark: '#2B4A75', flowerLight: '#D0E1FD', iconDark: '#FFFFFF', iconLight: '#071E3D'
});

generateCard({
  name: 'clipboard',
  title: 'OEM Clipboard & Rapid Learn',
  lines: [
    'Foreground sync resolving Samsung One UI and Vivo',
    'clipboard loss, Delight5 n-gram fast learning,',
    'and primary-key auto-correction revert.'
  ],
  icon: 'clipboard',
  flowerDark: '#2E6A45', flowerLight: '#C3EED0', iconDark: '#FFFFFF', iconLight: '#00210E'
});

// 5. TECH STACK PILLS (Height: 42)
generateStackPill({ name: 'kotlin', label: 'Kotlin 2.0', icon: 'code', flowerDark: '#6750A4', flowerLight: '#EADDFF', iconDark: '#FFFFFF', iconLight: '#21005D', width: 155 });
generateStackPill({ name: 'java', label: 'Java 21', icon: 'terminal', flowerDark: '#2B4A75', flowerLight: '#D0E1FD', iconDark: '#FFFFFF', iconLight: '#071E3D', width: 140 });
generateStackPill({ name: 'android', label: 'Android SDK (API 29-36)', icon: 'devices', flowerDark: '#2E6A45', flowerLight: '#C3EED0', iconDark: '#FFFFFF', iconLight: '#00210E', width: 236 });
generateStackPill({ name: 'smali', label: 'Smali & Bytecode', icon: 'code', flowerDark: '#4A3B4F', flowerLight: '#E8DCEB', iconDark: '#FFFFFF', iconLight: '#251A29', width: 185 });
generateStackPill({ name: 'morphe', label: 'Morphe Patch Engine', icon: 'package', flowerDark: '#8A5128', flowerLight: '#FFDCC1', iconDark: '#FFFFFF', iconLight: '#351500', width: 220 });
generateStackPill({ name: 'gradle', label: 'Gradle 8+ / 9+', icon: 'terminal', flowerDark: '#3A5E53', flowerLight: '#CCE8DE', iconDark: '#FFFFFF', iconLight: '#042018', width: 165 });
generateStackPill({ name: 'camerax', label: 'CameraX OCR', icon: 'camera', flowerDark: '#006969', flowerLight: '#CCE8E8', iconDark: '#FFFFFF', iconLight: '#002020', width: 175 });
generateStackPill({ name: 'm3e', label: 'Material 3 Expressive', icon: 'keyboard', flowerDark: '#754877', flowerLight: '#FBD7FC', iconDark: '#FFFFFF', iconLight: '#2C132E', width: 220 });
generateStackPill({ name: 'de', label: 'Device-Protected Storage', icon: 'lock', flowerDark: '#776228', flowerLight: '#FFE193', iconDark: '#FFFFFF', iconLight: '#251A00', width: 235 });

console.log('Done! All Material 3 Expressive assets generated successfully.');
