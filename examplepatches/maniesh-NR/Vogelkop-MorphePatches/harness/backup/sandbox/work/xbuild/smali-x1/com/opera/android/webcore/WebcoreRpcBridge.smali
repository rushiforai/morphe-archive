.class public final Lcom/opera/android/webcore/WebcoreRpcBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Lxyn;


# direct methods
.method public constructor <init>(ILorg/chromium/content_public/browser/WebContents;Lxyn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, p0, p2}, LJ/N;->M06kqhI2(ILjava/lang/Object;Ljava/lang/Object;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    iput-object p3, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->b:Lxyn;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    const-string p0, "ofa-baseline ofa-mode ofa-mode-1"

    invoke-static {v0, v1, p1, p0}, LJ/N;->MqkSRV_q(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final transferRequestToBrowser(Ljava/lang/String;)V
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lilm;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->b:Lxyn;

    invoke-interface {p0, p1, v0}, Lxyn;->w(Ljava/lang/String;Lilm;)V

    return-void
.end method

.method public final transferResponseToBrowser(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->b:Lxyn;

    invoke-interface {p0, p1}, Lxyn;->t(Ljava/lang/String;)V

    return-void
.end method
