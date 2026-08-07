.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/f4x;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/f4x;

.field public B:Lcom/p1/mobile/android/app/Act;

.field public C:Z

.field public D:Z

.field public E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

.field public F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

.field public G:Landroid/animation/Animator;

.field public H:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public I:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public J:I

.field public K:Ll/l4g0;

.field public a:Lv/VLinear;

.field public b:Lv/VFrame;

.field public c:Lv/VFrame;

.field public d:Landroid/view/View;

.field public e:Lv/VFrame;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Landroid/widget/RelativeLayout;

.field public i:Lv/VFrame_Squared;

.field public j:Lcom/p1/mobile/putong/core/ui/RadarRipple;

.field public k:Lv/VDraweeView;

.field public l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Lv/VButton;

.field public p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

.field public q:Landroid/widget/FrameLayout;

.field public r:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

.field public s:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

.field public t:Lv/VFrame_Shadow;

.field public u:Lv/VLinear;

.field public v:Lv/VText;

.field public w:Lv/VFrame_Shadow;

.field public x:Lv/VLinear;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->C:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->D:Z

    .line 8
    .line 9
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->H:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 23
    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 25
    .line 26
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "p_marriage_profile"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->z:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->B:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->d()V

    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x3e8

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/high16 p1, 0x42b40000    # 90.0f

    .line 14
    .line 15
    :goto_0
    move v5, p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/high16 p1, -0x3d4c0000    # -90.0f

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :goto_1
    new-instance v3, Landroid/view/animation/RotateAnimation;

    .line 21
    .line 22
    const/4 v8, 0x1

    .line 23
    const/high16 v9, 0x40000000    # 2.0f

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v6, 0x1

    .line 27
    const/high16 v7, 0x3f000000    # 0.5f

    .line 28
    .line 29
    invoke-direct/range {v3 .. v9}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$f;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$f;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, p1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 49
    .line 50
    invoke-virtual {p1, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 51
    .line 52
    .line 53
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 54
    .line 55
    add-int/lit8 p1, p1, 0x1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-lt p1, v0, :cond_1

    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->t:Lv/VFrame_Shadow;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w:Lv/VFrame_Shadow;

    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 77
    .line 78
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    new-instance v3, Landroid/view/animation/ScaleAnimation;

    .line 85
    .line 86
    const/4 v10, 0x1

    .line 87
    const/high16 v11, 0x3f000000    # 0.5f

    .line 88
    .line 89
    const v4, 0x3f666666    # 0.9f

    .line 90
    .line 91
    .line 92
    const/high16 v5, 0x3f800000    # 1.0f

    .line 93
    .line 94
    const v6, 0x3f666666    # 0.9f

    .line 95
    .line 96
    .line 97
    const/high16 v7, 0x3f800000    # 1.0f

    .line 98
    .line 99
    const/4 v8, 0x1

    .line 100
    const/high16 v9, 0x3f000000    # 0.5f

    .line 101
    .line 102
    invoke-direct/range {v3 .. v11}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$g;

    .line 109
    .line 110
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$g;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3, p1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 122
    .line 123
    invoke-virtual {p0, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->B:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g4x;->b(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 2
    .line 3
    return-void
.end method

.method public final d()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->c()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Ll/n3x;->A(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    add-int/2addr v0, v1

    .line 43
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ge v0, v2, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 54
    .line 55
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 56
    .line 57
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ll/f4x;->R0(Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 69
    .line 70
    new-instance v3, Ll/pf60;

    .line 71
    .line 72
    const-string v4, "other_user_id"

    .line 73
    .line 74
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ll/pf60;

    .line 80
    .line 81
    const-string v4, "is_myself"

    .line 82
    .line 83
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-direct {v0, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    new-instance v4, Ll/pf60;

    .line 89
    .line 90
    const-string v5, "in_marriage_home"

    .line 91
    .line 92
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    filled-new-array {v3, v0, v4}, [Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v2, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 105
    .line 106
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 107
    .line 108
    .line 109
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 110
    .line 111
    add-int/2addr v0, v1

    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    const/4 v3, 0x0

    .line 119
    if-ge v0, v2, :cond_0

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 122
    .line 123
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 124
    .line 125
    add-int/2addr v2, v1

    .line 126
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v2}, Ll/n3x;->z(Lcom/p1/mobile/putong/data/Media;)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 140
    .line 141
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->setItemData(Lcom/p1/mobile/putong/data/User;)V

    .line 142
    .line 143
    .line 144
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 145
    .line 146
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    sub-int/2addr v2, v1

    .line 153
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 154
    .line 155
    if-ne v0, v2, :cond_1

    .line 156
    .line 157
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_1
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->z()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e0:Lrx/subjects/b;

    .line 173
    .line 174
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 175
    .line 176
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->h:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f4x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->c(Ll/f4x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/n3x;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/high16 v0, 0x41a00000    # 20.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const-string v1, "#FFFFFF"

    .line 26
    .line 27
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 37
    .line 38
    .line 39
    int-to-float v0, v0

    .line 40
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    invoke-virtual {v2, v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->s:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 48
    .line 49
    invoke-virtual {p2, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-object p1
.end method

.method public j()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->k:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/core/ui/RadarRipple;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->j:Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/n3x;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$h;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$h;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->k()Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Ll/c9c0;->I:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/RadarRipple;->setRadarColor(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->k()Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->j()Lv/VDraweeView;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Ll/asj0;->b0(Ll/vql;Lv/VDraweeView;)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->G:Landroid/animation/Animator;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->i()Landroid/widget/RelativeLayout;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->f()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    xor-int/lit8 p1, p1, 0x1

    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->G:Landroid/animation/Animator;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->G:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->G:Landroid/animation/Animator;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->s:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->i()Landroid/widget/RelativeLayout;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 55
    .line 56
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->t:Lv/VFrame_Shadow;

    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w:Lv/VFrame_Shadow;

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 81
    .line 82
    invoke-virtual {v3, v1}, Ll/f4x;->R0(Lcom/p1/mobile/putong/data/User;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->x()V

    .line 86
    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 89
    .line 90
    new-instance v4, Ll/pf60;

    .line 91
    .line 92
    const-string v5, "other_user_id"

    .line 93
    .line 94
    iget-object v6, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    new-instance v5, Ll/pf60;

    .line 100
    .line 101
    const-string v6, "is_myself"

    .line 102
    .line 103
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 104
    .line 105
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    new-instance v6, Ll/pf60;

    .line 109
    .line 110
    const-string v7, "in_marriage_home"

    .line 111
    .line 112
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 113
    .line 114
    invoke-direct {v6, v7, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    filled-new-array {v4, v5, v6}, [Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v3, v4}, Ll/l4g0;->p([Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->K:Ll/l4g0;

    .line 125
    .line 126
    invoke-static {v3}, Ll/w1e;->f(Ll/l4g0;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-static {v3}, Ll/n3x;->z(Lcom/p1/mobile/putong/data/Media;)V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 137
    .line 138
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->setItemData(Lcom/p1/mobile/putong/data/User;)V

    .line 139
    .line 140
    .line 141
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-le v1, v2, :cond_2

    .line 146
    .line 147
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v0}, Ll/n3x;->z(Lcom/p1/mobile/putong/data/Media;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 161
    .line 162
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->setItemData(Lcom/p1/mobile/putong/data/User;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 166
    .line 167
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 172
    .line 173
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->z()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->b:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v2, v1, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput-object v0, v2, v3

    .line 8
    .line 9
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->s:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 17
    .line 18
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->E:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->t:Lv/VFrame_Shadow;

    .line 29
    .line 30
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w:Lv/VFrame_Shadow;

    .line 39
    .line 40
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 49
    .line 50
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$c;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;->activities:Z

    .line 69
    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->c:Lv/VFrame;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 80
    .line 81
    iget-object v0, v0, Ll/dkb;->p4:Ll/wyd0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ljava/lang/CharSequence;

    .line 88
    .line 89
    invoke-static {}, Ll/yab;->U()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->d:Landroid/view/View;

    .line 98
    .line 99
    if-nez v0, :cond_0

    .line 100
    .line 101
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    const-string v0, "on"

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    const-string v0, "off"

    .line 111
    .line 112
    :goto_0
    const-string v1, "e_marriage_event_home_entrance"

    .line 113
    .line 114
    const-string v2, "p_marriage_home"

    .line 115
    .line 116
    invoke-static {v1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->c:Lv/VFrame;

    .line 120
    .line 121
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;

    .line 122
    .line 123
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->c:Lv/VFrame;

    .line 131
    .line 132
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->e:Lv/VFrame;

    .line 136
    .line 137
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$e;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->h:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 26
    .line 27
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->h:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->n()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->h:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    const-string v0, "suggest_empty"

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->B(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string p0, "e_marriage_recommend_empty"

    .line 36
    .line 37
    const-string v0, "p_marriage_home"

    .line 38
    .line 39
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->h:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    const-string v0, "suggest_end"

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->B(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string p0, "e_marriage_recommend_over"

    .line 36
    .line 37
    const-string v0, "p_marriage_home"

    .line 38
    .line 39
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->y:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->t0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public y(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->g:Lv/VText;

    .line 2
    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x64

    .line 10
    .line 11
    if-ge p1, v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "99+"

    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->g:Lv/VText;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->F:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
