# Smali Cheat Sheet

Quick reference for reading and writing Dalvik smali bytecode.

## Type Descriptors

| Smali | Java | Example |
|-------|------|---------|
| `V` | void | return type |
| `Z` | boolean | |
| `B` | byte | |
| `S` | short | |
| `C` | char | |
| `I` | int | |
| `J` | long (2 registers) | |
| `F` | float | |
| `D` | double (2 registers) | |
| `Ljava/lang/String;` | String | object types start with L, end with ; |
| `[I` | int[] | arrays prefix with [ |
| `[Ljava/lang/String;` | String[] | |
| `[[I` | int[][] | |

## Method Signatures

```smali
# Format: .method <access> <name>(<params>)<return>
.method public static isPremium(Lcom/app/User;)Z
#        ^^^^^^ ^^^^^^ ^^^^^^^^^  ^^^^^^^^^^^^^^^^ ^
#        access  flags   name      parameter       return (boolean)

# Multiple parameters
.method public check(Ljava/lang/String;IZ)V
#                     String, int, boolean → void
```

## Registers

```smali
.registers 5    # Total registers (v0-v4)
# OR
.locals 3       # Local registers only (v0-v2), params are p0-p1

# For non-static methods:
# p0 = this
# p1 = first parameter
# p2 = second parameter

# For static methods:
# p0 = first parameter
# p1 = second parameter

# Wide types (long/double) use 2 consecutive registers:
# p0 = long value (uses p0 AND p1)
# p2 = next parameter
```

## Common Opcodes

### Constants
```smali
const/4 v0, 0x0          # int 0 (or false) — 4-bit value (-8 to 7)
const/4 v0, 0x1          # int 1 (or true)
const/16 v0, 0x100       # int 256 — 16-bit value
const v0, 0x12345        # int — 32-bit value
const-wide v0, 0x1234L   # long (uses v0 AND v1)
const-string v0, "text"  # String
const-class v0, Lcom/app/MyClass;  # Class reference
```

### Return
```smali
return-void              # void method
return v0                # return int/boolean/float
return-wide v0           # return long/double
return-object v0         # return object/array/String
```

### Move
```smali
move v0, v1              # copy int register
move-wide v0, v2         # copy long/double (2 regs)
move-object v0, v1       # copy object reference
move-result v0           # get return value after invoke
move-result-wide v0      # get long/double return
move-result-object v0    # get object return
```

### Invoke (method calls)
```smali
# Virtual method (normal instance method)
invoke-virtual {v0, v1}, Lcom/app/Foo;->bar(I)V
#               ^this ^param  ^class    ^method(int)void

# Static method
invoke-static {v0}, Lcom/app/Foo;->check(Z)Z
#              ^param  ^class     ^method(boolean)boolean

# Direct method (constructor or private)
invoke-direct {p0}, Ljava/lang/Object;-><init>()V

# Interface method
invoke-interface {v0}, Ljava/util/Map;->size()I

# Super method
invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
```

### Fields
```smali
# Instance field
iget v0, p0, Lcom/app/Foo;->count:I          # get int field
iput v0, p0, Lcom/app/Foo;->count:I          # set int field
iget-object v0, p0, Lcom/app/Foo;->name:Ljava/lang/String;
iput-object v0, p0, Lcom/app/Foo;->name:Ljava/lang/String;
iget-boolean v0, p0, Lcom/app/Foo;->active:Z

# Static field
sget-object v0, Lcom/app/State;->PREMIUM:Lcom/app/State;
sput-boolean v0, Lcom/app/Foo;->isPro:Z
```

### Branching
```smali
if-eqz v0, :label       # if v0 == 0 (false/null)
if-nez v0, :label       # if v0 != 0 (true/non-null)
if-eq v0, v1, :label    # if v0 == v1
if-ne v0, v1, :label    # if v0 != v1
if-lt v0, v1, :label    # if v0 < v1
if-ge v0, v1, :label    # if v0 >= v1
if-gt v0, v1, :label    # if v0 > v1
if-le v0, v1, :label    # if v0 <= v1
goto :label              # unconditional jump

:label                   # label definition
```

### Object Operations
```smali
new-instance v0, Lcom/app/Foo;                    # allocate
invoke-direct {v0}, Lcom/app/Foo;-><init>()V      # constructor
check-cast v0, Lcom/app/Foo;                      # cast
instance-of v0, v1, Lcom/app/Foo;                 # instanceof check
```

### Array Operations
```smali
new-array v0, v1, [I                # new int[v1]
array-length v0, v1                 # v0 = v1.length
aget v0, v1, v2                     # v0 = v1[v2] (int)
aput v0, v1, v2                     # v1[v2] = v0
aget-object v0, v1, v2             # object array get
aput-object v0, v1, v2             # object array put
fill-array-data v0, :array_data    # fill from data
```

## Common Patch Patterns in Smali

### Return true at start
```smali
const/4 v0, 0x1
return v0
```

### Return false at start
```smali
const/4 v0, 0x0
return v0
```

### Return void (skip method)
```smali
return-void
```

### Return null object
```smali
const/4 v0, 0x0
return-object v0
```

### Return static enum field
```smali
sget-object v0, Lcom/app/Tier;->PRO:Lcom/app/Tier;
return-object v0
```

### Call extension and return result
```smali
invoke-static { }, Lapp/ext/MyPatch;->isEnabled()Z
move-result v0
return v0
```

### Conditional skip with extension
```smali
invoke-static { }, Lapp/ext/MyPatch;->shouldSkip()Z
move-result v0
if-eqz v0, :continue
return-void
:continue
nop
```

### Override return value with extension
```smali
invoke-static { v0 }, Lapp/ext/MyPatch;->override(Z)Z
move-result v0
```

### Return string
```smali
const-string v0, "spoofed_hash_value"
return-object v0
```

## Access Flags

| Flag | Value | Meaning |
|------|-------|---------|
| `public` | 0x1 | |
| `private` | 0x2 | |
| `protected` | 0x4 | |
| `static` | 0x8 | |
| `final` | 0x10 | |
| `synchronized` | 0x20 | |
| `bridge` | 0x40 | compiler-generated |
| `varargs` | 0x80 | |
| `native` | 0x100 | |
| `abstract` | 0x400 | |
| `strictfp` | 0x800 | |
| `synthetic` | 0x1000 | compiler-generated |
| `constructor` | 0x10000 | `<init>` or `<clinit>` |

## Reading Smali Tips

1. `p0` in non-static methods = `this`
2. Wide types (J, D) consume 2 registers
3. `move-result` must immediately follow `invoke-*`
4. Labels (`:label`) are jump targets
5. `.line N` comments show original Java line numbers
6. `# virtual methods` section = overridable methods
7. `# direct methods` section = constructors + private methods
