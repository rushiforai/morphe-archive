.class public final Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0004\u0018\u0000 \r2\u00020\u0001:\u0001\rB\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\u0007J\u0016\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00070\n2\u0006\u0010\u0008\u001a\u00020\u0007H\u0002J\u001c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00070\n2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00070\nH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;",
        "",
        "publicSuffixList",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;)V",
        "getEffectiveTldPlusOne",
        "",
        "domain",
        "splitDomain",
        "",
        "findMatchingRule",
        "domainLabels",
        "Companion",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

.field private static final EXCEPTION_MARKER:C = '!'

.field private static final PREVAILING_RULE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final WILDCARD_LABEL:Lnicoid/network238/okio/ByteString;

.field private static instance:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;


# instance fields
.field private final publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    .line 151
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const/4 v1, 0x1

    new-array v1, v1, [B

    const/16 v2, 0x2a

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->of([B)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->WILDCARD_LABEL:Lnicoid/network238/okio/ByteString;

    .line 152
    const-string v0, "*"

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->PREVAILING_RULE:Ljava/util/List;

    .line 156
    new-instance v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    sget-object v1, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList_androidKt;->getDefault(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;)Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;-><init>(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->instance:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;
    .registers 1

    .line 28
    sget-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->instance:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    return-object v0
.end method

.method public static final synthetic access$setInstance$cp(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;)V
    .registers 1

    .line 28
    sput-object p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->instance:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    return-void
.end method

.method private final findMatchingRule(Ljava/util/List;)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->ensureLoaded()V

    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v1, v0, [Lnicoid/network238/okio/ByteString;

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    sget-object v4, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move p1, v2

    :goto_1
    const/4 v3, 0x0

    if-ge p1, v0, :cond_1

    .line 91
    sget-object v4, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    invoke-interface {v5}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->getBytes()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    # invokes: Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->binarySearch(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;
    invoke-static {v4, v5, v1, p1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->access$binarySearch(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 85
    :cond_1
    move-object v4, v3

    .line 91
    :cond_2
    const/4 p1, 0x1

    if-le v0, p1, :cond_4

    .line 105
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lnicoid/network238/okio/ByteString;

    .line 106
    array-length v6, v5

    sub-int/2addr v6, p1

    move v7, v2

    :goto_2
    if-ge v7, v6, :cond_4

    .line 107
    sget-object v8, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->WILDCARD_LABEL:Lnicoid/network238/okio/ByteString;

    aput-object v8, v5, v7

    .line 108
    sget-object v8, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    invoke-interface {v9}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->getBytes()Lnicoid/network238/okio/ByteString;

    move-result-object v9

    # invokes: Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->binarySearch(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;
    invoke-static {v8, v9, v5, v7}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->access$binarySearch(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_3

    move-object v9, v8

    goto :goto_3

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_4
    move-object v9, v3

    :goto_3
    if-eqz v9, :cond_6

    sub-int/2addr v0, p1

    move v5, v2

    :goto_4
    if-ge v5, v0, :cond_6

    .line 121
    sget-object v6, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    iget-object v7, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->publicSuffixList:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    invoke-interface {v7}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->getExceptionBytes()Lnicoid/network238/okio/ByteString;

    move-result-object v7

    # invokes: Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->binarySearch(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;
    invoke-static {v6, v7, v1, v5}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->access$binarySearch(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_5

    move-object v3, v6

    goto :goto_5

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_6
    :goto_5
    const/16 v0, 0x2e

    if-eqz v3, :cond_7

    .line 134
    const-string v1, "!"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 135
    new-array v5, p1, [C

    aput-char v0, v5, v2

    const/4 v8, 0x6

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_7
    if-nez v4, :cond_8

    if-nez v9, :cond_9

    .line 137
    sget-object p1, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->PREVAILING_RULE:Ljava/util/List;

    return-object p1

    :cond_8
    nop

    .line 140
    move-object v3, v4

    new-array v4, p1, [C

    aput-char v0, v4, v2

    const/4 v7, 0x6

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_a

    :cond_9
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    :cond_a
    if-eqz v9, :cond_b

    .line 141
    new-array p1, p1, [C

    aput-char v0, p1, v2

    const/4 v12, 0x6

    const/4 v13, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v8, v9

    move-object v9, p1

    invoke-static/range {v8 .. v13}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_c

    :cond_b
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p1

    .line 143
    :cond_c
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v0, v2, :cond_d

    return-object v1

    :cond_d
    return-object p1
.end method

.method private final splitDomain(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 71
    const/4 v0, 0x1

    new-array v2, v0, [C

    const/16 v1, 0x2e

    const/4 v3, 0x0

    aput-char v1, v2, v3

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 73
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->last(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, ""

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    invoke-static {p1, v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object p1

    :cond_0
    return-object p1
.end method


# virtual methods
.method public final getEffectiveTldPlusOne(Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    invoke-static {p1}, Ljava/net/IDN;->toUnicode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->splitDomain(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 53
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->findMatchingRule(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 54
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x21

    const/4 v5, 0x0

    if-ne v2, v3, :cond_0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v4, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 59
    :cond_0
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_1

    .line 61
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0

    .line 64
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v1

    .line 67
    :goto_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->splitDomain(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/sequences/SequencesKt;->drop(Lnicoid/network238/kotlin/sequences/Sequence;I)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object v1

    const/16 v8, 0x3e

    const/4 v9, 0x0

    const-string v2, "."

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v1 .. v9}, Lnicoid/network238/kotlin/sequences/SequencesKt;->joinToString$default(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
