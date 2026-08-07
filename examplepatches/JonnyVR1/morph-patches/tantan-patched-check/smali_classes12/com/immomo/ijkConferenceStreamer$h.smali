.class Lcom/immomo/ijkConferenceStreamer$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$c;


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
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer$h;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/c4m;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer$h;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/ijkConferenceStreamer;->access$700(Lcom/immomo/ijkConferenceStreamer;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer$h;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/ijkConferenceStreamer;->access$900(Lcom/immomo/ijkConferenceStreamer;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$h;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/immomo/ijkConferenceStreamer;->access$900(Lcom/immomo/ijkConferenceStreamer;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public b(Ll/c4m;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "MomoCamera"

    .line 6
    .line 7
    const-string v0, "onRecordPrepared"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
