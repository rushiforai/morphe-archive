# Analysis notes

Read this file before re-opening smali/java sources. Re-read the source if verify fails or a hypothesis changes.

## Template (copy per class)

```markdown
## fully.qualified.ClassName

**Source:** `analysis/<app>/apktool_out/smali/.../ClassName.smali` (or jadx path)
**Method:** `methodName(Signature)` — lines N–M

**Purpose:** one sentence

**Key methods:**
- `method()` — what it does

**Call chain:**
ClassA.method → ClassB.method → ...

**Verdict:** patch strategy or open question
```
