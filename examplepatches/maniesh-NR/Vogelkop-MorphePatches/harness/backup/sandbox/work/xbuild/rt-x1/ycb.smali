.class public final Lycb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;ZB)V
    .registers 4

    iput-byte p3, p0, Lycb;->a:B

    iput-object p1, p0, Lycb;->b:Lcom/opera/android/BrowserActivity;

    iput-boolean p2, p0, Lycb;->c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 6

    iget-byte v0, p0, Lycb;->a:B

    const/4 v1, 0x0

    iget-boolean v2, p0, Lycb;->c:Z

    iget-object p0, p0, Lycb;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_98

    if-eqz v2, :cond_39

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v0

    iget-object v2, v0, Ltjg;->i:Lujc;

    if-eqz v2, :cond_23

    iget-object v2, v2, Lgk9;->b:Lgig;

    invoke-interface {v2}, Lgig;->g()Lqjd;

    move-result-object v2

    goto :goto_24

    :cond_23
    const/4 v2, 0x0

    :goto_24
    sget-object v3, Lyh0;->h:Lyh0;

    invoke-static {v0, v2, v3}, Lcom/opera/android/media/PlayerService;->d(Ltjg;Lqjd;Lyh0;)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->k:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcg2;

    if-eqz v0, :cond_39

    iget-object v0, v0, Lcg2;->j:Lgg2;

    if-nez v0, :cond_8a

    :cond_39
    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {v0}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_47
    :goto_47
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_70

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    if-eqz v2, :cond_47

    instance-of v4, v2, Lgld;

    if-nez v4, :cond_6e

    instance-of v2, v2, Lrld;

    if-eqz v2, :cond_47

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-ge v1, v2, :cond_6e

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_6e
    move v1, v3

    goto :goto_47

    :cond_70
    if-nez v1, :cond_8a

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v3}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lgld;

    invoke-direct {v0}, Lgld;-><init>()V

    const/16 v1, 0x1003

    invoke-static {v0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqim;->g(Lzhj;)V

    :cond_8a
    return-void

    :pswitch_8b
    invoke-virtual {p0, v2, v1}, Lcom/opera/android/BrowserActivity;->n0(ZZ)V

    new-instance p0, Lxxh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_8b
    .end packed-switch
.end method
