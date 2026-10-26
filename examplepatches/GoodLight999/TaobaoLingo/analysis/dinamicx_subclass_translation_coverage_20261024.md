# Real Taobao 10.66.30: subclass text-attribute translation coverage

Date: 2026-10-24. Source: the original APK with exact SHA-256
`3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`
(13 DEX; 102,873 class definitions; 595,518 implemented methods).

## New observed limitation in the four-method patch

The existing experimental label patch changes only the two classes
`Ltb/gi6;` (DXButterTextWidgetNode) and `Ltb/cx5;` (DXFastTextWidgetNode), each
with `setText(CharSequence)` and `onSetStringAttribute(long,String)`.

Independent original-DEX superclass traversal and instruction scanning found:

| Observation | Exact count |
|---|---:|
| Classes transitively derived from `Ltb/gi6;` | **43** |
| Classes transitively derived from `Ltb/cx5;` | **3** |
| Descendant overrides of `onSetStringAttribute(J,String)` | **31** (all `gi6` lineage) |
| Descendant overrides of `setText(CharSequence)` | **0** |
| Attribute overrides with writes to their own `String` / `CharSequence` fields | **24** |
| Override methods with such fields written **before** an invoke-super attribute call | **12** |
| Override methods with such fields written **after** an invoke-super attribute call | **12** |

Every observed attribute override contains an invoke-super instruction (sometimes
to an intermediate subclass). **This does not make translation complete**:
the subclass may save the original `String` argument into its own fields
before invoking the translated base class, or save it later using the
unchanged original subclass argument. Modifying the parent method's parameter
register does **not** rewrite the caller/subclass's parameter register.

Examples include
`Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMsgTextViewWidgetNode;`
(stores its own `text:Ljava/lang/String;` before calling the base),
`Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMPTextViewWidgetNode;`,
`Ltb/oe6;`, `Ltb/db6;`, and
`Lcom/taobao/android/dinamicx/widget/b0;`. These are **potential
untranslated data paths**, not proof that a visible My Taobao label is
rendered from those fields. Branch and attribute-hash predicates may make
some writes irrelevant, so the 24-class number is an *upper-bound candidate
count*, not 24 confirmed bugs.

The scan traversed actual method bytecodes from the supplied app. The analyzer
`tests/AnalyzeDinamicXRoutes.java` now emits its own subclass-override
section, superclass lineage and field-write position evidence alongside its
existing callgraph. The independent Python audit used for this observation
is retained in local diagnostic output, not committed as proprietary binary.

## Causal interpretation

1. A base-class translation works in a controlled Android fixture, and
   a real Taobao STRIP_SAFE APK has exactly four intended bytecode changes.
2. Some real application subclasses maintain **additional text storage**.
   Changing four base-class methods need not change what all custom view
   renderers see.
3. Dynamic server templates select widget types, and the original My Taobao
   manifest points to six remotely versioned templates different from bundled
   versions. Thus static APK inspection alone cannot establish which
   subclass handles the visible Account tab.
4. A future safe extension must instrument or translate only proven TEXT
   attribute inputs **before each relevant subclass writes a text field**,
   then re-run the full DEX method-difference audit and device behavior
   checks. Patching all 24 candidates indiscriminately would broaden
   attack surface, incur 108-label match overhead per method, and risk
   breaking application-specific handling.

## Scope

**The user-visible Taobao UI remains unverified as English, and Account/login
are not fixed.** No OCR/overlay functionality, native library modifications
or additional class injections were made. The published v0.2.5 patch remains
the minimal conservative four-hook experiment while subclass coverage is
investigated.
