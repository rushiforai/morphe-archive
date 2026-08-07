.class Lnet/jpountz/lz4/LZ4SafeUtils$Match;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/jpountz/lz4/LZ4SafeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Match"
.end annotation


# instance fields
.field len:I

.field ref:I

.field start:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public end()I
    .locals 1

    .line 1
    iget v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->start:I

    .line 2
    .line 3
    iget p0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->len:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public fix(I)V
    .locals 1

    .line 1
    iget v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->start:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->start:I

    .line 5
    .line 6
    iget v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->ref:I

    .line 7
    .line 8
    add-int/2addr v0, p1

    .line 9
    iput v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->ref:I

    .line 10
    .line 11
    iget v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->len:I

    .line 12
    .line 13
    sub-int/2addr v0, p1

    .line 14
    iput v0, p0, Lnet/jpountz/lz4/LZ4SafeUtils$Match;->len:I

    .line 15
    .line 16
    return-void
.end method
