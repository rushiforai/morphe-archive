.class public Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Z

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:Lcom/p1/mobile/putong/core/data/CardOption;

.field public l:Lcom/p1/mobile/putong/core/data/CardOption;

.field public m:Lcom/p1/mobile/putong/core/data/CardPattern;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/a3h0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/a3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-wide/16 v0, 0x5dc

    .line 27
    .line 28
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1, v2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/b3h0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/b3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 47
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 50
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/a3h0;

    invoke-direct {p2, p0}, Ll/a3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 51
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    const-wide/16 v0, 0x5dc

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 52
    invoke-virtual {p1, v0, v1, p2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/b3h0;

    invoke-direct {p2, p0}, Ll/b3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 53
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 56
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 58
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/a3h0;

    invoke-direct {p2, p0}, Ll/a3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 59
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p1

    const-wide/16 p2, 0x5dc

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 60
    invoke-virtual {p1, p2, p3, v0}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p1

    new-instance p2, Ll/b3h0;

    invoke-direct {p2, p0}, Ll/b3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 61
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->m(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->l(Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->n(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->k(Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e3h0;->a(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final g()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public getCardPattern()Lcom/p1/mobile/putong/core/data/CardPattern;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->m:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeftOption()Lcom/p1/mobile/putong/core/data/CardOption;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->k:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightOption()Lcom/p1/mobile/putong/core/data/CardOption;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->l:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->j:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final i(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardOption;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    move-object v2, v0

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/CardOption;

    .line 23
    .line 24
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/CardOption;->action:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, -0x1

    .line 34
    sparse-switch v3, :sswitch_data_0

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :sswitch_0
    const-string v3, "right"

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    const/4 v4, 0x2

    .line 48
    goto :goto_1

    .line 49
    :sswitch_1
    const-string v3, "left"

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    const/4 v4, 0x1

    .line 59
    goto :goto_1

    .line 60
    :sswitch_2
    const-string v3, "tap"

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const/4 v4, 0x0

    .line 70
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :pswitch_0
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->k:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 75
    .line 76
    :pswitch_1
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->l:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :pswitch_2
    new-instance v0, Ll/c3h0;

    .line 80
    .line 81
    move-object v1, p0

    .line 82
    move-object v5, p1

    .line 83
    move-object v3, p4

    .line 84
    move-object v4, p6

    .line 85
    invoke-direct/range {v0 .. v5}, Ll/c3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 93
    .line 94
    new-instance v0, Ll/d3h0;

    .line 95
    .line 96
    move-object v1, p0

    .line 97
    move-object v2, p3

    .line 98
    move-object v3, p4

    .line 99
    move-object v5, p5

    .line 100
    move-object v4, p6

    .line 101
    invoke-direct/range {v0 .. v5}, Ll/d3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v6, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    nop

    .line 109
    :sswitch_data_0
    .sparse-switch
        0x1bfa3 -> :sswitch_2
        0x32a007 -> :sswitch_1
        0x677c21c -> :sswitch_0
    .end sparse-switch

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final j(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "home_card"

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-static {v1, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {}, Ll/gra;->L3()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v1, Ll/q2h0;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->a:Lv/VDraweeView;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->c:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-direct {v1, v2, p0}, Ll/q2h0;-><init>(Lv/VDraweeView;Landroid/widget/LinearLayout;)V

    .line 31
    .line 32
    .line 33
    move-object p0, v1

    .line 34
    :goto_0
    const/16 v1, 0x12

    .line 35
    .line 36
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    if-nez p5, :cond_0

    .line 8
    .line 9
    invoke-interface {p2}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p0, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CardOption;->disappear:Z

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-interface {p3}, Ll/x20;->call()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->g()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-interface {p2}, Ll/x20;->call()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->j(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 2
    .line 3
    iget-object p5, p5, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    if-nez p5, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->h(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CardOption;->disappear:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p3}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    invoke-interface {p4}, Ll/x20;->call()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic m(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic n(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i:Z

    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public o(Lcom/p1/mobile/putong/core/data/CardPattern;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->m:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->j:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->a:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->r(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->p(Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->u(Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->q(Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 48
    .line 49
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 50
    .line 51
    move-object v1, p0

    .line 52
    move-object v5, p2

    .line 53
    move-object v6, p3

    .line 54
    move-object v7, p4

    .line 55
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->i(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->topContent:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->context:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    xor-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->g:Lv/VText;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->middleContext:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    xor-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->h:Lv/VText;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->bottomContext:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    xor-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f:Lv/VText;

    .line 43
    .line 44
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->topContent:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->context:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f:Lv/VText;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->topContent:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->iconId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->t(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f:Lv/VText;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->topContent:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->backgroundId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->s(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->g:Lv/VText;

    .line 78
    .line 79
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->g:Lv/VText;

    .line 86
    .line 87
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->middleContext:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->h:Lv/VText;

    .line 93
    .line 94
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->h:Lv/VText;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->bottomContext:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->iconId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->iconId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    const-string v0, "love"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    :goto_0
    return-void

    .line 37
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget v0, Ll/dbc0;->dp:I

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "realAvatar"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->c:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->d:Lv/VImage;

    .line 16
    .line 17
    sget p1, Ll/dbc0;->Du:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "verified"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->c:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->d:Lv/VImage;

    .line 37
    .line 38
    sget p1, Ll/dbc0;->Iq:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final s(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, -0x1

    .line 9
    sparse-switch p0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string p0, "white2grey"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x4

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string p0, "white"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x3

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string p0, "pink"

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v0, 0x2

    .line 45
    goto :goto_0

    .line 46
    :sswitch_3
    const-string p0, "grey"

    .line 47
    .line 48
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v0, 0x1

    .line 56
    goto :goto_0

    .line 57
    :sswitch_4
    const-string p0, "orange"

    .line 58
    .line 59
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_4

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    const/4 v0, 0x0

    .line 67
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_0
    sget p0, Ll/dbc0;->e4:I

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :pswitch_1
    sget p0, Ll/dbc0;->f4:I

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_2
    sget p0, Ll/dbc0;->X3:I

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_3
    sget p0, Ll/dbc0;->S2:I

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :pswitch_4
    sget p0, Ll/dbc0;->Lp:I

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :sswitch_data_0
    .sparse-switch
        -0x3c21d9d2 -> :sswitch_4
        0x308adf -> :sswitch_3
        0x348176 -> :sswitch_2
        0x6bdcc29 -> :sswitch_1
        0xce98788 -> :sswitch_0
    .end sparse-switch

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final t(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, -0x1

    .line 10
    sparse-switch p0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string p0, "country"

    .line 15
    .line 16
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x5

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string p0, "star"

    .line 26
    .line 27
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v1, 0x4

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string p0, "love"

    .line 37
    .line 38
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v1, 0x3

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string p0, "chat"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v1, 0x2

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string p0, "passby"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v1, 0x1

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string p0, "active"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    move v1, v0

    .line 79
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_0
    sget p0, Ll/dbc0;->xp:I

    .line 84
    .line 85
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_1
    sget p0, Ll/dbc0;->Cp:I

    .line 90
    .line 91
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :pswitch_2
    sget p0, Ll/dbc0;->B2:I

    .line 96
    .line 97
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :pswitch_3
    sget p0, Ll/dbc0;->x2:I

    .line 102
    .line 103
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :pswitch_4
    sget p0, Ll/dbc0;->g4:I

    .line 108
    .line 109
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :pswitch_5
    sget p0, Ll/dbc0;->D2:I

    .line 114
    .line 115
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :sswitch_data_0
    .sparse-switch
        -0x54d080fa -> :sswitch_5
        -0x3b544fd8 -> :sswitch_4
        0x2e9358 -> :sswitch_3
        0x32c772 -> :sswitch_2
        0x360652 -> :sswitch_1
        0x39175796 -> :sswitch_0
    .end sparse-switch

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final u(Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->backgroundId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->iconId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->context:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->b:Lv/VText;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v3, v1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->t(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->b:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->s(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->b:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->b:Lv/VText;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    invoke-static {v3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
