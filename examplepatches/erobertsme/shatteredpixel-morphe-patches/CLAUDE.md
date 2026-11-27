# Cloverlord Patches

## Language

- Use US English spelling only, everywhere: code, comments, UI text, docs, commit messages and replies. For example: color, center, canceled, labeled, toward, checked/unchecked, math.
- One exception: always spell it "grey" (and "greyed"), never "gray".
- Never use non-US spelling unless explicitly asked.
- Names from the game itself stay as the game spells them (for example `Chrome.Type.GREY_BUTTON`).

## Code

- One implementation per concept. Write separate code only when the behavior is genuinely different, so shared concepts (tags, saves, windows, pickers) can be reused by new features.
- No comments except doc comments.
- Guard clauses instead of nesting; an early return or exit stays on a single line.
- Tabs for indentation.
