.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public e:Lcom/p1/mobile/putong/core/view/MaximumScroll;

.field public f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public j:Ll/oql;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qi4;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/qi4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->l:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->R(I)V

    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ri4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->j:Ll/oql;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->j:Ll/oql;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/oql;->f()Ll/t7m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->j:Ll/oql;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/oql;->f()Ll/t7m;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/t7m;->p0()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public S(Ll/oql;)V
    .locals 4

    .line 1
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->h:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/oql;->h()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->j:Ll/oql;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/oql;->e()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->k:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->k:Z

    .line 27
    .line 28
    new-instance p1, Ll/pf60;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v1, ""

    .line 44
    .line 45
    :goto_0
    const-string v2, "moment_id"

    .line 46
    .line 47
    invoke-direct {p1, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/pf60;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->h:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "owner_id"

    .line 57
    .line 58
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    filled-new-array {p1, v1}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v1, "e_moment"

    .line 66
    .line 67
    const-string v2, "p_suggest_users_home_view"

    .line 68
    .line 69
    invoke-static {v1, v2, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->e:Lcom/p1/mobile/putong/core/view/MaximumScroll;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const/4 v2, 0x0

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_2

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    move v0, v2

    .line 95
    :goto_1
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->e:Lcom/p1/mobile/putong/core/view/MaximumScroll;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->l:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/view/MaximumScroll;->setOnHeightChangeListener(Lcom/p1/mobile/putong/core/view/MaximumScroll$b;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->i:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 120
    .line 121
    const-string p1, "#99ffffff"

    .line 122
    .line 123
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->K(I)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->g:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->D()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
