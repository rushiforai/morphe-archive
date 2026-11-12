.class public Ljng;
.super Lagc;
.source "SourceFile"


# instance fields
.field public final e:I

.field public final f:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(ILandroid/content/Context;Ljava/lang/Runnable;)V
    .registers 4

    invoke-direct {p0, p2}, Lagc;-><init>(Landroid/content/Context;)V

    iput p1, p0, Ljng;->e:I

    iput-object p3, p0, Ljng;->f:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget v0, p0, Ljng;->e:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_32

    const/4 v1, 0x1

    if-eq v0, v1, :cond_20

    const/4 v1, 0x2

    if-ne v0, v1, :cond_43

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lrxh;

    const v1, 0x7f14120d

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const-string v1, "https://www.opera.com/terms"

    invoke-static {p1, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    goto :goto_43

    :cond_20
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lrxh;

    const v1, 0x7f141083

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const-string v1, "https://www.opera.com/privacy"

    invoke-static {p1, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    goto :goto_43

    :cond_32
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lrxh;

    const v1, 0x7f140fda

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const-string v1, "https://www.opera.com/legal/eula-mobile"

    invoke-static {p1, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    :cond_43
    :goto_43
    iget-object p0, p0, Ljng;->f:Ljava/lang/Runnable;

    if-eqz p0, :cond_4a

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_4a
    return-void
.end method
