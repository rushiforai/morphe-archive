.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d;
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

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const-string v0, "tantan://moment/p_game_cp?mid=0"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 5

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->b5:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->l2:Ll/cf7;

    .line 24
    .line 25
    iget p0, p0, Ll/cf7;->T:I

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    if-lt p0, v1, :cond_2

    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    new-instance v1, Ll/l8l$c;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/l8l$c;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    const-string v2, "\u8981\u4e0d\u8981\u627e\u4eba\u966a\u4f60\u6253\u6e38\u620f\uff1f"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ll/l8l$c;->s(Ljava/lang/String;)Ll/l8l$c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "\u6e38\u620f\u642d\u5b50\u90fd\u5728\u8fd9\u513f"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ll/l8l$c;->r(Ljava/lang/String;)Ll/l8l$c;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "\u53bb\u770b\u770b"

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/l8l$c;->n(Ljava/lang/String;)Ll/l8l$c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "#6E66FF"

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ll/l8l$c;->m(Ljava/lang/String;)Ll/l8l$c;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlZKWVdYSktTUEdJWUUyVVFVQkNYNk1NWDdQWUJRQzE0IiwidyI6NDIwLCJoIjo0MjEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MzQ1MTY1ODQ3ODUwNTg4NDE5fQ.webp"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/l8l$c;->p(Ljava/lang/String;)Ll/l8l$c;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    new-instance v2, Ll/zjj;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/zjj;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v2}, Ll/l8l$c;->l(Ljava/lang/Runnable;)Ll/l8l$c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ll/l8l$c;->k()Ll/l8l;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget-object v3, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->GAME_CP:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 105
    .line 106
    const/16 v4, 0x4e20

    .line 107
    .line 108
    invoke-virtual {v2, v3, p0, v1, v4}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {v1}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {p0, v1}, Ll/cl80;->q(Ll/al80;)V

    .line 121
    .line 122
    .line 123
    :goto_0
    const/4 p0, 0x1

    .line 124
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 125
    .line 126
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 129
    .line 130
    iget-object p0, p0, Ll/dkb;->b5:Ll/jxd0;

    .line 131
    .line 132
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_2
    return v0
.end method
