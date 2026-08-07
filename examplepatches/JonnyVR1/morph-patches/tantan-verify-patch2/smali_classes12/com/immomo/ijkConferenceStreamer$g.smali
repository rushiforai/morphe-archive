.class Lcom/immomo/ijkConferenceStreamer$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/ijkConferenceStreamer;->initPipeline(Ll/brx;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/ijkConferenceStreamer;


# direct methods
.method public constructor <init>(Lcom/immomo/ijkConferenceStreamer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILl/c4m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(IILl/c4m;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/lg60;->a(II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p3, v0}, Lcom/immomo/ijkConferenceStreamer;->access$402(Lcom/immomo/ijkConferenceStreamer;I)I

    .line 8
    .line 9
    .line 10
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 11
    .line 12
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$700(Lcom/immomo/ijkConferenceStreamer;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    monitor-enter p3

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/ijkConferenceStreamer;->access$800(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/immomo/ijkConferenceStreamer;->access$800(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$g;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 32
    .line 33
    invoke-interface {v0, p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    monitor-exit p3

    .line 40
    return-void

    .line 41
    :goto_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    throw p0
.end method
