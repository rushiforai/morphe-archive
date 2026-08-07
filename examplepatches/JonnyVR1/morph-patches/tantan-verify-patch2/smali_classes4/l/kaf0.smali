.class public Ll/kaf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/eaf0;",
        ">;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;

.field public d:Lv/VRecyclerView;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

.field public g:Ll/eaf0;

.field public h:Landroid/animation/ValueAnimator;

.field public i:Ll/p9f0;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

.field public w:Z

.field public x:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/kaf0;->l:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/kaf0;->m:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/kaf0;->n:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/kaf0;->o:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/kaf0;->p:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/kaf0;->q:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/kaf0;->r:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/kaf0;->s:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/kaf0;->t:Z

    .line 22
    .line 23
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/kaf0;->u:Ljava/util/Map;

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 36
    .line 37
    iput-object p1, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Ll/kaf0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kaf0;->v(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)V

    return-void
.end method

.method public static synthetic b(Ll/kaf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kaf0;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u60ca\u559c\u793c\u76d2"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u60ca\u559c\u793c\u76d2"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kaf0;->e:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/faf0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/faf0;-><init>(Ll/kaf0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 12
    .line 13
    new-instance v1, Ll/gaf0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/gaf0;-><init>(Ll/kaf0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/p9f0;->Q(Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eaf0;->J0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "navigation_view_page"

    .line 10
    .line 11
    const-string v0, "no_location_permission_tips"

    .line 12
    .line 13
    const-string v1, "red_dot"

    .line 14
    .line 15
    const-string v2, "red_dot_normal"

    .line 16
    .line 17
    const-string v3, "setting_tab"

    .line 18
    .line 19
    invoke-static {v1, v2, v3, p0, v0}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "e_red_dot_me_settings"

    .line 24
    .line 25
    const-string v1, "p_navigation_view"

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public B(IZ)V
    .locals 2

    .line 1
    if-eqz p1, :cond_8

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_7

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    if-eq p1, v1, :cond_5

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p1, v0, :cond_4

    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/16 v0, 0xa

    .line 17
    .line 18
    if-eq p1, v0, :cond_2

    .line 19
    .line 20
    const/16 v0, 0xc

    .line 21
    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/16 v0, 0xd

    .line 25
    .line 26
    if-eq p1, v0, :cond_0

    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_0
    iput-boolean p2, p0, Ll/kaf0;->t:Z

    .line 31
    .line 32
    const-string p1, "\u5fc3\u52a8\u5f00\u573a\u767d"

    .line 33
    .line 34
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iput-boolean p2, p0, Ll/kaf0;->s:Z

    .line 43
    .line 44
    const-string p1, "\u804a\u5929\u52a9\u624b"

    .line 45
    .line 46
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iput-boolean p2, p0, Ll/kaf0;->q:Z

    .line 55
    .line 56
    const-string p1, "\u6bcf\u65e5\u52a0\u66dd\u5149"

    .line 57
    .line 58
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iput-boolean p2, p0, Ll/kaf0;->n:Z

    .line 67
    .line 68
    const-string p1, "\u9080\u597d\u53cb\u9886VIP"

    .line 69
    .line 70
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    iput-boolean p2, p0, Ll/kaf0;->l:Z

    .line 79
    .line 80
    const-string p1, "\u5e2e\u52a9\u4e0e\u53cd\u9988"

    .line 81
    .line 82
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l1:Ll/jxd0;

    .line 95
    .line 96
    invoke-static {}, Ll/gra;->I1()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_6

    .line 101
    .line 102
    if-eqz p2, :cond_6

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    const/4 v0, 0x0

    .line 106
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    const-string p1, "\u7fa4\u804a"

    .line 114
    .line 115
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_7
    iput-boolean p2, p0, Ll/kaf0;->o:Z

    .line 124
    .line 125
    const-string p1, "\u8ba4\u8bc1\u4e2d\u5fc3"

    .line 126
    .line 127
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_8
    iput-boolean p2, p0, Ll/kaf0;->m:Z

    .line 136
    .line 137
    const-string p1, "\u8bbe\u7f6e"

    .line 138
    .line 139
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 144
    .line 145
    .line 146
    :goto_1
    invoke-virtual {p0}, Ll/kaf0;->C()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kaf0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/kaf0;->m:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/kaf0;->n:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/kaf0;->o:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/kaf0;->p:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/kaf0;->q:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-boolean v0, p0, Ll/kaf0;->r:Z

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-boolean v0, p0, Ll/kaf0;->s:Z

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-boolean p0, p0, Ll/kaf0;->t:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k1:Ll/jxd0;

    .line 43
    .line 44
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k1:Ll/jxd0;

    .line 55
    .line 56
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)V
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    move v0, v1

    .line 13
    :goto_1
    iget-object v1, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v1, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 38
    .line 39
    .line 40
    :cond_2
    const/4 v1, 0x2

    .line 41
    new-array v1, v1, [F

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    aput v2, v1, v3

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    aput v0, v1, v2

    .line 48
    .line 49
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    const-wide/16 v1, 0x12c

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    new-instance v1, Ll/kaf0$a;

    .line 78
    .line 79
    invoke-direct {v1, p0, p1}, Ll/kaf0$a;-><init>(Ll/kaf0;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/laf0;->b(Ll/kaf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/eaf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eaf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kaf0;->i(Ll/eaf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kaf0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()Z
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "mytab_group_remove"

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/BlockGroupList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/BlockGroupList;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/BlockGroupList;->blockList:Ljava/util/List;

    .line 22
    .line 23
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_3

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "all_channel"

    .line 54
    .line 55
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const/4 v3, 0x1

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    return v3

    .line 63
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    if-eqz v1, :cond_0

    .line 79
    .line 80
    return v3

    .line 81
    :catch_0
    :cond_3
    const/4 p0, 0x0

    .line 82
    return p0
.end method

.method public k()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->M2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 14
    .line 15
    iget-object v2, v2, Ll/j7b;->R:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    cmp-long v0, v0, v2

    .line 28
    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 32
    .line 33
    new-instance v1, Ll/iaf0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/iaf0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 43
    .line 44
    new-instance v2, Ll/jaf0;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/jaf0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    if-ltz v0, :cond_0

    .line 56
    .line 57
    iget-object v1, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 63
    .line 64
    iget-object p0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    sub-int/2addr p0, v0

    .line 71
    invoke-virtual {v1, v0, p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kaf0;->h:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ll/kaf0;->E(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kaf0;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/kaf0;->d:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/p9f0;

    .line 20
    .line 21
    iget-boolean v1, p0, Ll/kaf0;->w:Z

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Ll/p9f0;-><init>(Ll/kaf0;Z)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/kaf0;->d:Lv/VRecyclerView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 34
    .line 35
    iget-object p0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/p9f0;->P(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/kaf0;->b:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/high16 v0, 0x438c0000    # 280.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    sub-float/2addr v1, p1

    .line 23
    mul-float/2addr v0, v1

    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final p()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 7
    .line 8
    iget-boolean v1, p0, Ll/kaf0;->w:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Ll/pgj;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v2, 0x1

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/nmp;->b()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    move v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v0, v1

    .line 37
    :goto_0
    iput-boolean v0, p0, Ll/kaf0;->k:Z

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 42
    .line 43
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 52
    .line 53
    const-string v3, "\u94b1\u5305"

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/gra;->z()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v3, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    sget v0, Ll/dbc0;->jh:I

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    sget v0, Ll/dbc0;->ih:I

    .line 73
    .line 74
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 75
    .line 76
    .line 77
    :goto_1
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 78
    .line 79
    iget-object v3, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 80
    .line 81
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    :cond_3
    invoke-static {}, Ll/gra;->M2()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_5

    .line 89
    .line 90
    invoke-static {}, Ll/pzi0;->o()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 97
    .line 98
    iget-object v0, v0, Ll/j7b;->R:Ll/byd0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/Long;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 107
    .line 108
    .line 109
    move-result-wide v5

    .line 110
    cmp-long v0, v3, v5

    .line 111
    .line 112
    if-gez v0, :cond_5

    .line 113
    .line 114
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 115
    .line 116
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 125
    .line 126
    const-string v1, "\u60ca\u559c\u793c\u76d2"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/gra;->z()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 136
    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    sget v0, Ll/dbc0;->vq:I

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    sget v0, Ll/dbc0;->uq:I

    .line 146
    .line 147
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 148
    .line 149
    .line 150
    :goto_2
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 151
    .line 152
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 153
    .line 154
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const-string v1, "e_surprisebox_navigation"

    .line 164
    .line 165
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    move v1, v2

    .line 169
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    const-string v3, "p_my_page"

    .line 182
    .line 183
    if-eqz v0, :cond_6

    .line 184
    .line 185
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Ll/eu4;->h()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_6

    .line 194
    .line 195
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 198
    .line 199
    iget-object v0, v0, Ll/fg7;->R:Ll/jxd0;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Ljava/lang/Boolean;

    .line 206
    .line 207
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    xor-int/2addr v0, v2

    .line 212
    iput-boolean v0, p0, Ll/kaf0;->s:Z

    .line 213
    .line 214
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 215
    .line 216
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 217
    .line 218
    .line 219
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 220
    .line 221
    add-int/lit8 v2, v1, 0x1

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 227
    .line 228
    const-string v1, "\u804a\u5929\u52a9\u624b"

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 234
    .line 235
    sget v1, Ll/dbc0;->Xg:I

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 241
    .line 242
    iget-boolean v1, p0, Ll/kaf0;->s:Z

    .line 243
    .line 244
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 252
    .line 253
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 254
    .line 255
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    const-string v0, "e_my_chat_assist_entrance"

    .line 259
    .line 260
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    move v1, v2

    .line 264
    :cond_6
    invoke-static {}, Ll/h39;->J()Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-eqz v0, :cond_7

    .line 269
    .line 270
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 271
    .line 272
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 273
    .line 274
    .line 275
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 276
    .line 277
    add-int/lit8 v2, v1, 0x1

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 283
    .line 284
    const-string v1, "\u6211\u7684\u5f00\u573a\u767d"

    .line 285
    .line 286
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 290
    .line 291
    sget v1, Ll/dbc0;->p5:I

    .line 292
    .line 293
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 294
    .line 295
    .line 296
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 297
    .line 298
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 299
    .line 300
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    const-string v0, "e_opening_entrance"

    .line 304
    .line 305
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    move v1, v2

    .line 309
    :cond_7
    invoke-static {}, Ll/gra;->o2()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-nez v0, :cond_8

    .line 314
    .line 315
    invoke-static {}, Ll/gra;->p2()Z

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-eqz v0, :cond_a

    .line 320
    .line 321
    :cond_8
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 322
    .line 323
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 324
    .line 325
    .line 326
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 327
    .line 328
    add-int/lit8 v2, v1, 0x1

    .line 329
    .line 330
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 331
    .line 332
    .line 333
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 334
    .line 335
    const-string v1, "\u4efb\u52a1\u4e2d\u5fc3"

    .line 336
    .line 337
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    invoke-static {}, Ll/gra;->z()Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 345
    .line 346
    if-eqz v0, :cond_9

    .line 347
    .line 348
    sget v0, Ll/dbc0;->Uf:I

    .line 349
    .line 350
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 351
    .line 352
    .line 353
    goto :goto_3

    .line 354
    :cond_9
    sget v0, Ll/dbc0;->Tf:I

    .line 355
    .line 356
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 357
    .line 358
    .line 359
    :goto_3
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 360
    .line 361
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 362
    .line 363
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    const-string v0, "e_task_entrance"

    .line 367
    .line 368
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    move v1, v2

    .line 372
    :cond_a
    invoke-static {}, Ll/gra;->I1()Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_c

    .line 377
    .line 378
    invoke-virtual {p0}, Ll/kaf0;->j()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-nez v0, :cond_c

    .line 383
    .line 384
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 385
    .line 386
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 387
    .line 388
    .line 389
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 390
    .line 391
    add-int/lit8 v2, v1, 0x1

    .line 392
    .line 393
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 394
    .line 395
    .line 396
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 397
    .line 398
    const-string v1, "\u7fa4\u804a"

    .line 399
    .line 400
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    invoke-static {}, Ll/gra;->z()Z

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 408
    .line 409
    if-eqz v0, :cond_b

    .line 410
    .line 411
    sget v0, Ll/dbc0;->ah:I

    .line 412
    .line 413
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 414
    .line 415
    .line 416
    goto :goto_4

    .line 417
    :cond_b
    sget v0, Ll/dbc0;->Zg:I

    .line 418
    .line 419
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 420
    .line 421
    .line 422
    :goto_4
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 423
    .line 424
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 425
    .line 426
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    move v1, v2

    .line 430
    :cond_c
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-interface {v0}, Ll/hbs;->f()Z

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    if-eqz v0, :cond_e

    .line 443
    .line 444
    invoke-static {}, Ll/gra;->Q1()Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    if-eqz v0, :cond_e

    .line 449
    .line 450
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 451
    .line 452
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 453
    .line 454
    .line 455
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 456
    .line 457
    add-int/lit8 v2, v1, 0x1

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 460
    .line 461
    .line 462
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 463
    .line 464
    const-string v1, "\u76f4\u64ad"

    .line 465
    .line 466
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 470
    .line 471
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 472
    .line 473
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 474
    .line 475
    .line 476
    invoke-static {}, Ll/gra;->z()Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 481
    .line 482
    if-eqz v0, :cond_d

    .line 483
    .line 484
    sget v0, Ll/dbc0;->ch:I

    .line 485
    .line 486
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 487
    .line 488
    .line 489
    goto :goto_5

    .line 490
    :cond_d
    sget v0, Ll/dbc0;->bh:I

    .line 491
    .line 492
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 493
    .line 494
    .line 495
    :goto_5
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 496
    .line 497
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 498
    .line 499
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    move v1, v2

    .line 503
    :cond_e
    invoke-virtual {p0, v1}, Ll/kaf0;->q(I)V

    .line 504
    .line 505
    .line 506
    iget-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 507
    .line 508
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 509
    .line 510
    .line 511
    move-result v0

    .line 512
    if-nez v0, :cond_f

    .line 513
    .line 514
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 515
    .line 516
    iget-object v2, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 517
    .line 518
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 519
    .line 520
    .line 521
    iget-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 522
    .line 523
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    add-int/2addr v1, v0

    .line 528
    :cond_f
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 529
    .line 530
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 531
    .line 532
    .line 533
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 534
    .line 535
    add-int/lit8 v2, v1, 0x1

    .line 536
    .line 537
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 538
    .line 539
    .line 540
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 541
    .line 542
    const-string v1, "\u5173\u4e8e\u63a2\u63a2"

    .line 543
    .line 544
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 545
    .line 546
    .line 547
    invoke-static {}, Ll/gra;->z()Z

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 552
    .line 553
    if-eqz v0, :cond_10

    .line 554
    .line 555
    sget v0, Ll/dbc0;->Wg:I

    .line 556
    .line 557
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 558
    .line 559
    .line 560
    goto :goto_6

    .line 561
    :cond_10
    sget v0, Ll/dbc0;->Vg:I

    .line 562
    .line 563
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 564
    .line 565
    .line 566
    :goto_6
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 567
    .line 568
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 569
    .line 570
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 571
    .line 572
    .line 573
    iget-object v0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 574
    .line 575
    invoke-virtual {v0}, Ll/eaf0;->N0()Z

    .line 576
    .line 577
    .line 578
    move-result v0

    .line 579
    iput-boolean v0, p0, Ll/kaf0;->m:Z

    .line 580
    .line 581
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 582
    .line 583
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 584
    .line 585
    .line 586
    iput-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 587
    .line 588
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 589
    .line 590
    .line 591
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 592
    .line 593
    const-string v1, "\u8bbe\u7f6e"

    .line 594
    .line 595
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 596
    .line 597
    .line 598
    invoke-static {}, Ll/gra;->z()Z

    .line 599
    .line 600
    .line 601
    move-result v0

    .line 602
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 603
    .line 604
    if-eqz v0, :cond_11

    .line 605
    .line 606
    sget v0, Ll/dbc0;->eh:I

    .line 607
    .line 608
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 609
    .line 610
    .line 611
    goto :goto_7

    .line 612
    :cond_11
    sget v0, Ll/dbc0;->dh:I

    .line 613
    .line 614
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setNativeIcon(I)V

    .line 615
    .line 616
    .line 617
    :goto_7
    iget-object v0, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 618
    .line 619
    iget-object v1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 620
    .line 621
    invoke-virtual {v1}, Ll/eaf0;->N0()Z

    .line 622
    .line 623
    .line 624
    move-result v1

    .line 625
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 626
    .line 627
    .line 628
    move-result-object v1

    .line 629
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 630
    .line 631
    .line 632
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 633
    .line 634
    iget-object v1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 635
    .line 636
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    invoke-static {}, Ll/gra;->z()Z

    .line 640
    .line 641
    .line 642
    move-result v0

    .line 643
    if-eqz v0, :cond_12

    .line 644
    .line 645
    iget-object p0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 646
    .line 647
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 648
    .line 649
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 650
    .line 651
    .line 652
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    .line 654
    .line 655
    :cond_12
    return-void
.end method

.method public final q(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/pk50;->k()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_7

    .line 19
    .line 20
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/pk50;->k()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_7

    .line 38
    .line 39
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/pk50;->k()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->sidebarIcons:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_7

    .line 60
    .line 61
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/pk50;->k()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->sidebarIcons:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_6

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;

    .line 92
    .line 93
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_0

    .line 100
    .line 101
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    const/4 v4, 0x2

    .line 108
    if-ne v3, v4, :cond_0

    .line 109
    .line 110
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Ljava/lang/Long;

    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 119
    .line 120
    .line 121
    move-result-wide v3

    .line 122
    invoke-static {}, Ll/pzi0;->o()J

    .line 123
    .line 124
    .line 125
    move-result-wide v5

    .line 126
    const-wide/16 v7, 0x3e8

    .line 127
    .line 128
    div-long/2addr v5, v7

    .line 129
    cmp-long v3, v3, v5

    .line 130
    .line 131
    if-gtz v3, :cond_0

    .line 132
    .line 133
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 134
    .line 135
    const/4 v4, 0x1

    .line 136
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Ljava/lang/Long;

    .line 141
    .line 142
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 143
    .line 144
    .line 145
    move-result-wide v3

    .line 146
    invoke-static {}, Ll/pzi0;->o()J

    .line 147
    .line 148
    .line 149
    move-result-wide v5

    .line 150
    div-long/2addr v5, v7

    .line 151
    cmp-long v3, v3, v5

    .line 152
    .line 153
    if-ltz v3, :cond_0

    .line 154
    .line 155
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 156
    .line 157
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    if-eqz v3, :cond_0

    .line 162
    .line 163
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 164
    .line 165
    iget-object v3, v3, Lcom/p1/mobile/putong/data/NavigationViewPicture;->identifier:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    if-nez v3, :cond_0

    .line 172
    .line 173
    new-instance v3, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 174
    .line 175
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;-><init>()V

    .line 176
    .line 177
    .line 178
    iput-object v3, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 179
    .line 180
    add-int/lit8 v4, p1, 0x1

    .line 181
    .line 182
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIndex(I)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 186
    .line 187
    const-string v3, "online"

    .line 188
    .line 189
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setType(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 193
    .line 194
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setTitle(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const-string p1, "\u9080\u597d\u53cb\u9886VIP"

    .line 200
    .line 201
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_1

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 210
    .line 211
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n1:Ll/jxd0;

    .line 214
    .line 215
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Ljava/lang/Boolean;

    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    iput-boolean p1, p0, Ll/kaf0;->n:Z

    .line 226
    .line 227
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 228
    .line 229
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 230
    .line 231
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 232
    .line 233
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n1:Ll/jxd0;

    .line 234
    .line 235
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Ljava/lang/Boolean;

    .line 240
    .line 241
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 242
    .line 243
    .line 244
    :cond_1
    const-string p1, "\u6bcf\u65e5\u52a0\u66dd\u5149"

    .line 245
    .line 246
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 247
    .line 248
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    if-eqz p1, :cond_2

    .line 253
    .line 254
    const-string p1, "e_mypage_checkin"

    .line 255
    .line 256
    const-string v3, "p_my_page"

    .line 257
    .line 258
    invoke-static {p1, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 262
    .line 263
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 264
    .line 265
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o1:Ll/jxd0;

    .line 266
    .line 267
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    check-cast p1, Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    iput-boolean p1, p0, Ll/kaf0;->q:Z

    .line 278
    .line 279
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 280
    .line 281
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 282
    .line 283
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 284
    .line 285
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o1:Ll/jxd0;

    .line 286
    .line 287
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    check-cast v3, Ljava/lang/Boolean;

    .line 292
    .line 293
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 294
    .line 295
    .line 296
    :cond_2
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 297
    .line 298
    invoke-virtual {p0, p1}, Ll/kaf0;->s(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    if-eqz p1, :cond_5

    .line 303
    .line 304
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 305
    .line 306
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 307
    .line 308
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->p1:Ll/wyd0;

    .line 309
    .line 310
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    check-cast p1, Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    if-nez v3, :cond_3

    .line 321
    .line 322
    new-instance v3, Lorg/json/JSONObject;

    .line 323
    .line 324
    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    goto :goto_1

    .line 328
    :cond_3
    new-instance v3, Lorg/json/JSONObject;

    .line 329
    .line 330
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 331
    .line 332
    .line 333
    :goto_1
    iget-boolean v5, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 334
    .line 335
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 336
    .line 337
    .line 338
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    iget-object v6, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 340
    .line 341
    if-eqz p1, :cond_4

    .line 342
    .line 343
    :try_start_1
    iget-boolean p1, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 344
    .line 345
    invoke-virtual {v3, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 346
    .line 347
    .line 348
    goto :goto_2

    .line 349
    :cond_4
    iget-boolean p1, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 350
    .line 351
    invoke-virtual {v3, v6, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    iget-object p1, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {v3, p1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 358
    .line 359
    .line 360
    :goto_2
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 361
    .line 362
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 363
    .line 364
    .line 365
    move-result-object v6

    .line 366
    invoke-virtual {p1, v6}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 367
    .line 368
    .line 369
    iget-object p1, p0, Ll/kaf0;->u:Ljava/util/Map;

    .line 370
    .line 371
    iget-object v6, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 372
    .line 373
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 374
    .line 375
    .line 376
    move-result-object v5

    .line 377
    invoke-interface {p1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 381
    .line 382
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 383
    .line 384
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->p1:Ll/wyd0;

    .line 385
    .line 386
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-virtual {p1, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 391
    .line 392
    .line 393
    :catch_0
    :cond_5
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 394
    .line 395
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 396
    .line 397
    iget-object v3, v3, Lcom/p1/mobile/putong/data/NavigationViewPicture;->identifier:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setIconUrl(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 403
    .line 404
    iget-object v3, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 405
    .line 406
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setDeepLink(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    iget-object p1, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 410
    .line 411
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setOmsId(Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    iget-object p1, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 417
    .line 418
    iget-object v2, p0, Ll/kaf0;->v:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 419
    .line 420
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move p1, v4

    .line 424
    goto/16 :goto_0

    .line 425
    .line 426
    :cond_6
    iget-object p1, p0, Ll/kaf0;->u:Ljava/util/Map;

    .line 427
    .line 428
    invoke-virtual {p0, p1}, Ll/kaf0;->w(Ljava/util/Map;)V

    .line 429
    .line 430
    .line 431
    :cond_7
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->o2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gra;->p2()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/e7d0;->f()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/gra;->X2()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    :cond_0
    const/4 v0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    :goto_0
    iput-boolean v0, p0, Ll/kaf0;->w:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/kaf0;->p()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/kaf0;->m()V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Ll/kaf0;->n()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/kaf0;->A()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/kaf0;->C()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/kaf0;->y()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/d09;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u9080\u597d\u53cb\u9886VIP"

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const-string p0, "\u6bcf\u65e5\u52a0\u66dd\u5149"

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kaf0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)V
    .locals 5

    .line 1
    const-string v0, "online"

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    const-string v0, "\u9080\u597d\u53cb\u9886VIP"

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/eaf0;->r0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v0, "\u6bcf\u65e5\u52a0\u66dd\u5149"

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/eaf0;->n0()V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/kaf0;->s(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->p1:Ll/wyd0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    new-instance v2, Lorg/json/JSONObject;

    .line 74
    .line 75
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    new-instance v2, Lorg/json/JSONObject;

    .line 80
    .line 81
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object v0, p0, Ll/kaf0;->u:Ljava/util/Map;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getOmsId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 91
    .line 92
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/kaf0;->u:Ljava/util/Map;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Ll/kaf0;->w(Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/kaf0;->C()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0, v4}, Ll/kaf0;->x(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getOmsId()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 115
    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 120
    .line 121
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->p1:Ll/wyd0;

    .line 122
    .line 123
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .line 129
    .line 130
    :catch_0
    :cond_3
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getDeepLink()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getOmsId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p0, v0, p1}, Ll/eaf0;->t0(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    const/4 v2, 0x1

    .line 156
    const/4 v3, -0x1

    .line 157
    sparse-switch v0, :sswitch_data_0

    .line 158
    .line 159
    .line 160
    :goto_2
    move v1, v3

    .line 161
    goto/16 :goto_3

    .line 162
    .line 163
    :sswitch_0
    const-string v0, "\u5fc3\u52a8\u5f00\u573a\u767d"

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-nez p1, :cond_5

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_5
    const/16 v1, 0xf

    .line 173
    .line 174
    goto/16 :goto_3

    .line 175
    .line 176
    :sswitch_1
    const-string v0, "\u8ba4\u8bc1\u4e2d\u5fc3"

    .line 177
    .line 178
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-nez p1, :cond_6

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_6
    const/16 v1, 0xe

    .line 186
    .line 187
    goto/16 :goto_3

    .line 188
    .line 189
    :sswitch_2
    const-string v0, "\u804a\u5929\u52a9\u624b"

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_7

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_7
    const/16 v1, 0xd

    .line 199
    .line 200
    goto/16 :goto_3

    .line 201
    .line 202
    :sswitch_3
    const-string v0, "\u6211\u7684\u5ba2\u670d"

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-nez p1, :cond_8

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_8
    const/16 v1, 0xc

    .line 212
    .line 213
    goto/16 :goto_3

    .line 214
    .line 215
    :sswitch_4
    const-string v0, "\u60ca\u559c\u793c\u76d2"

    .line 216
    .line 217
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-nez p1, :cond_9

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_9
    const/16 v1, 0xb

    .line 225
    .line 226
    goto/16 :goto_3

    .line 227
    .line 228
    :sswitch_5
    const-string v0, "\u5173\u4e8e\u63a2\u63a2"

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    if-nez p1, :cond_a

    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_a
    const/16 v1, 0xa

    .line 238
    .line 239
    goto/16 :goto_3

    .line 240
    .line 241
    :sswitch_6
    const-string v0, "\u4efb\u52a1\u4e2d\u5fc3"

    .line 242
    .line 243
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    if-nez p1, :cond_b

    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_b
    const/16 v1, 0x9

    .line 251
    .line 252
    goto/16 :goto_3

    .line 253
    .line 254
    :sswitch_7
    const-string v0, "\u804a\u5929\u5ba4"

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-nez p1, :cond_c

    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_c
    const/16 v1, 0x8

    .line 264
    .line 265
    goto/16 :goto_3

    .line 266
    .line 267
    :sswitch_8
    const-string v0, "\u94b1\u5305"

    .line 268
    .line 269
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-nez p1, :cond_d

    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_d
    const/4 v1, 0x7

    .line 277
    goto :goto_3

    .line 278
    :sswitch_9
    const-string v0, "\u8bbe\u7f6e"

    .line 279
    .line 280
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-nez p1, :cond_e

    .line 285
    .line 286
    goto :goto_2

    .line 287
    :cond_e
    const/4 v1, 0x6

    .line 288
    goto :goto_3

    .line 289
    :sswitch_a
    const-string v0, "\u7fa4\u804a"

    .line 290
    .line 291
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    if-nez p1, :cond_f

    .line 296
    .line 297
    goto/16 :goto_2

    .line 298
    .line 299
    :cond_f
    const/4 v1, 0x5

    .line 300
    goto :goto_3

    .line 301
    :sswitch_b
    const-string v0, "\u793c\u7269"

    .line 302
    .line 303
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-nez p1, :cond_10

    .line 308
    .line 309
    goto/16 :goto_2

    .line 310
    .line 311
    :cond_10
    const/4 v1, 0x4

    .line 312
    goto :goto_3

    .line 313
    :sswitch_c
    const-string v0, "\u76f4\u64ad"

    .line 314
    .line 315
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-nez p1, :cond_11

    .line 320
    .line 321
    goto/16 :goto_2

    .line 322
    .line 323
    :cond_11
    const/4 v1, 0x3

    .line 324
    goto :goto_3

    .line 325
    :sswitch_d
    const-string v0, "\u5206\u4eab"

    .line 326
    .line 327
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    if-nez p1, :cond_12

    .line 332
    .line 333
    goto/16 :goto_2

    .line 334
    .line 335
    :cond_12
    const/4 v1, 0x2

    .line 336
    goto :goto_3

    .line 337
    :sswitch_e
    const-string v0, "\u8d26\u53f7\u4e0e\u5b89\u5168"

    .line 338
    .line 339
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-nez p1, :cond_13

    .line 344
    .line 345
    goto/16 :goto_2

    .line 346
    .line 347
    :cond_13
    move v1, v2

    .line 348
    goto :goto_3

    .line 349
    :sswitch_f
    const-string v0, "\u6211\u7684\u5f00\u573a\u767d"

    .line 350
    .line 351
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-nez p1, :cond_14

    .line 356
    .line 357
    goto/16 :goto_2

    .line 358
    .line 359
    :cond_14
    :goto_3
    packed-switch v1, :pswitch_data_0

    .line 360
    .line 361
    .line 362
    return-void

    .line 363
    :pswitch_0
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 364
    .line 365
    invoke-virtual {p0}, Ll/eaf0;->q0()V

    .line 366
    .line 367
    .line 368
    return-void

    .line 369
    :pswitch_1
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 370
    .line 371
    invoke-virtual {p1}, Ll/eaf0;->F0()V

    .line 372
    .line 373
    .line 374
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 375
    .line 376
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 377
    .line 378
    .line 379
    return-void

    .line 380
    :pswitch_2
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 381
    .line 382
    invoke-virtual {p1}, Ll/eaf0;->O0()V

    .line 383
    .line 384
    .line 385
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 386
    .line 387
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 388
    .line 389
    .line 390
    return-void

    .line 391
    :pswitch_3
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 392
    .line 393
    invoke-virtual {p0}, Ll/eaf0;->x0()V

    .line 394
    .line 395
    .line 396
    return-void

    .line 397
    :pswitch_4
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 398
    .line 399
    invoke-virtual {p0}, Ll/eaf0;->D0()V

    .line 400
    .line 401
    .line 402
    return-void

    .line 403
    :pswitch_5
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 404
    .line 405
    invoke-virtual {p1}, Ll/eaf0;->m0()V

    .line 406
    .line 407
    .line 408
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 409
    .line 410
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :pswitch_6
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 415
    .line 416
    invoke-virtual {p1}, Ll/eaf0;->E0()V

    .line 417
    .line 418
    .line 419
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 420
    .line 421
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 422
    .line 423
    .line 424
    return-void

    .line 425
    :pswitch_7
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 426
    .line 427
    invoke-virtual {p1}, Ll/eaf0;->G0()V

    .line 428
    .line 429
    .line 430
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 431
    .line 432
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 433
    .line 434
    .line 435
    return-void

    .line 436
    :pswitch_8
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 437
    .line 438
    invoke-virtual {p1}, Ll/eaf0;->H0()V

    .line 439
    .line 440
    .line 441
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 442
    .line 443
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 444
    .line 445
    .line 446
    return-void

    .line 447
    :pswitch_9
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 448
    .line 449
    invoke-virtual {p1, v2}, Ll/eaf0;->z0(Z)V

    .line 450
    .line 451
    .line 452
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 453
    .line 454
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 455
    .line 456
    .line 457
    return-void

    .line 458
    :pswitch_a
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 459
    .line 460
    invoke-virtual {p1}, Ll/eaf0;->p0()V

    .line 461
    .line 462
    .line 463
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 464
    .line 465
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 466
    .line 467
    .line 468
    return-void

    .line 469
    :pswitch_b
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 470
    .line 471
    invoke-virtual {p1}, Ll/eaf0;->o0()V

    .line 472
    .line 473
    .line 474
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 475
    .line 476
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :pswitch_c
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 481
    .line 482
    invoke-virtual {p0}, Ll/eaf0;->s0()V

    .line 483
    .line 484
    .line 485
    return-void

    .line 486
    :pswitch_d
    const-string p1, "e_sidebar_share"

    .line 487
    .line 488
    const-string v0, "p_navigation_view"

    .line 489
    .line 490
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 494
    .line 495
    invoke-virtual {p0}, Ll/eaf0;->C0()V

    .line 496
    .line 497
    .line 498
    return-void

    .line 499
    :pswitch_e
    iget-object p1, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 500
    .line 501
    invoke-virtual {p1}, Ll/eaf0;->A0()V

    .line 502
    .line 503
    .line 504
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 505
    .line 506
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 507
    .line 508
    .line 509
    return-void

    .line 510
    :pswitch_f
    iget-object p0, p0, Ll/kaf0;->g:Ll/eaf0;

    .line 511
    .line 512
    invoke-virtual {p0}, Ll/eaf0;->u0()V

    .line 513
    .line 514
    .line 515
    return-void

    .line 516
    nop

    .line 517
    :sswitch_data_0
    .sparse-switch
        -0x62c19df0 -> :sswitch_f
        -0x139af7a4 -> :sswitch_e
        0xa3d65 -> :sswitch_d
        0xecc39 -> :sswitch_c
        0xf20ad -> :sswitch_b
        0xff526 -> :sswitch_a
        0x116b70 -> :sswitch_9
        0x125474 -> :sswitch_8
        0x1ecbd65 -> :sswitch_7
        0x252710bc -> :sswitch_6
        0x2639acfb -> :sswitch_5
        0x2d4ff6a8 -> :sswitch_4
        0x2e5c7d7e -> :sswitch_3
        0x3baa3b21 -> :sswitch_2
        0x41909893 -> :sswitch_1
        0x6c77381e -> :sswitch_0
    .end sparse-switch

    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public w(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/util/Map$Entry;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput-boolean v0, p0, Ll/kaf0;->r:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public x(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/haf0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/haf0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/kaf0;->j:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->setShowDot(Ljava/lang/Boolean;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/kaf0;->i:Ll/p9f0;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final y()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/kaf0;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-array v2, v1, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v3, "e_wallet"

    .line 15
    .line 16
    invoke-static {v3, v0, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/gra;->I1()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-array v1, v1, [Ll/sfj0$a;

    .line 32
    .line 33
    const-string v2, "e_group_entrance"

    .line 34
    .line 35
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Ll/kaf0;->x:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 63
    .line 64
    iget-object v2, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "oms_trace"

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getOmsId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    filled-new-array {v1}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v3, "e_oms_slot"

    .line 85
    .line 86
    invoke-static {v3, v2, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kaf0;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/kaf0;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;

    .line 8
    .line 9
    iget-object p0, p0, Ll/kaf0;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;->W(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
