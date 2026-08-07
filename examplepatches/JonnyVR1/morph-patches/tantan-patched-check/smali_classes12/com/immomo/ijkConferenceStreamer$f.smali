.class Lcom/immomo/ijkConferenceStreamer$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$b;


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
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer$f;->a:Lcom/immomo/ijkConferenceStreamer;

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
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "what#########"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "MomoCamera"

    .line 20
    .line 21
    invoke-virtual {p3, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$f;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 25
    .line 26
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$600(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    if-eqz p3, :cond_0

    .line 31
    .line 32
    iget-object p3, p0, Lcom/immomo/ijkConferenceStreamer$f;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 33
    .line 34
    invoke-static {p3}, Lcom/immomo/ijkConferenceStreamer;->access$600(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$f;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 39
    .line 40
    invoke-interface {p3, p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
