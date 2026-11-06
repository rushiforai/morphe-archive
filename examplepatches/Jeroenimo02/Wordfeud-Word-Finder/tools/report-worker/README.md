# Report worker

A Cloudflare Worker that receives words the Wordfeud server rejected (sent automatically by the patch) and forwards
them to GitHub. The workflow `.github/workflows/wordlist-report.yml` then puts them in
`wordlists/<language>/remove.txt` on the branch `wordlist/<language>` and keeps one pull request per language open
towards `main`. Nothing changes for users until you merge that pull request.

```
patch ──POST /report──▶ worker ──repository_dispatch──▶ GitHub Action ──▶ branch wordlist/nl + PR to main
```

The patch sends only `{"ruleset": 2, "words": ["NDJ"], "patch": "1.1.0"}`: no user name, game, cookie or device id.
The worker stores and logs nothing itself. Anyone can call the endpoint, so the worker validates strictly
(ruleset 0-12, 1-8 words of 2-15 letters) and the workflow only removes words that are actually in the list. Your
review of the pull request is the final check.

## Setting it up (once)

1. **GitHub token.** GitHub → Settings → Developer settings → Personal access tokens → *Fine-grained tokens* →
   *Generate new token*.
   - Repository access: *Only select repositories* → `Wordfeud-Word-Finder`.
   - Permissions → Repository permissions → **Contents: Read and write** (needed to send a repository_dispatch).
     Nothing else.
   - Choose an expiry date and note it; the worker stops forwarding when the token expires.
2. **Allow the workflow to open pull requests.** In the repository: Settings → Actions → General →
   *Workflow permissions* → tick **Allow GitHub Actions to create and approve pull requests**.
3. **Cloudflare account** (free plan is enough): https://dash.cloudflare.com/sign-up
4. **Deploy** (needs Node.js 18+), from this folder:
   ```sh
   npx wrangler login
   npx wrangler deploy
   npx wrangler secret put GITHUB_TOKEN     # paste the token from step 1
   ```
   `wrangler deploy` prints the address, e.g. `https://wordfeud-word-report.<your-subdomain>.workers.dev`.
5. **Connect the patch.** Put the address plus `/report` in `gradle.properties` as `wordReportUrl=...` (this project: `https://wordfeud-word-report.jeroenimo02.workers.dev/report`) and release
   a new version. Builds without `wordReportUrl` do not report anything.

## Rate limit (recommended)

The worker allows at most 20 reports per IP address per hour when a KV namespace is bound as `REPORT_KV`
(only a hashed IP prefix and a counter are stored, for two hours). Without it there is no limit. In the dashboard:

1. Storage & Databases → **KV** → *Create namespace*, name it `wordfeud-report-limits`.
2. Your worker → Settings → **Bindings** → *Add* → **KV namespace**: variable name `REPORT_KV`, namespace
   `wordfeud-report-limits`. Deploy.
3. Paste the current `src/index.js` again (Edit code → Deploy) if your copy is older than this README.

(With `wrangler deploy` the `[[ratelimits]]` block in `wrangler.toml` works as well.)

## Usage numbers

Once a day (when Wordfeud shows the games list) the patch also sends `{"type":"ping","patch":"1.2.3","rulesets":[2]}`.
The worker only counts these per day, version and language in `REPORT_KV` (key `stats:YYYY-MM-DD`); they are not
forwarded to GitHub. To see the numbers, add a secret once: worker → Settings → Variables and Secrets → *Add* →
type **Secret**, name `STATS_KEY`, any long random value. Then open
`https://wordfeud-word-report.jeroenimo02.workers.dev/stats?key=<that value>`. Without `STATS_KEY` the page does
not exist (404). Note: the free plan allows 1,000 KV writes a day; each ping uses two (rate limit + counter).

## Trying it

```sh
curl -i -X POST https://wordfeud-word-report.<your-subdomain>.workers.dev/report \
  -H 'content-type: application/json' -d '{"ruleset": 2, "words": ["NDJ"], "patch": "test"}'
```

`202 accepted` means GitHub received it; the run appears under Actions → *Word list reports*. A word that is not in
the list (like `NDJ`) is ignored there, so this test changes nothing.

## Tests

```sh
node tools/report-worker/test.mjs
```
