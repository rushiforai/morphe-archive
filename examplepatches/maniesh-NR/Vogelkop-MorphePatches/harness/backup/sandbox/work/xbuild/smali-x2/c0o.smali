.class public final Lc0o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lr65;

.field public final c:Lox3;

.field public final d:Lyl6;

.field public final e:Lt1;

.field public final f:Lldf;

.field public final g:Ljjg;

.field public final h:Lt1;

.field public final i:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lr65;Lox3;Lyl6;Lt1;Lldf;Ljjg;Lt1;Lcom/opera/android/settings/SettingsManager;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc0o;->a:Landroid/content/Context;

    iput-object p2, p0, Lc0o;->b:Lr65;

    iput-object p3, p0, Lc0o;->c:Lox3;

    iput-object p4, p0, Lc0o;->d:Lyl6;

    iput-object p5, p0, Lc0o;->e:Lt1;

    iput-object p6, p0, Lc0o;->f:Lldf;

    iput-object p7, p0, Lc0o;->g:Ljjg;

    iput-object p8, p0, Lc0o;->h:Lt1;

    iput-object p9, p0, Lc0o;->i:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-object v0, p0, Lc0o;->e:Lt1;

    iget-object v0, v0, Lt1;->b:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lc0o;->f:Lldf;

    iget-object v1, v1, Lldf;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "need"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_2e

    iget-object p0, p0, Lc0o;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p0

    if-eqz p0, :cond_2d

    const-string p0, "oem.onboarding.completed"

    invoke-interface {v0, p0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_2e

    :cond_2d
    return v3

    :cond_2e
    const-string p0, "oem.onboarding.cmp_intro_reached"

    invoke-interface {v0, p0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
