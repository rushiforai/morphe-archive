.class public final Lukd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/opera/android/media/MediaPlayerActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/media/MediaPlayerActivity;Ltcc;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lukd;->b:Lcom/opera/android/media/MediaPlayerActivity;

    const-wide/16 v0, 0x1f4

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p1, p0, Lukd;->a:Z

    if-nez p1, :cond_e

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_e
    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p1, p0, Lukd;->a:Z

    if-nez p1, :cond_e

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_e
    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p1, p0, Lukd;->a:Z

    if-nez p1, :cond_e

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_e
    return-void
.end method

.method public final run()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lukd;->a:Z

    iget-object p0, p0, Lukd;->b:Lcom/opera/android/media/MediaPlayerActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void
.end method
