.class public final Lhwf;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lix5;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lix5;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lix5;-><init>(B)V

    sput-object v0, Lhwf;->k:Lix5;

    return-void
.end method

.method public static t(Lizd;)Lgwf;
    .registers 9

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-array v1, v0, [I

    new-array v2, v0, [Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_a
    if-ge v4, v0, :cond_37

    const/4 v5, 0x3

    new-array v5, v5, [B

    invoke-virtual {p0, v5}, Ljava/io/DataInputStream;->readFully([B)V

    aget-byte v6, v5, v3

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    const/4 v7, 0x1

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    add-int/2addr v6, v7

    const/4 v7, 0x2

    aget-byte v5, v5, v7

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v6, v5

    aput v6, v1, v4

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Laik;->a:[Ljava/lang/String;

    if-nez v5, :cond_32

    const-string v5, ""

    :cond_32
    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_37
    new-instance p0, Lgwf;

    new-instance v0, Lnd7;

    invoke-direct {v0, v2}, Lnd7;-><init>([Ljava/lang/String;)V

    invoke-direct {p0, v1, v0}, Lgwf;-><init>([ILnd7;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Lgwf;

    invoke-direct {p0}, Lgwf;-><init>()V

    return-object p0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lhwf;->t(Lizd;)Lgwf;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lhwf;->t(Lizd;)Lgwf;

    move-result-object p0

    return-object p0
.end method
