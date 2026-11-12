.class public final Llzj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Llzj;->a:Landroid/content/Context;

    iput-object p2, p0, Llzj;->b:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 7

    iget-object v0, p0, Llzj;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "settings.speed_dial_enabled_default.reason"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v3, :cond_15

    if-lt v4, v1, :cond_2e

    :cond_15
    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object p0, p0, Llzj;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "speed_dial.enabled"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :cond_2e
    return-void
.end method
