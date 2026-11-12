.class public final Lhte;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lite;

.field public static final l:Lio7;

.field public static final m:Lrqd;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lite;

    new-instance v1, Ll0c;

    const-string v2, "zz"

    const-string v3, "en"

    invoke-direct {v1, v2, v3}, Ll0c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lite;-><init>(Ljava/util/List;ZZZ)V

    sput-object v0, Lhte;->k:Lite;

    sget-object v0, Lio7;->p:Lio7;

    sput-object v0, Lhte;->l:Lio7;

    new-instance v0, Lrqd;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lrqd;-><init>(B)V

    sput-object v0, Lhte;->m:Lrqd;

    return-void
.end method

.method public static t(Lizd;)Lite;
    .registers 8

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    new-instance v2, Lehc;

    invoke-direct {v2, v1}, Lehc;-><init>(I)V

    const/4 v3, 0x0

    move v4, v3

    :goto_f
    if-ge v4, v1, :cond_2b

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    if-nez v5, :cond_1a

    move-object v5, v6

    :cond_1a
    invoke-static {v5}, Ll0c;->a(Ljava/lang/String;)Ll0c;

    move-result-object v5

    if-eqz v5, :cond_26

    invoke-virtual {v2, v5}, Lehc;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    :cond_26
    invoke-static {v6}, Ls49;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2b
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    new-instance v1, Lite;

    and-int/lit8 v2, v0, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_38

    move v2, v4

    goto :goto_39

    :cond_38
    move v2, v3

    :goto_39
    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_3e

    move v4, v3

    :cond_3e
    invoke-direct {v1, p0, v3, v2, v4}, Lite;-><init>(Ljava/util/List;ZZZ)V

    return-object v1
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lhte;->k:Lite;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lhte;->t(Lizd;)Lite;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lhte;->t(Lizd;)Lite;

    move-result-object p0

    return-object p0
.end method
