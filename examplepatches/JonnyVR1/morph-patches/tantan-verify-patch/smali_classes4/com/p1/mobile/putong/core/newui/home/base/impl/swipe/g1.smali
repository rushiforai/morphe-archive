.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g1;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/d0;->U:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/d0;->R:Ll/jxd0;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v0, "id_verification_succeed_route"

    .line 22
    .line 23
    const-string v1, "avatar_and_id"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "e_id_verification_succeed_swipe_page_click"

    .line 34
    .line 35
    const-string v2, "p_id_verification_succeed_swipe_page_popup"

    .line 36
    .line 37
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic q(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g1;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g1;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-class v1, Landroid/app/Dialog;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v3, "p_id_verification_succeed_swipe_page_popup"

    .line 23
    .line 24
    invoke-static {v3, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v3, "id_verification_succeed_route"

    .line 29
    .line 30
    const-string v4, "avatar_and_id"

    .line 31
    .line 32
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    filled-new-array {v3}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v1, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 44
    .line 45
    .line 46
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Sr:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    sget v4, Lcom/p1/mobile/putong/core/R$string;->a8:I

    .line 53
    .line 54
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    sget v5, Ll/dbc0;->mk:I

    .line 59
    .line 60
    sget v6, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 61
    .line 62
    invoke-virtual {v2, v6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    new-instance v7, Ll/zlh0;

    .line 67
    .line 68
    invoke-direct {v7}, Ll/zlh0;-><init>()V

    .line 69
    .line 70
    .line 71
    new-instance v11, Ll/amh0;

    .line 72
    .line 73
    invoke-direct {v11, v1}, Ll/amh0;-><init>(Ll/l4g0;)V

    .line 74
    .line 75
    .line 76
    const/4 v15, 0x0

    .line 77
    const/16 v16, 0x0

    .line 78
    .line 79
    const/4 v8, 0x0

    .line 80
    const/4 v9, 0x0

    .line 81
    const/4 v10, 0x0

    .line 82
    const/4 v12, 0x0

    .line 83
    const/4 v13, 0x0

    .line 84
    const/4 v14, 0x0

    .line 85
    invoke-static/range {v2 .. v16}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 91
    .line 92
    const-string v2, "successIdAuth"

    .line 93
    .line 94
    invoke-virtual {v1, v0, v2}, Ll/b240;->P8(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 98
    .line 99
    return-object v0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
