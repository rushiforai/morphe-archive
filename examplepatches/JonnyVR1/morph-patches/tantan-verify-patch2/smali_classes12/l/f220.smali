.class public abstract Ll/f220;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:I

.field protected b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/f220;->a:I

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p0, Ll/f220;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/media/MediaFormat;I)I
.end method

.method public abstract b()Z
.end method

.method public abstract c(I)V
.end method

.method public abstract d()V
.end method

.method public abstract e()V
.end method

.method public abstract f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
.end method
