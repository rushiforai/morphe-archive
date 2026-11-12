.class public final Lsvg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 44
    iput v0, p0, Lsvg;->a:I

    .line 45
    new-array v0, v0, [I

    iput-object v0, p0, Lsvg;->b:[I

    return-void
.end method

.method public constructor <init>(Lizd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lsvg;->a:I

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_26

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    new-array v2, v0, [I

    iput-object v2, p0, Lsvg;->b:[I

    :goto_18
    if-ge v1, v0, :cond_25

    iget-object v2, p0, Lsvg;->b:[I

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_25
    return-void

    :cond_26
    new-array p1, v1, [I

    iput-object p1, p0, Lsvg;->b:[I

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    iget p0, p0, Lsvg;->a:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method
