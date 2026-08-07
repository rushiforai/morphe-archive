.class Lcom/immomo/ijkConferenceStreamer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/ijkConferenceStreamer;->startPush(Landroid/app/Activity;Ll/brx;)V
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
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

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
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$1300(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    const/16 p3, 0x3101

    .line 10
    .line 11
    if-ne p1, p3, :cond_0

    .line 12
    .line 13
    const/16 p3, 0xb

    .line 14
    .line 15
    if-ne p2, p3, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p3, v0}, Lcom/immomo/ijkConferenceStreamer;->access$1402(Lcom/immomo/ijkConferenceStreamer;Z)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 24
    .line 25
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$1300(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 30
    .line 31
    invoke-interface {p3, p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public b(IILl/c4m;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$1300(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$1300(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$a;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 16
    .line 17
    invoke-interface {p3, p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
