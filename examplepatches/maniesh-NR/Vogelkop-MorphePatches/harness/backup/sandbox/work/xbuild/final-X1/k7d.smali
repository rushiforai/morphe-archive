.class public final Lk7d;
.super Ldp3;
.source "SourceFile"


# instance fields
.field public final b:Landroid/app/Activity;

.field public final c:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/opera/android/settings/SettingsManager;Lyv3;)V
    .registers 4

    invoke-direct {p0, p3}, Ldp3;-><init>(Lesk;)V

    iput-object p1, p0, Lk7d;->b:Landroid/app/Activity;

    iput-object p2, p0, Lk7d;->c:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final a(Le7j;Lb7j;)Z
    .registers 4

    iget-object p0, p0, Lk7d;->b:Landroid/app/Activity;

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_a

    return v0

    :cond_a
    sget-object p0, Le7j;->c:Le7j;

    if-eq p1, p0, :cond_13

    sget-object p0, Lb7j;->d:Lb7j;

    if-eq p2, p0, :cond_13

    return v0

    :cond_13
    const/4 p0, 0x1

    return p0
.end method

.method public final b()Z
    .registers 4

    iget-object v0, p0, Lk7d;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v1

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lk7d;->a(Le7j;Lb7j;)Z

    move-result v1

    if-eqz v1, :cond_28

    const-string v1, "main_menu_swipe_gesture_enabled"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lk7d;->b:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-static {p0}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result p0

    if-eqz p0, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method
