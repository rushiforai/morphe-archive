.class public final Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;
.super Ljava/lang/Object;
.source "PublicSuffixTrie.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;
    }
.end annotation


# static fields
.field static final CHILDREN_MASK:I = 0x7ff

.field static final EXACT_SHIFT:I = 0xe

.field static final EXCLUSION_MASK:I = 0x1

.field static final EXCLUSION_SHIFT:I = 0xb

.field static final NODE_SIZE:I = 0x3

.field static final TYPE_MASK:I = 0x3

.field static final WILDCARD_SHIFT:I = 0xc


# instance fields
.field final stringPool:Ljava/lang/CharSequence;

.field final trieData:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableList;Lcom/google/common/collect/ImmutableList;I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "trieDataChunks",
            "stringPoolChunks",
            "chunkShift"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/CharSequence;",
            ">;",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/CharSequence;",
            ">;I)V"
        }
    .end annotation

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;

    invoke-direct {v0, p1, p3}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;-><init>(Lcom/google/common/collect/ImmutableList;I)V

    iput-object v0, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->trieData:Ljava/lang/CharSequence;

    .line 91
    new-instance p1, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;

    invoke-direct {p1, p2, p3}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;-><init>(Lcom/google/common/collect/ImmutableList;I)V

    iput-object p1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->stringPool:Ljava/lang/CharSequence;

    return-void
.end method

.method private compareLabel(Ljava/lang/String;I)I
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "label",
            "offset"
        }
    .end annotation

    .line 212
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 213
    iget-object v1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->stringPool:Ljava/lang/CharSequence;

    invoke-interface {v1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 214
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 216
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 217
    iget-object v5, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->stringPool:Ljava/lang/CharSequence;

    add-int/lit8 v6, p2, 0x1

    add-int/2addr v6, v3

    invoke-interface {v5, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_0

    sub-int/2addr v4, v5

    return v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    sub-int/2addr v0, v1

    return v0
.end method

.method private findChild(IILjava/lang/String;)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "firstChild",
            "numChildren",
            "label"
        }
    .end annotation

    add-int/2addr p2, p1

    add-int/lit8 p2, p2, -0x1

    :goto_0
    if-gt p1, p2, :cond_2

    add-int v0, p1, p2

    ushr-int/lit8 v0, v0, 0x1

    .line 193
    iget-object v1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->trieData:Ljava/lang/CharSequence;

    mul-int/lit8 v2, v0, 0x3

    invoke-interface {v1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 194
    invoke-direct {p0, p3, v1}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->compareLabel(Ljava/lang/String;I)I

    move-result v1

    if-gez v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    move p2, v0

    goto :goto_0

    :cond_0
    if-lez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    move p1, v0

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method private static getExactMatchType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metadata"
        }
    .end annotation

    shr-int/lit8 p0, p0, 0xe

    and-int/lit8 p0, p0, 0x3

    .line 166
    invoke-static {p0}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->getType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    move-result-object p0

    return-object p0
.end method

.method private static getType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "typeBits"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    .line 175
    sget-object p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixType;->REGISTRY:Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    return-object p0

    :cond_0
    const/4 v0, 0x2

    if-ne p0, v0, :cond_1

    .line 177
    sget-object p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixType;->PRIVATE:Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getWildcardMatchType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metadata"
        }
    .end annotation

    shr-int/lit8 p0, p0, 0xc

    and-int/lit8 p0, p0, 0x3

    .line 170
    invoke-static {p0}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->getType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    move-result-object p0

    return-object p0
.end method

.method private static isExcludedMatch(I)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metadata"
        }
    .end annotation

    shr-int/lit8 p0, p0, 0xb

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static matchesType(Lcom/google/thirdparty/publicsuffix/PublicSuffixType;Lcom/google/thirdparty/publicsuffix/PublicSuffixType;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "desiredType",
            "actualType"
        }
    .end annotation

    if-eqz p1, :cond_1

    if-eqz p0, :cond_0

    .line 158
    invoke-virtual {p0, p1}, Lcom/google/thirdparty/publicsuffix/PublicSuffixType;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public findSuffixIndex(Ljava/util/List;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "labels"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p0, p1, v0}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->findSuffixIndex(Ljava/util/List;Lcom/google/thirdparty/publicsuffix/PublicSuffixType;)I

    move-result p0

    return p0
.end method

.method public findSuffixIndex(Ljava/util/List;Lcom/google/thirdparty/publicsuffix/PublicSuffixType;)I
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "labels",
            "desiredType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/thirdparty/publicsuffix/PublicSuffixType;",
            ")I"
        }
    .end annotation

    .line 115
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    move v3, v2

    :goto_0
    if-ltz v0, :cond_3

    .line 122
    iget-object v4, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->trieData:Ljava/lang/CharSequence;

    mul-int/lit8 v1, v1, 0x3

    add-int/lit8 v5, v1, 0x1

    invoke-interface {v4, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 123
    iget-object v5, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->trieData:Ljava/lang/CharSequence;

    add-int/lit8 v1, v1, 0x2

    invoke-interface {v5, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    and-int/lit16 v1, v1, 0x7ff

    .line 125
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v4, v1, v5}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->findChild(IILjava/lang/String;)I

    move-result v1

    if-eq v1, v2, :cond_3

    .line 131
    iget-object v4, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->trieData:Ljava/lang/CharSequence;

    mul-int/lit8 v5, v1, 0x3

    add-int/lit8 v5, v5, 0x2

    invoke-interface {v4, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 136
    invoke-static {v4}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->isExcludedMatch(I)Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v3, v0, 0x1

    .line 141
    :cond_0
    invoke-static {v4}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->getExactMatchType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    move-result-object v5

    .line 142
    invoke-static {p2, v5}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->matchesType(Lcom/google/thirdparty/publicsuffix/PublicSuffixType;Lcom/google/thirdparty/publicsuffix/PublicSuffixType;)Z

    move-result v5

    if-eqz v5, :cond_1

    move v3, v0

    .line 148
    :cond_1
    invoke-static {v4}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->getWildcardMatchType(I)Lcom/google/thirdparty/publicsuffix/PublicSuffixType;

    move-result-object v4

    if-lez v0, :cond_2

    .line 149
    invoke-static {p2, v4}, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;->matchesType(Lcom/google/thirdparty/publicsuffix/PublicSuffixType;Lcom/google/thirdparty/publicsuffix/PublicSuffixType;)Z

    move-result v4

    if-eqz v4, :cond_2

    add-int/lit8 v3, v0, -0x1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    return v3
.end method
