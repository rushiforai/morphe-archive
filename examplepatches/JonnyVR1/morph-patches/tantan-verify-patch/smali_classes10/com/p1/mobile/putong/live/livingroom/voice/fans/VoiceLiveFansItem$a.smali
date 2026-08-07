.class public Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->e(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wo0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->e(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->b(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->d(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;)J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    long-to-int v0, v0

    .line 25
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->g(Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wo0;->g()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
