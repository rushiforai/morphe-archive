"use strict";

const {execFileSync} = require("node:child_process");

const NAME = "johninnl";
const EMAIL = "349981574+johninnl@users.noreply.github.com";
const COAUTHOR = /^\s*co-authored-by\s*:/im;

function git(args, {cwd = process.cwd(), env = process.env} = {}) {
  return execFileSync("git", ["--no-replace-objects", ...args], {
    cwd, env, encoding: "utf8", maxBuffer: 64 * 1024 * 1024,
  }).trim();
}

function verifyMessage(message, label = "commit") {
  if (COAUTHOR.test(message || "")) throw new Error(`${label}: co-author trailers are forbidden`);
}

function verifyHistory(options = {}) {
  if (git(["rev-parse", "--is-shallow-repository"], options) !== "false") {
    throw new Error("Identity audit requires complete history (fetch-depth: 0)");
  }
  const fields = git(["log", "--all", "HEAD", "--format=%H%x00%an%x00%ae%x00%cn%x00%ce%x00%B%x00"], options).split("\0");
  for (let i = 0; i + 5 < fields.length; i += 6) {
    const [hash, author, authorEmail, committer, committerEmail, message] = fields.slice(i, i + 6);
    if (author !== NAME || committer !== NAME || authorEmail !== EMAIL || committerEmail !== EMAIL) {
      throw new Error(`Commit ${hash.trim()} must have only ${NAME} <${EMAIL}> as author and committer`);
    }
    verifyMessage(message, `Commit ${hash.trim()}`);
  }
}

function verifyGitIdentity(options = {}) {
  for (const role of ["AUTHOR", "COMMITTER"]) {
    const identity = git(["var", `GIT_${role}_IDENT`], options);
    if (!identity.startsWith(`${NAME} <${EMAIL}> `)) {
      throw new Error(`Effective Git ${role.toLowerCase()} must be ${NAME} <${EMAIL}>`);
    }
  }
}

function verifyPublisher({env = process.env, release = false, execute = execFileSync} = {}) {
  if (release && (!env.GH_TOKEN || env.GH_TOKEN !== env.GITHUB_TOKEN)) {
    throw new Error("Release requires matching GH_TOKEN and GITHUB_TOKEN from JOHNINNL_RELEASE_TOKEN");
  }
  const login = execute("gh", ["api", "--hostname", "github.com", "user", "--jq", ".login"], {
    env, encoding: "utf8", stdio: ["ignore", "pipe", "pipe"],
  }).trim();
  if (login !== NAME) throw new Error(`GitHub authentication must belong to ${NAME}`);
}

function verifyRelease(_config, context) {
  const options = {cwd: context.cwd, env: context.env};
  verifyPublisher({env: context.env, release: true});
  verifyGitIdentity(options);
  verifyHistory(options);
  verifyMessage(context.nextRelease?.notes, "Release notes");
}

module.exports = {
  NAME, EMAIL, verifyHistory, verifyGitIdentity, verifyMessage, verifyPublisher,
  verifyConditions: verifyRelease,
  // @semantic-release/git commits AND pushes in prepare. Check immediately before it.
  prepare: verifyRelease,
};

if (require.main === module) {
  try {
    const mode = process.argv[2];
    if (!["--history", "--local", "--release"].includes(mode)) {
      throw new Error("Usage: node .github/scripts/verify_identity.cjs --history|--local|--release");
    }
    if (mode !== "--history") {
      verifyPublisher({release: mode === "--release"});
      verifyGitIdentity();
    }
    verifyHistory();
    console.log("Identity checks passed for johninnl");
  } catch (error) {
    console.error(error.message);
    process.exitCode = 1;
  }
}
