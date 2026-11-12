.class public final Lrli;
.super Lalo;
.source "SourceFile"


# instance fields
.field public final synthetic l:Lcom/opera/android/BrowserActivity;

.field public final synthetic m:Lhv3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lhv3;)V
    .registers 4

    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lalo;-><init>(B)V

    iput-object p1, p0, Lrli;->l:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lrli;->m:Lhv3;

    return-void
.end method


# virtual methods
.method public final s()V
    .registers 3

    sget-object v0, Lzeh;->a:Lzeh;

    invoke-static {v0}, Lmfh;->q(Lbfh;)Lrxh;

    move-result-object v0

    iget-object v1, p0, Lrli;->l:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lrli;->m:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {p0, v1}, Ljoh;->h(Lysj;Lpxh;)V

    return-void
.end method

.method public final t()V
    .registers 5

    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/qr/ScanQrCodeActivity;

    iget-object v2, p0, Lrli;->l:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Lqj2;

    const/16 v3, 0xc

    iget-object p0, p0, Lrli;->m:Lhv3;

    invoke-direct {v1, p0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v1}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method
