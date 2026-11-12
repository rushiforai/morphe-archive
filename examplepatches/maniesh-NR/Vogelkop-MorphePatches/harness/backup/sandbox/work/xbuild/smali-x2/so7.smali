.class public final Lso7;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lro7;

.field public static final l:Ln57;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lro7;

    sget-object v1, Lv08;->a:Lv08;

    invoke-direct {v0, v1}, Lro7;-><init>(Ljava/util/Set;)V

    sput-object v0, Lso7;->k:Lro7;

    new-instance v0, Ln57;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ln57;-><init>(B)V

    sput-object v0, Lso7;->l:Ln57;

    return-void
.end method

.method public static t(Lizd;)Lro7;
    .registers 15

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v1, Lp4j;

    new-instance v2, Lu9d;

    invoke-direct {v2, v0}, Lu9d;-><init>(I)V

    invoke-direct {v1, v2}, Lp4j;-><init>(Lu9d;)V

    const/4 v2, 0x0

    move v3, v2

    :goto_10
    if-ge v3, v0, :cond_b8

    invoke-virtual {p0}, Lizd;->k()J

    move-result-wide v4

    long-to-int v4, v4

    new-array v4, v4, [B

    invoke-virtual {p0, v4}, Ljava/io/InputStream;->read([B)I

    new-instance v5, Lizd;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readByte()B

    move-result v4

    invoke-virtual {v5}, Lizd;->h()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_b0

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readByte()B

    move-result v6

    const-string v8, "Bad signature"

    invoke-static {v5, v6, v8}, Lnb6;->N(Lizd;ILjava/lang/String;)Lp4j;

    move-result-object v8

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readByte()B

    move-result v6

    const-string v9, "Bad url"

    invoke-static {v5, v6, v9}, Lnb6;->N(Lizd;ILjava/lang/String;)Lp4j;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v5}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_52
    move-object v9, v5

    check-cast v9, Lt9d;

    invoke-virtual {v9}, Lt9d;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7e

    move-object v9, v5

    check-cast v9, Lr9d;

    invoke-virtual {v9}, Lr9d;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const/16 v11, 0x2f

    const/4 v12, 0x6

    invoke-static {v9, v11, v2, v12}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v11

    const/4 v12, -0x1

    if-eq v11, v12, :cond_7a

    invoke-virtual {v9, v2, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v10, v12, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_52

    :cond_7a
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_52

    :cond_7e
    new-instance v5, Lqo7;

    new-instance v9, Lnd7;

    new-array v11, v2, [Ljava/lang/String;

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    invoke-direct {v9, v6}, Lnd7;-><init>([Ljava/lang/String;)V

    and-int/lit8 v6, v4, 0x1

    const/4 v11, 0x1

    if-eqz v6, :cond_94

    move v6, v11

    goto :goto_96

    :cond_94
    move v6, v11

    move v11, v2

    :goto_96
    and-int/lit8 v12, v4, 0x2

    if-eqz v12, :cond_9c

    move v12, v6

    goto :goto_9d

    :cond_9c
    move v12, v2

    :goto_9d
    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_a4

    move v13, v6

    :goto_a2
    move-object v6, v5

    goto :goto_a6

    :cond_a4
    move v13, v2

    goto :goto_a2

    :goto_a6
    invoke-direct/range {v6 .. v13}, Lqo7;-><init>(Ljava/lang/String;Lp4j;Lnd7;Ljava/util/LinkedHashMap;ZZZ)V

    invoke-virtual {v1, v6}, Lp4j;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_10

    :cond_b0
    new-instance p0, Llv0;

    const-string v0, "Unable to read app entry package name"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_b8
    invoke-static {v1}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object p0

    new-instance v0, Lro7;

    invoke-direct {v0, p0}, Lro7;-><init>(Ljava/util/Set;)V

    return-object v0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lso7;->k:Lro7;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lso7;->t(Lizd;)Lro7;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lso7;->t(Lizd;)Lro7;

    move-result-object p0

    return-object p0
.end method
