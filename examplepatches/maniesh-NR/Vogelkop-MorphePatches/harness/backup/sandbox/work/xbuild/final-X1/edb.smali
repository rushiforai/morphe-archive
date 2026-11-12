.class public final Ledb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lekc;Lf7f;Lode;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Ledb;->a:B

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Ledb;->b:Ljava/lang/Object;

    iput-object p2, p0, Ledb;->c:Ljava/lang/Object;

    iput-object p3, p0, Ledb;->d:Ljava/lang/Object;

    iput-object p4, p0, Ledb;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lndc;Lyug;Lslk;Lltg;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Ledb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lh42;

    invoke-direct {v1}, Lh42;-><init>()V

    iput-object v1, p0, Ledb;->e:Ljava/lang/Object;

    iput-object p2, p0, Ledb;->b:Ljava/lang/Object;

    iput-object p3, p0, Ledb;->c:Ljava/lang/Object;

    iput-object p4, p0, Ledb;->d:Ljava/lang/Object;

    iget-object p2, p3, Lslk;->i:Lkze;

    new-instance p4, Lddb;

    invoke-direct {p4, p0, v0}, Lddb;-><init>(Ledb;B)V

    invoke-virtual {v1, p2, p4}, Lh42;->s(Lekc;Lf7f;)V

    iget-object p2, p3, Lslk;->c:Lpy9;

    iget-object p2, p2, Lpy9;->g:Lkze;

    new-instance p3, Lddb;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lddb;-><init>(Ledb;B)V

    invoke-virtual {v1, p2, p3}, Lh42;->s(Lekc;Lf7f;)V

    invoke-virtual {v1, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lslk;Lfqe;Lm9c;Lx5f;Lvvg;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Ledb;->a:B

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p2, p0, Ledb;->b:Ljava/lang/Object;

    .line 50
    iput-object p3, p0, Ledb;->c:Ljava/lang/Object;

    .line 51
    iput-object p4, p0, Ledb;->d:Ljava/lang/Object;

    .line 52
    iput-object p5, p0, Ledb;->e:Ljava/lang/Object;

    .line 53
    iget-object p1, p1, Lslk;->i:Lkze;

    .line 54
    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Ledb;->e:Ljava/lang/Object;

    check-cast v0, Lh42;

    iget-object p0, p0, Ledb;->c:Ljava/lang/Object;

    check-cast p0, Lslk;

    iget-object v1, p0, Lslk;->i:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwvg;

    invoke-static {v1}, Luvg;->d(Lwvg;)Luvg;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-eq v2, v3, :cond_26

    const/4 v4, 0x2

    if-eq v2, v4, :cond_26

    const/4 v4, 0x3

    if-eq v2, v4, :cond_32

    const/4 p0, 0x4

    if-ne v2, p0, :cond_41

    :cond_26
    invoke-virtual {v1}, Lwvg;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_32
    iget-object p0, p0, Lslk;->c:Lpy9;

    iget-object p0, p0, Lpy9;->g:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtg;

    iget p0, p0, Lqtg;->a:I

    const/4 v1, -0x1

    if-ne p0, v1, :cond_42

    :cond_41
    return-void

    :cond_42
    if-ne p0, v3, :cond_45

    const/4 v3, 0x0

    :cond_45
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Ledb;->a:B

    iget-object v1, p0, Ledb;->c:Ljava/lang/Object;

    const/4 v2, 0x4

    iget-object v3, p0, Ledb;->e:Ljava/lang/Object;

    iget-object v4, p0, Ledb;->b:Ljava/lang/Object;

    iget-object v5, p0, Ledb;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e6

    check-cast p1, Lwvg;

    invoke-static {p1}, Luvg;->d(Lwvg;)Luvg;

    move-result-object p0

    sget-object v0, Luvg;->g:Luvg;

    if-eq p0, v0, :cond_b9

    iget-object p1, p1, Lwvg;->h:Ljmk;

    const-string v0, ""

    if-nez p1, :cond_20

    move-object p1, v0

    goto :goto_22

    :cond_20
    iget-object p1, p1, Ljmk;->a:Ljava/lang/String;

    :goto_22
    sget-object v6, Luvg;->d:Luvg;

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne p0, v6, :cond_2a

    move v6, v8

    goto :goto_2b

    :cond_2a
    move v6, v7

    :goto_2b
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v9, 0x2

    if-eq p0, v8, :cond_38

    if-eq p0, v9, :cond_38

    if-eq p0, v2, :cond_38

    move p0, v7

    goto :goto_39

    :cond_38
    move p0, v8

    :goto_39
    check-cast v5, Lx5f;

    iget-object v2, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    invoke-virtual {v10, v2}, Lx56;->O(Lzpa;)Le66;

    move-result-object v2

    invoke-virtual {v2, v9, v8, v6}, Ljf0;->r(IIZ)V

    invoke-virtual {v5, v10}, Lx5f;->U0(Lx56;)V

    invoke-static {v6}, Lcom/opera/android/browser/obml/Platform;->e(Z)V

    check-cast v4, Lfqe;

    iput-boolean v6, v4, Lfqe;->k:Z

    iget-object v2, v4, Lfqe;->c:Luqe;

    if-eqz v2, :cond_6c

    iget-object v2, v2, Luqe;->i:Lg93;

    iget-boolean v4, v2, Lg93;->s:Z

    if-eq v6, v4, :cond_6c

    iput-boolean v6, v2, Lg93;->s:Z

    iget-object v4, v2, Lg93;->n:Lfue;

    invoke-virtual {v4}, Lfue;->d()V

    iget-object v4, v4, Lfue;->a:Lcue;

    sget-object v5, Lcue;->c:Lcue;

    if-ne v4, v5, :cond_6c

    invoke-virtual {v2}, Lt7j;->c()V

    :cond_6c
    check-cast v1, Lm9c;

    iget-object v2, v1, Lm9c;->b:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v4, "premium"

    invoke-interface {v2, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eq v2, v6, :cond_9d

    iget-object v1, v1, Lm9c;->b:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v4, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "has_premium_subscription"

    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "premium_subscription_source"

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_9d
    check-cast v3, Lvvg;

    iget-byte p0, v3, Lvvg;->a:B

    if-ne p0, v8, :cond_a5

    if-eqz v6, :cond_b9

    :cond_a5
    if-eqz v6, :cond_a8

    move v7, v9

    :cond_a8
    if-eq v7, p0, :cond_b9

    iput-byte v7, v3, Lvvg;->a:B

    if-eq v7, v8, :cond_b2

    if-ne v7, v9, :cond_b4

    move-object v0, v4

    goto :goto_b4

    :cond_b2
    const-string v0, "candidate"

    :cond_b4
    :goto_b4
    const/16 p0, 0x2a

    invoke-static {p0, v0}, Lks3;->I(ILjava/lang/String;)V

    :cond_b9
    return-void

    :pswitch_ba
    invoke-static {p1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_cc

    check-cast v1, Lekc;

    check-cast v5, Lf7f;

    invoke-virtual {v1, v5}, Lekc;->p(Lf7f;)V

    check-cast v3, Lode;

    invoke-virtual {v3, p0}, Lekc;->p(Lf7f;)V

    :cond_cc
    return-void

    :pswitch_cd
    check-cast p1, Ljava/lang/Boolean;

    check-cast v3, Lh42;

    invoke-virtual {v3, p0}, Lekc;->p(Lf7f;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_e5

    check-cast v4, Lyug;

    check-cast v5, Lltg;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x5

    invoke-static {v4, p0, v5, v2}, Lyug;->c(Lyug;ILltg;I)V

    :cond_e5
    return-void

    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_cd
        :pswitch_ba
    .end packed-switch
.end method
