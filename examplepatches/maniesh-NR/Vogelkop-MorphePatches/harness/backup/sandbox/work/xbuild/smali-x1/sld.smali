.class public final synthetic Lsld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/media/MediaPlayerMini;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/media/MediaPlayerMini;B)V
    .registers 3

    iput-byte p2, p0, Lsld;->a:B

    iput-object p1, p0, Lsld;->b:Lcom/opera/android/media/MediaPlayerMini;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lsld;->a:B

    iget-object p0, p0, Lsld;->b:Lcom/opera/android/media/MediaPlayerMini;

    packed-switch p1, :pswitch_data_82

    sget p1, Lcom/opera/android/media/MediaPlayerMini;->d:I

    sget-object p1, Loi0;->e:Loi0;

    invoke-virtual {p0, p1}, Lcom/opera/android/media/MediaPlayerMini;->a(Loi0;)V

    new-instance p1, Lgld;

    invoke-direct {p1}, Lgld;-><init>()V

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_20
    sget p1, Lcom/opera/android/media/MediaPlayerMini;->d:I

    sget-object p1, Loi0;->d:Loi0;

    invoke-virtual {p0, p1}, Lcom/opera/android/media/MediaPlayerMini;->a(Loi0;)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->stop()V

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p1, p0, Ltjg;->k:Lokg;

    iget-object v0, p1, Lokg;->c:Llkg;

    invoke-interface {v0}, Llkg;->clear()V

    iget-object v0, p1, Lokg;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p1, Lokg;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object p1, p1, Lokg;->b:Lkjg;

    invoke-virtual {p1}, Lkjg;->b()V

    iget-object p1, p0, Ltjg;->h:Lzo4;

    if-eqz p1, :cond_6a

    iget-object p1, p0, Ltjg;->a:Landroid/content/Context;

    invoke-static {p1}, Ldod;->d(Landroid/content/Context;)Ldod;

    const/4 p1, 0x0

    invoke-static {p1}, Ldod;->k(Lcpd;)V

    invoke-static {}, Lcom/google/android/gms/cast/framework/CastContext;->getSharedInstance()Lcom/google/android/gms/cast/framework/CastContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/CastContext;->getSessionManager()Lcom/google/android/gms/cast/framework/SessionManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/cast/framework/SessionManager;->endCurrentSession(Z)V

    sput-object p1, Lfr3;->i:Ljava/lang/String;

    invoke-virtual {p0}, Ltjg;->l()V

    :cond_6a
    return-void

    :pswitch_6b
    sget p1, Lcom/opera/android/media/MediaPlayerMini;->d:I

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    invoke-virtual {p1}, Lmig;->e()Z

    move-result p1

    if-eqz p1, :cond_7b

    sget-object p1, Loi0;->b:Loi0;

    invoke-virtual {p0, p1}, Lcom/opera/android/media/MediaPlayerMini;->a(Loi0;)V

    goto :goto_80

    :cond_7b
    sget-object p1, Loi0;->c:Loi0;

    invoke-virtual {p0, p1}, Lcom/opera/android/media/MediaPlayerMini;->a(Loi0;)V

    :goto_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_20
    .end packed-switch
.end method
