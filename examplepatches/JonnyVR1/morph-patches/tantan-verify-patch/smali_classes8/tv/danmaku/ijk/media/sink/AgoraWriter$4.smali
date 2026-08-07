.class Ltv/danmaku/ijk/media/sink/AgoraWriter$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qmq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter;->startRecording()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/sink/AgoraWriter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$4;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

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
    .locals 1

    .line 1
    iget-object p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$4;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    invoke-static {p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->j(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$4;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p2

    .line 15
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, p2, p3, p1, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->J(JLjava/nio/ByteBuffer;I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
