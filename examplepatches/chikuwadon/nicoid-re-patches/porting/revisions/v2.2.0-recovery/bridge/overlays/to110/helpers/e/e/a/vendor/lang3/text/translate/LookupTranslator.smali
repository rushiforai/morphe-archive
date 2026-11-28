.class public final Le/e/a/vendor/lang3/text/translate/LookupTranslator;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# instance fields
.field public final longest:I

.field public final lookupMap:Ljava/util/HashMap;

.field public final prefixSet:Ljava/util/HashSet;

.field public final shortest:I


# direct methods
.method public varargs constructor <init>([[Ljava/lang/CharSequence;)V
    .registers 11

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->lookupMap:Ljava/util/HashMap;

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->prefixSet:Ljava/util/HashSet;

    .line 55
    array-length v0, p1

    const v1, 0x7fffffff

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    if-ge v3, v0, :cond_2

    aget-object v5, p1, v3

    .line 56
    iget-object v6, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->lookupMap:Ljava/util/HashMap;

    aget-object v7, v5, v2

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    iget-object v6, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->prefixSet:Ljava/util/HashSet;

    aget-object v7, v5, v2

    invoke-interface {v7, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 58
    aget-object v5, v5, v2

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v5, v1, :cond_0

    move v1, v5

    :cond_0
    if-le v5, v4, :cond_1

    move v4, v5

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 67
    :cond_2
    iput v1, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->shortest:I

    .line 68
    iput v4, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->longest:I

    return-void
.end method


# virtual methods
.method public final translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 8

    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    iget-object v1, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->prefixSet:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 79
    iget v0, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->longest:I

    add-int v1, p2, v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 80
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p2

    .line 83
    :cond_0
    :goto_0
    iget v1, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->shortest:I

    if-lt v0, v1, :cond_2

    add-int v1, p2, v0

    .line 84
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    .line 85
    iget-object v3, p0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;->lookupMap:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 88
    invoke-virtual {p3, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 89
    invoke-static {p1, p2, v1}, Ljava/lang/Character;->codePointCount(Ljava/lang/CharSequence;II)I

    move-result p0

    return p0

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method
