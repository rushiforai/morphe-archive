.class public final Le1j;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lhxl;


# instance fields
.field public a:Z

.field public final synthetic b:Lf1j;


# direct methods
.method public constructor <init>(Lf1j;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le1j;->b:Lf1j;

    invoke-virtual {p1}, Lf1j;->b()Z

    move-result v0

    iput-boolean v0, p0, Le1j;->a:Z

    const/4 p0, 0x1

    if-eqz v0, :cond_16

    invoke-virtual {p1}, Lf1j;->a()Z

    move-result v0

    if-eqz v0, :cond_16

    move v0, p0

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    iget-object p1, p1, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.opera.android.MyFlowSendActivity"

    invoke-direct {v2, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    if-eqz v0, :cond_28

    move p1, p0

    goto :goto_29

    :cond_28
    const/4 p1, 0x2

    :goto_29
    invoke-virtual {v1, v2, p1, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 5

    const-string v0, "my_flow_visible"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2a

    iget-object p1, p0, Le1j;->b:Lf1j;

    invoke-virtual {p1}, Lf1j;->b()Z

    move-result v0

    iget-boolean v1, p0, Le1j;->a:Z

    if-eq v1, v0, :cond_2a

    iput-boolean v0, p0, Le1j;->a:Z

    iget-object p0, p1, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.opera.android.MyFlowSendActivity"

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x1

    if-eqz v0, :cond_26

    move v0, p0

    goto :goto_27

    :cond_26
    const/4 v0, 0x2

    :goto_27
    invoke-virtual {p1, v1, v0, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    :cond_2a
    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Le1j;->b:Lf1j;

    iget-object v0, p1, Lf1j;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p1, Lf1j;->c:Lbf9;

    invoke-virtual {p1, p0}, Lbf9;->b(Lhxl;)V

    return-void
.end method

.method public final i()V
    .registers 5

    iget-object v0, p0, Le1j;->b:Lf1j;

    invoke-virtual {v0}, Lf1j;->b()Z

    move-result v1

    iget-boolean v2, p0, Le1j;->a:Z

    if-ne v2, v1, :cond_b

    return-void

    :cond_b
    iput-boolean v1, p0, Le1j;->a:Z

    iget-object p0, v0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.opera.android.MyFlowSendActivity"

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x1

    if-eqz v1, :cond_1f

    move v1, p0

    goto :goto_20

    :cond_1f
    const/4 v1, 0x2

    :goto_20
    invoke-virtual {v0, v2, v1, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Le1j;->b:Lf1j;

    iget-object v0, p1, Lf1j;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object p1, p1, Lf1j;->c:Lbf9;

    invoke-virtual {p1, p0}, Lbf9;->D(Lhxl;)V

    return-void
.end method

.method public final x(I)V
    .registers 5

    iget-object p1, p0, Le1j;->b:Lf1j;

    invoke-virtual {p1}, Lf1j;->b()Z

    move-result v0

    iget-boolean v1, p0, Le1j;->a:Z

    if-ne v1, v0, :cond_b

    return-void

    :cond_b
    iput-boolean v0, p0, Le1j;->a:Z

    iget-object p0, p1, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.opera.android.MyFlowSendActivity"

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x1

    if-eqz v0, :cond_1f

    move v0, p0

    goto :goto_20

    :cond_1f
    const/4 v0, 0x2

    :goto_20
    invoke-virtual {p1, v1, v0, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method
