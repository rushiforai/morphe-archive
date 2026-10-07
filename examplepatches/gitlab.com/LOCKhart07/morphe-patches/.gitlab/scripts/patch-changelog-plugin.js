// @MorpheApp/changelog only parses github.com repository URLs.
// Widen its regex so it also accepts gitlab.com when writing patches-bundle.json.
const fs = require("fs");
const path = require("path");

const file = path.join(__dirname, "..", "..", "node_modules", "@MorpheApp", "changelog", "lib", "prepare.js");
if (!fs.existsSync(file)) process.exit(0);

const source = fs.readFileSync(file, "utf8");
const patched = source.replace("/github\\.com[/:]", "/(?:github|gitlab)\\.com[/:]");
if (patched !== source) fs.writeFileSync(file, patched);
