.class public final Lu1f;
.super Lp1f;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lyqd;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lu1f;->e:B

    .line 50
    invoke-direct {p0, p3}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    .line 51
    iput-object p1, p0, Lu1f;->f:Ljava/lang/Object;

    .line 52
    new-instance p3, Ly0a;

    const/16 v1, 0x1d

    invoke-direct {p3, p0, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    .line 53
    new-instance v1, Lb94;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p3, v2}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 54
    new-array p3, v0, [Lbg1;

    aput-object v1, p3, v2

    .line 55
    const-string v0, "update_notifier"

    invoke-static {p1, p2, v0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lu1f;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lndc;Lru9;Likc;Lyqd;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lu1f;->e:B

    invoke-direct {p0, p4}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    iput-object p2, p0, Lu1f;->f:Ljava/lang/Object;

    iput-object p3, p0, Lu1f;->g:Ljava/lang/Object;

    new-instance p4, Lx53;

    invoke-direct {p4, p0}, Lx53;-><init>(Lu1f;)V

    invoke-virtual {p2, p4}, Lru9;->a(Ln1;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Lqs2;

    invoke-direct {v1, p2, p4}, Lqs2;-><init>(Lru9;Ln1;)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    new-instance p2, Lt77;

    const/4 p4, 0x5

    invoke-direct {p2, p0, p4}, Lt77;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1, p2}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Ld8d;

    const/16 p4, 0xe

    invoke-direct {p2, p0, p4}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p2}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 4

    iget-byte v0, p0, Lu1f;->e:B

    const/4 v1, 0x0

    iget-object v2, p0, Lu1f;->g:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "has_notification"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :pswitch_17
    check-cast v2, Likc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Lm18;->b:Lm18;

    if-ne v0, v2, :cond_2f

    iget-object p0, p0, Lu1f;->f:Ljava/lang/Object;

    check-cast p0, Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "rewards.has_opened_ui"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/lit8 v1, p0, 0x1

    :cond_2f
    return v1

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
