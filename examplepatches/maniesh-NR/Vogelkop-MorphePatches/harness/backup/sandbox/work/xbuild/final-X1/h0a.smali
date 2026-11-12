.class public final Lh0a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhx5;

.field public final b:Lj4c;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lode;


# direct methods
.method public constructor <init>(Lhx5;Lj4c;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh0a;->a:Lhx5;

    iput-object p2, p0, Lh0a;->b:Lj4c;

    iput-object p3, p0, Lh0a;->c:Lcom/opera/android/settings/SettingsManager;

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lh0a;->d:Lode;

    new-instance v0, Lg0a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lg0a;-><init>(Lh0a;B)V

    new-instance v1, Lug;

    const/16 v2, 0x17

    invoke-direct {v1, v0, v2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v1}, Lekc;->k(Lf7f;)V

    new-instance p1, Lld9;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    new-instance p1, La00;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, La00;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    new-instance p1, Ls9;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lh0a;->a:Lhx5;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v1

    if-eqz v1, :cond_52

    iget-object v1, p0, Lh0a;->b:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lize;

    if-eqz v1, :cond_52

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leri;

    if-eqz v1, :cond_52

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li1a;

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Li1a;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_28

    :cond_27
    const/4 v0, 0x0

    :goto_28
    iget-object v2, p0, Lh0a;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v3, "enable_google_ai_mode"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_42

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_42

    sget-object v0, Leti;->a:Lq6e;

    instance-of v0, v1, Lf1a;

    if-eqz v0, :cond_42

    move v0, v3

    goto :goto_43

    :cond_42
    move v0, v4

    :goto_43
    new-instance v1, Li0a;

    if-eqz v0, :cond_49

    if-nez v2, :cond_4a

    :cond_49
    move v3, v4

    :cond_4a
    invoke-direct {v1, v0, v3}, Li0a;-><init>(ZZ)V

    iget-object p0, p0, Lh0a;->d:Lode;

    invoke-static {p0, v1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :cond_52
    return-void
.end method
