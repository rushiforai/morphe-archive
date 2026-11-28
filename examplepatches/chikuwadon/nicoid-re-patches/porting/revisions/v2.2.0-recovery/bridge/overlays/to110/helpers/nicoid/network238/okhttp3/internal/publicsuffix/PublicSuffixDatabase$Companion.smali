.class public final Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\r\u001a\u00020\u000cJ)\u0010\u000e\u001a\u0004\u0018\u00010\u0008*\u00020\u00052\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0002\u00a2\u0006\u0002\u0010\u0013J\r\u0010\u0014\u001a\u00020\u0015H\u0000\u00a2\u0006\u0002\u0008\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;",
        "",
        "<init>",
        "()V",
        "WILDCARD_LABEL",
        "Lnicoid/network238/okio/ByteString;",
        "PREVAILING_RULE",
        "",
        "",
        "EXCEPTION_MARKER",
        "",
        "instance",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;",
        "get",
        "binarySearch",
        "labels",
        "",
        "labelIndex",
        "",
        "(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;",
        "resetForTests",
        "",
        "resetForTests$okhttp",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$binarySearch(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;
    .registers 4

    .line 150
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->binarySearch(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final binarySearch(Lnicoid/network238/okio/ByteString;[Lnicoid/network238/okio/ByteString;I)Ljava/lang/String;
    .registers 21

    .line 165
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_a

    add-int v5, v4, v2

    .line 168
    div-int/lit8 v5, v5, 0x2

    :goto_1
    const/16 v6, 0xa

    const/4 v7, -0x1

    if-le v5, v7, :cond_0

    .line 171
    invoke-virtual {v0, v5}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v8

    if-eq v8, v6, :cond_0

    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v8, v5, 0x1

    const/4 v9, 0x1

    move v10, v9

    :goto_2
    add-int v11, v8, v10

    .line 178
    invoke-virtual {v0, v11}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v12

    if-eq v12, v6, :cond_1

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_1
    sub-int v6, v11, v8

    move/from16 v12, p3

    const/4 v10, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_3
    const/16 v15, 0xff

    if-eqz v10, :cond_2

    const/16 v10, 0x2e

    const/4 v3, 0x0

    goto :goto_4

    .line 197
    :cond_2
    aget-object v3, v1, v12

    invoke-virtual {v3, v13}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v3

    invoke-static {v3, v15}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v3

    move/from16 v16, v10

    move v10, v3

    move/from16 v3, v16

    :goto_4
    add-int v7, v8, v14

    .line 200
    invoke-virtual {v0, v7}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    invoke-static {v7, v15}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v7

    sub-int/2addr v10, v7

    if-nez v10, :cond_4

    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v13, v13, 0x1

    if-eq v14, v6, :cond_4

    .line 209
    aget-object v7, v1, v12

    invoke-virtual {v7}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v7

    if-ne v7, v13, :cond_3

    .line 212
    array-length v3, v1

    sub-int/2addr v3, v9

    if-eq v12, v3, :cond_4

    add-int/lit8 v12, v12, 0x1

    move v10, v9

    const/4 v7, -0x1

    const/4 v13, -0x1

    goto :goto_3

    :cond_3
    move v10, v3

    const/4 v7, -0x1

    goto :goto_3

    :cond_4
    if-ltz v10, :cond_6

    if-gtz v10, :cond_8

    sub-int v3, v6, v14

    .line 229
    aget-object v7, v1, v12

    invoke-virtual {v7}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v7

    sub-int/2addr v7, v13

    add-int/lit8 v12, v12, 0x1

    .line 230
    array-length v9, v1

    :goto_5
    if-ge v12, v9, :cond_5

    .line 231
    aget-object v10, v1, v12

    invoke-virtual {v10}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v10

    add-int/2addr v7, v10

    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    :cond_5
    if-ge v7, v3, :cond_7

    :cond_6
    move v2, v5

    goto/16 :goto_0

    :cond_7
    if-le v7, v3, :cond_9

    :cond_8
    add-int/lit8 v4, v11, 0x1

    goto/16 :goto_0

    :cond_9
    add-int/2addr v6, v8

    .line 240
    invoke-virtual {v0, v8, v6}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sget-object v1, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString;->string(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_a
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final get()Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;
    .registers 2

    .line 158
    # getter for: Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->instance:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->access$getInstance$cp()Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    move-result-object v0

    return-object v0
.end method

.method public final resetForTests$okhttp()V
    .registers 3

    .line 249
    new-instance v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    sget-object v1, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList_androidKt;->getDefault(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;)Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;-><init>(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;)V

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->access$setInstance$cp(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;)V

    return-void
.end method
