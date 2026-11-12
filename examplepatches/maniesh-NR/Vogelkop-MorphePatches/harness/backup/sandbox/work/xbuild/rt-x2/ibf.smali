.class public final Libf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[Lfr;


# direct methods
.method public constructor <init>()V
    .registers 8

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc

    .line 106
    new-array v1, v0, [Lfr;

    iput-object v1, p0, Libf;->b:[Lfr;

    const/4 v1, 0x0

    .line 107
    iput v1, p0, Libf;->a:I

    move v2, v1

    :goto_d
    if-ge v2, v0, :cond_1f

    .line 108
    iget-object v3, p0, Libf;->b:[Lfr;

    new-instance v4, Lfr;

    const/16 v5, 0x3e8

    const/16 v6, 0x12

    invoke-direct {v4, v1, v5, v6}, Lfr;-><init>(IIB)V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_1f
    return-void
.end method

.method public constructor <init>(Lizd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc

    new-array v0, v0, [Lfr;

    iput-object v0, p0, Libf;->b:[Lfr;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Libf;->a:I

    const/4 v0, 0x0

    :goto_10
    iget-object v1, p0, Libf;->b:[Lfr;

    const/4 v2, 0x7

    if-gt v0, v2, :cond_1f

    new-instance v2, Lfr;

    invoke-direct {v2, p1}, Lfr;-><init>(Lizd;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    :cond_1f
    new-instance p0, Lfr;

    const/4 p1, 0x6

    aget-object p1, v1, p1

    iget v0, p1, Lfr;->b:I

    add-int/lit8 v0, v0, 0x1

    iget p1, p1, Lfr;->c:I

    const/16 v3, 0x12

    invoke-direct {p0, v0, p1, v3}, Lfr;-><init>(IIB)V

    const/16 p1, 0x8

    aput-object p0, v1, p1

    new-instance p0, Lfr;

    aget-object p1, v1, v2

    iget v0, p1, Lfr;->b:I

    add-int/lit8 v0, v0, 0x1

    iget p1, p1, Lfr;->c:I

    invoke-direct {p0, v0, p1, v3}, Lfr;-><init>(IIB)V

    const/16 p1, 0x9

    aput-object p0, v1, p1

    new-instance p0, Lfr;

    const/4 p1, 0x4

    aget-object p1, v1, p1

    iget v0, p1, Lfr;->b:I

    add-int/lit8 v0, v0, -0x1

    iget p1, p1, Lfr;->c:I

    invoke-direct {p0, v0, p1, v3}, Lfr;-><init>(IIB)V

    const/16 p1, 0xa

    aput-object p0, v1, p1

    new-instance p0, Lfr;

    const/4 p1, 0x5

    aget-object p1, v1, p1

    iget v0, p1, Lfr;->b:I

    add-int/lit8 v0, v0, -0x1

    iget p1, p1, Lfr;->c:I

    invoke-direct {p0, v0, p1, v3}, Lfr;-><init>(IIB)V

    const/16 p1, 0xb

    aput-object p0, v1, p1

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    iget p0, p0, Libf;->a:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method
