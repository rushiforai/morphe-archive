const { readFileSync, mkdirSync, writeFileSync } = require("node:fs");
const { transformSync } = require("esbuild");

const source = readFileSync("patches/src/main/resources/local-server.js", "utf8");
const arrow = readFileSync("patches/src/main/resources/artwork/local-server-arrow.png");
const result = transformSync(source, {
  target: "es2015",
  format: "cjs",
  define: { LOCAL_SERVER_ARROW: JSON.stringify("data:image/png;base64," + arrow.toString("base64")) },
});
mkdirSync("patches/build/generated-resources", { recursive: true });
writeFileSync("patches/build/generated-resources/local-server.runtime.js", result.code);
