.class public final synthetic Ll62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls62;


# direct methods
.method public synthetic constructor <init>(Ls62;B)V
    .registers 3

    iput-byte p2, p0, Ll62;->a:B

    iput-object p1, p0, Ll62;->b:Ls62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Ll62;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ll62;->b:Ls62;

    packed-switch v0, :pswitch_data_104

    check-cast p1, Lela;

    iget-object v0, p0, Ls62;->c:Lg7m;

    iget-object p1, p1, Lela;->a:Litm;

    iget-object p0, p0, Ls62;->a:Lt62;

    const/4 v2, 0x0

    if-eqz p1, :cond_25

    instance-of v3, p1, Lnhe;

    if-eqz v3, :cond_1a

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_26

    :cond_1a
    instance-of v3, p1, Lwhi;

    if-eqz v3, :cond_21

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_26

    :cond_21
    instance-of v3, p1, Lzf1;

    if-eqz v3, :cond_ad

    :cond_25
    move-object v3, v2

    :goto_26
    const/4 v4, 0x1

    if-eqz v3, :cond_55

    iget-object v5, v0, Lg7m;->e:Ljava/lang/Object;

    check-cast v5, Lji;

    invoke-virtual {v5}, Lji;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lskm;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    check-cast v5, Lx5f;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    new-instance v8, Lck0;

    invoke-direct {v8, v6, v7}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v8}, Lck0;->h()Lat0;

    move-result-object v6

    iget-object v6, v6, Lat0;->a:Lzs0;

    const/16 v8, 0x9

    invoke-virtual {v6, v8, v4, v3}, Ljf0;->r(IIZ)V

    invoke-virtual {v5, v7}, Lx5f;->U0(Lx56;)V

    :cond_55
    iget-object v3, v0, Lg7m;->c:Ljava/lang/Object;

    check-cast v3, Lyv3;

    invoke-virtual {v3}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lru9;

    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "ai.tos_accepted"

    invoke-interface {v3, v5, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_7b

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_78

    if-ne p0, v4, :cond_74

    sget-object v2, Lx70;->n:Lx70;

    goto :goto_9b

    :cond_74
    invoke-static {}, Lh9o;->p()V

    goto :goto_b0

    :cond_78
    sget-object v2, Lx70;->l:Lx70;

    goto :goto_9b

    :cond_7b
    if-eqz p1, :cond_9b

    instance-of p0, p1, Lzf1;

    if-eqz p0, :cond_84

    sget-object v2, Lx70;->d:Lx70;

    goto :goto_9b

    :cond_84
    instance-of p0, p1, Lnhe;

    if-eqz p0, :cond_97

    iget-object p0, v0, Lg7m;->k:Ljava/lang/Object;

    check-cast p0, Lx70;

    sget-object p1, Lx70;->m:Lx70;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9b

    sget-object v2, Lx70;->i:Lx70;

    goto :goto_9b

    :cond_97
    instance-of p0, p1, Lwhi;

    if-eqz p0, :cond_a9

    :cond_9b
    :goto_9b
    if-eqz v2, :cond_a6

    iget-object p0, v0, Lg7m;->k:Ljava/lang/Object;

    check-cast p0, Lx70;

    if-eq v2, p0, :cond_a6

    invoke-virtual {v0, v2}, Lg7m;->f(Lx70;)V

    :cond_a6
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_b0

    :cond_a9
    invoke-static {}, Lh9o;->p()V

    goto :goto_b0

    :cond_ad
    invoke-static {}, Lh9o;->p()V

    :goto_b0
    return-object v2

    :pswitch_b1
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ls62;->v:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_c2

    iget-object p0, p0, Lzz1;->j:Lv5n;

    if-eqz p0, :cond_c2

    invoke-interface {p0, p1}, Lv5n;->d(Ljava/lang/String;)V

    :cond_c2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c5
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Ls62;->u:Lkze;

    if-eqz p1, :cond_d2

    sget-object p1, Lx52;->b:Lx52;

    goto :goto_d4

    :cond_d2
    sget-object p1, Lx52;->c:Lx52;

    :goto_d4
    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v1, p0, Ls62;->C:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_dc
    check-cast p1, Ljava/lang/Float;

    iget-object p0, p0, Ls62;->w:Lr9i;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_f3

    invoke-static {v0, v1, p1}, LJ/N;->M0ycnTP5(JF)V

    :cond_f3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f6
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ls62;->w:Lr9i;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    invoke-virtual {p0, p1}, Lcom/opera/android/webcore/WebcoreRpcBridge;->a(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_f6
        :pswitch_dc
        :pswitch_c5
        :pswitch_b1
    .end packed-switch
.end method
