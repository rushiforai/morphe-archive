# Task Validation: <change-name>

- Validated against: live framework/library/tool documentation
- Validation date: YYYY-MM-DD
- Verdict: <!-- READY | NEEDS_FIX -->

---

## INVALID — requires revision

<!-- One <task id> per failing task. Use the exact task id from tasks.md (e.g. 2.3). -->

### <task id>

#### <short title of the invalid detail>

- <invalid detail as it appears in the task>
  - **Fix**: <exact fix — how to do it right>
  - **Evidence**: <source url>

#### <second invalid detail short title>

- <invalid detail as it appears in the task>
  - **Fix**: <exact fix>
  - **Evidence**: <source url>

### <task id>

#### <short title of the invalid detail>

- <invalid detail as it appears in the task>
  - **Fix**: <exact fix>
  - **Evidence**: <source url>

<!-- If no invalid findings: state "None." and skip the per-task headings. -->

---

## VALID — confirmed

<!-- Notable confirmations only. One <task id> per confirmed task. -->

### <task id>

- <notable confirmation — a claim that matches live documentation>
  - **Evidence**: <source url>

### <task id>

- <notable confirmation>
  - **Evidence**: <source url>

<!-- If nothing notable: state "No notable confirmations." -->

---

## Fixes needed

<!-- Consolidated list, one per distinct root cause. A single invalid API reference often appears in multiple tasks, specs, and design prose. -->

- <cross-cutting root cause>
  - **Affected**: <tasks / specs / design / adr — where the same invalid detail appears>
  - **Fix**: <exact fix>
  - **Evidence**: <source url>

---

## Verdict

<!-- Exactly one of the following lines, verbatim. This is the source of truth enforcement tooling reads. -->

`VERDICT: READY`

<!-- or -->

`VERDICT: NEEDS_FIX`
