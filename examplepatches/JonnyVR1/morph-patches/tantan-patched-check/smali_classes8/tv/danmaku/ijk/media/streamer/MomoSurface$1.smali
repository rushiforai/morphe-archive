.class Ltv/danmaku/ijk/media/streamer/MomoSurface$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qmq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/MomoSurface;->b0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/MomoSurface;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$1;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;J)V
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$1;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    new-instance v0, Ll/oxd0;

    .line 4
    .line 5
    const-wide/16 v1, 0x3e8

    .line 6
    .line 7
    div-long/2addr p2, v1

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, p2, p3, v1}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ll/oxd0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
