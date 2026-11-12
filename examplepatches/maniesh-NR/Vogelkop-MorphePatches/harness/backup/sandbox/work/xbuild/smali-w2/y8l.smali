.class public final Ly8l;
.super Ldp3;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lew3;)V
    .registers 3

    invoke-direct {p0, p2}, Ldp3;-><init>(Lesk;)V

    iput-object p1, p0, Ly8l;->b:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final b()Z
    .registers 4

    iget-object v0, p0, Ly8l;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v1

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ldp3;->a(Le7j;Lb7j;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const-string p0, "tab_switch_swipe_gesture_enabled"

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
