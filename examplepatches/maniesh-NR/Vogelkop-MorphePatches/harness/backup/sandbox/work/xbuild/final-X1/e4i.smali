.class public final Le4i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk3i;

.field public final b:Lf4i;

.field public final c:Lgjm;


# direct methods
.method public constructor <init>(Lk3i;Lf4i;Lgjm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le4i;->a:Lk3i;

    iput-object p2, p0, Le4i;->b:Lf4i;

    iput-object p3, p0, Le4i;->c:Lgjm;

    return-void
.end method


# virtual methods
.method public final a(Lndc;Lo3i;Ljava/lang/String;)V
    .registers 16

    new-instance v0, Ln3i;

    new-instance v1, Lp4i;

    const/4 v2, 0x1

    invoke-direct {v1, p2, p3, v2}, Lp4i;-><init>(Lo3i;Ljava/lang/String;Z)V

    invoke-direct {v0, v1}, Ln3i;-><init>(Lp4i;)V

    iget-object v5, p0, Le4i;->b:Lf4i;

    iget-object p0, v5, Lf4i;->a:Llw3;

    iget-object p0, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p3, "rewards.onboarding_seen"

    const/4 v1, 0x0

    invoke-interface {p0, p3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iget-object p3, v5, Lf4i;->b:Lyhe;

    iget-object v2, p3, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, Lgjm;

    if-nez p0, :cond_54

    new-instance v3, Le6g;

    const/4 v9, 0x0

    const/16 v10, 0x11

    const/4 v4, 0x0

    const-class v6, Lf4i;

    const-string v7, "onOnboardingSeen"

    const-string v8, "onOnboardingSeen()V"

    invoke-direct/range {v3 .. v10}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v11, Ls4f;

    const/16 p0, 0x11

    invoke-direct {v11, p3, v0, p0}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Lg4i;

    invoke-direct {v10, p2}, Lg4i;-><init>(Lo3i;)V

    new-instance v6, Lwtd;

    const/4 v8, 0x0

    move-object v9, p3

    move-object v7, v3

    invoke-direct/range {v6 .. v11}, Lwtd;-><init>(Lkotlin/jvm/functions/Function0;ZLyhe;Lg4i;Lkotlin/jvm/functions/Function0;)V

    new-instance p0, Liwa;

    const/16 p2, 0x1c

    invoke-direct {p0, v6, p2}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v10, p1, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    :cond_54
    invoke-virtual {v2, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final b(Lndc;Lo3i;Lk15;Lq4i;Lkotlin/jvm/functions/Function1;)V
    .registers 21

    new-instance v2, Lt4i;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {v2, v0, v1}, Lt4i;-><init>(Lk15;Lq4i;)V

    new-instance v4, Lt7d;

    const/16 v0, 0x8

    move-object/from16 v1, p5

    invoke-direct {v4, v1, v0}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v7, p0, Le4i;->b:Lf4i;

    iget-object p0, v7, Lf4i;->a:Llw3;

    iget-object p0, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "rewards.onboarding_seen"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iget-object v1, v7, Lf4i;->b:Lyhe;

    iget-object v0, v1, Lyhe;->b:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Lgjm;

    if-nez p0, :cond_61

    new-instance v5, Le6g;

    const/4 v11, 0x0

    const/16 v12, 0x12

    const/4 v6, 0x0

    const-class v8, Lf4i;

    const-string v9, "onOnboardingSeen"

    const-string v10, "onOnboardingSeen()V"

    invoke-direct/range {v5 .. v12}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v5

    new-instance v13, Li51;

    const/16 v5, 0x12

    move-object/from16 v3, p1

    move-object v0, v13

    invoke-direct/range {v0 .. v5}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v11, v1

    new-instance v12, Lg4i;

    move-object/from16 p0, p2

    invoke-direct {v12, p0}, Lg4i;-><init>(Lo3i;)V

    new-instance v8, Lwtd;

    const/4 v10, 0x1

    invoke-direct/range {v8 .. v13}, Lwtd;-><init>(Lkotlin/jvm/functions/Function0;ZLyhe;Lg4i;Lkotlin/jvm/functions/Function0;)V

    new-instance p0, Liwa;

    const/16 v0, 0x1c

    invoke-direct {p0, v8, v0}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v14, v12, v3, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    :cond_61
    move-object/from16 v3, p1

    invoke-virtual {v14, v2, v3, v4}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method
