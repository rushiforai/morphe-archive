.class public final Ljtg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ltvg;

.field public final c:Lufn;

.field public final d:Lay;

.field public final e:Lj4c;

.field public final f:Lii;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ltvg;Lufn;Lj4c;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lay;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ljtg;->d:Lay;

    new-instance v1, Lii;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lii;-><init>(B)V

    iput-object v1, p0, Ljtg;->f:Lii;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ljtg;->a:Landroid/content/Context;

    iput-object p3, p0, Ljtg;->b:Ltvg;

    iput-object p4, p0, Ljtg;->c:Lufn;

    invoke-static {v0, p2}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    iput-object p5, p0, Ljtg;->e:Lj4c;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 8

    invoke-virtual {p0}, Ljtg;->b()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_38

    iget-object v0, p0, Ljtg;->d:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Ljtg;->b:Ltvg;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsvg;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lsvg;->a(I)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p0, p0, Ljtg;->c:Lufn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltfn;

    iget-wide v3, p0, Ltfn;->a:J

    const-wide/16 v5, 0x1

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long p0, v3, v5

    if-eqz p0, :cond_38

    return v2

    :cond_38
    return v1
.end method

.method public final b()Z
    .registers 2

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_14

    iget-object p0, p0, Ljtg;->f:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final c()Z
    .registers 7

    invoke-virtual {p0}, Ljtg;->b()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_76

    iget-object v0, p0, Ljtg;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "vpn_pro.kill_switch.on"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_76

    iget-object v2, p0, Ljtg;->d:Lay;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_76

    iget-object v2, p0, Ljtg;->e:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_76

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "internal.disable_premium_giveaway_subscription_check"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_51

    const-string v2, "premium.has_owned_subscription"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_76

    const-string v2, "premium.has_owned_giveaway"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_76

    :cond_51
    iget-object v0, p0, Ljtg;->b:Ltvg;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsvg;

    const/16 v2, 0x200

    invoke-virtual {v0, v2}, Lsvg;->a(I)Z

    move-result v0

    if-eqz v0, :cond_76

    iget-object p0, p0, Ljtg;->c:Lufn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltfn;

    iget-wide v2, p0, Ltfn;->a:J

    const-wide/16 v4, 0x1

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_76

    const/4 p0, 0x1

    return p0

    :cond_76
    return v1
.end method

.method public final d()Z
    .registers 4

    iget-object v0, p0, Ljtg;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn_pro.kill_switch.on"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_12

    return v2

    :cond_12
    invoke-virtual {p0}, Ljtg;->a()Z

    move-result p0

    return p0
.end method
