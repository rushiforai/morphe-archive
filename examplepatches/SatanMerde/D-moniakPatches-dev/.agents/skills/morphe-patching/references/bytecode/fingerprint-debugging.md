# Fingerprint Debugging — When Things Don't Match

How to diagnose and fix fingerprints that fail to match.

## Common Error Messages

### "Failed to match the fingerprint"
The fingerprint didn't find ANY method matching all criteria.

**Diagnosis steps:**
1. Is the app version correct? Check `aapt dump badging`
2. Did the method move to a different DEX? Search all DEX files
3. Did the obfuscated name change? (shouldn't matter if fingerprint is correct)
4. Did the method signature change? Check smali

### "Fingerprint declared no instruction filters"
You're accessing `instructionMatches` but the fingerprint has no `filters`.

**Fix:** Add `filters` or use `strings` + `stringMatches` instead.

## Debugging Workflow

### Step 1: Verify the method still exists
```bash
# Search for key SDK method calls that should be in the target
rg "getEntitlements|getActive" analysis/<app>/decompiled/ -g "*.java" -l

# If not found, the app may have changed its billing SDK
```

### Step 2: Read the actual smali
```bash
# Find the class
find analysis/<app>/smali/ -name "*.smali" | xargs rg "getEntitlements" -l

# Read the method
rg -A 30 "\.method" analysis/<app>/smali/<dex>/<class>.smali
```

### Step 3: Compare fingerprint vs smali

| Fingerprint field | Check in smali |
|-------------------|---------------|
| `returnType = "Z"` | `.method ... )Z` — last char before newline |
| `accessFlags = PUBLIC, STATIC` | `.method public static` — exact match |
| `parameters = listOf("Lcom/...")` | `.method ...(Lcom/...)` — between parentheses |
| `filters: methodCall(name = "getX")` | `invoke-virtual ... ->getX(` — in order |
| `filters: string("text")` | `const-string ... "text"` — in order |

### Step 4: Common mismatches

**Access flags wrong:**
```
Fingerprint: PUBLIC, STATIC
Smali:       public static final    ← FINAL is extra!
Fix:         accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)
```

**Parameter type changed:**
```
Fingerprint: parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;")
Smali:       .method ...(Lcom/revenuecat/purchases/models/CustomerInfo;)
                                                    ^^^^^^^^ package changed!
Fix:         Update the parameter type
```

**Filter order wrong:**
```
Fingerprint: filters = listOf(methodCall("getActive"), methodCall("getEntitlements"))
Smali:       invoke getEntitlements THEN invoke getActive
Fix:         Swap filter order to match smali instruction order
```

**Method moved to different class:**
```
Old: class yz/u has the method
New: class ab/c has the method (obfuscated names changed)
Fix: Don't use definingClass for obfuscated classes
```

## Fingerprint Robustness Tips

### DO ✅
```kotlin
// Use SDK class names (never change)
methodCall(definingClass = "Lcom/revenuecat/purchases/CustomerInfo;", name = "getEntitlements")

// Use return type + parameters (structural, stable)
returnType = "Z"
parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;")

// Use string constants (usually stable)
string("premium_entitlement")

// Use classFingerprint for obfuscated classes
classFingerprint = Fingerprint(name = "toString", strings = listOf("SubscriptionState("))
```

### DON'T ❌
```kotlin
// Don't use obfuscated class names
definingClass = "Lyz/u;"  // Changes every update!

// Don't use obfuscated method names
name = "e"  // Changes every update!

// Don't use obfuscated field names
fieldAccess(name = "a")  // Changes every update!

// Don't over-specify (too many filters = fragile)
filters = listOf(/* 10+ filters */)  // Likely to break
```

### Use "L" for obfuscated parameter types
```kotlin
// If a parameter is an obfuscated class:
parameters = listOf("L")  // Matches ANY object type
// Instead of:
parameters = listOf("Lyz/u;")  // Breaks on update
```

## Advanced Debugging

### Multiple methods match
If your fingerprint is too broad, multiple methods may match. Add more filters to narrow it down.

### Method inlined by R8
R8 may inline small methods. The target method no longer exists — its code was merged into the caller.
**Fix:** Find the caller method instead and patch there.

### Method split by R8
R8 may split a method into multiple smaller methods.
**Fix:** Use `classFingerprint` to find the class, then match the specific split method.

### Verify with matchOrNull
```kotlin
execute {
    val method = MyFingerprint.methodOrNull
    if (method == null) {
        // Fingerprint didn't match — log and skip gracefully
        Logger.getLogger(this::class.java.name)
            .warning("Fingerprint not found, skipping patch")
        return@execute
    }
    // Patch the method
    method.returnEarly(true)
}
```
Start with minimal fingerprint and add filters one by one:
```kotlin
// Start with just return type (object form is preferred)
object TestFingerprint : Fingerprint(returnType = "Z")
// Too many matches? Add access flags — list every flag exactly as in smali
object TestFingerprint : Fingerprint(returnType = "Z", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC))
// Still too many? Add parameters
object TestFingerprint : Fingerprint(returnType = "Z", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"))
// Now unique? Add filters for safety
```

## Quick Checklist

When a fingerprint fails:
- [ ] App version matches what fingerprint was written for?
- [ ] Access flags exact match? (PUBLIC vs PUBLIC FINAL)
- [ ] Parameter types exact match? (check full package path)
- [ ] Return type correct?
- [ ] Filters in correct order? (must match smali instruction order)
- [ ] No obfuscated names used?
- [ ] Method not inlined/split by R8?
- [ ] Correct DEX file? (method may be in different classesN.dex)
