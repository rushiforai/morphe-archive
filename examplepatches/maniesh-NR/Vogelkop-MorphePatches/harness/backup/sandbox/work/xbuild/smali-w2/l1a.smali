.class public final Ll1a;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Ls49;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ls49;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ls49;-><init>(B)V

    sput-object v0, Ll1a;->k:Ls49;

    return-void
.end method

.method public static t(Lizd;)Lk1a;
    .registers 7

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    and-int/lit8 v0, v1, 0x7

    if-eqz v0, :cond_17

    const/4 v2, 0x1

    if-eq v0, v2, :cond_17

    const/4 v2, 0x2

    if-eq v0, v2, :cond_17

    const/4 v2, 0x4

    if-eq v0, v2, :cond_17

    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :cond_17
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v5

    new-instance v0, Lk1a;

    invoke-direct/range {v0 .. v5}, Lk1a;-><init>(IIIILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 7

    new-instance v0, Lk1a;

    const/4 v4, 0x0

    const-string v5, ""

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lk1a;-><init>(IIIILjava/lang/String;)V

    return-object v0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Ll1a;->t(Lizd;)Lk1a;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Ll1a;->t(Lizd;)Lk1a;

    move-result-object p0

    return-object p0
.end method
