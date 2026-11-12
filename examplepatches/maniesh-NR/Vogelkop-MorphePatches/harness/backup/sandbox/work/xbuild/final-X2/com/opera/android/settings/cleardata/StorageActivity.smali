.class public Lcom/opera/android/settings/cleardata/StorageActivity;
.super Lfp1;
.source "SourceFile"

# interfaces
.implements Lm24;


# instance fields
.field public final a:Lpad;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lfp1;-><init>()V

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/settings/cleardata/StorageActivity;->a:Lpad;

    return-void
.end method


# virtual methods
.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/settings/cleardata/StorageActivity;->a:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/settings/cleardata/StorageActivity;->a:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    invoke-super {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Locp;->p(Landroid/view/Window;Z)V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lozk;->a(Landroid/content/res/Resources$Theme;Z)V

    const p1, 0x7f0d03d5

    invoke-virtual {p0, p1}, Lfp1;->setContentView(I)V

    invoke-static {p0}, Lf03;->f(Landroid/app/Activity;)V

    return-void
.end method
