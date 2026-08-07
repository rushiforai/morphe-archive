.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b$b;


# instance fields
.field public a:Lv/VImage;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadView;

.field public d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

.field public e:Lv/VPullUpRecyclerView;

.field public f:Lv/VText;

.field public g:Z

.field public h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

.field public i:Lcom/p1/mobile/android/app/Frag;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->f4()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->g:Z

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    invoke-static {}, Ll/joa;->f4()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    invoke-static {}, Ll/joa;->f4()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->g:Z

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->s(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->u(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->r(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->t(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->g:Z

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->p(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "e_meet_nearby_card"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/joa;->M3()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 27
    .line 28
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->I9(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    const-string p0, "p_navigation,nearby_module"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string p0, "p_meet,e_meet_nearby_card,click"

    .line 52
    .line 53
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 54
    .line 55
    invoke-interface {p1, p2, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "e_odiamond_sayhi"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const-string v1, "p_navigation_nearby,odiamond_sayhi"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v1, "p_meet,e_odiamond_sayhi,click"

    .line 30
    .line 31
    :goto_0
    new-instance v2, Ll/fey;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Ll/fey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Dl(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iey;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o()Lcom/p1/mobile/android/app/Act;
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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->n(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->q()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z
    .locals 12

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v8

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v9

    .line 21
    new-instance v10, Ll/gey;

    .line 22
    .line 23
    invoke-direct {v10, p0}, Ll/gey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)V

    .line 24
    .line 25
    .line 26
    new-instance v11, Ll/hey;

    .line 27
    .line 28
    move-object/from16 v7, p6

    .line 29
    .line 30
    invoke-direct {v11, p0, v7}, Ll/hey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 31
    .line 32
    .line 33
    move v2, p1

    .line 34
    move v3, p2

    .line 35
    move v4, p3

    .line 36
    move/from16 v5, p4

    .line 37
    .line 38
    move-object/from16 v6, p5

    .line 39
    .line 40
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Pb(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Ll/x20;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method public final q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->e:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/gbc0;->Z0:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->a:Lv/VImage;

    .line 20
    .line 21
    sget v1, Ll/gbc0;->g1:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$a;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;Landroid/content/Context;I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->e:Lv/VPullUpRecyclerView;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;->M(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b$b;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->e:Lv/VPullUpRecyclerView;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->e:Lv/VPullUpRecyclerView;

    .line 63
    .line 64
    new-instance v1, Ll/qdk;

    .line 65
    .line 66
    sget v3, Ll/qa00;->h:I

    .line 67
    .line 68
    invoke-direct {v1, v3, v2}, Ll/qdk;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 75
    .line 76
    new-instance v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/a;

    .line 77
    .line 78
    new-instance v2, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/a;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/a$a;)V

    .line 84
    .line 85
    .line 86
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->e:Lv/VPullUpRecyclerView;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->f:Lv/VText;

    .line 95
    .line 96
    const-string v1, "\u67e5\u770b\u66f4\u591a"

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->f:Lv/VText;

    .line 102
    .line 103
    new-instance v1, Ll/dey;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/dey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {p1}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    new-instance v5, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/f4a;->s3(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;->K(Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setMyTabStyle(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->a:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->f:Lv/VText;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadView;

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_meet_nearby_total"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->z()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/f4a;->s3(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;->K(Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_meet_nearby_total"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->z()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;Lcom/p1/mobile/android/app/Frag;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->x(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;Lcom/p1/mobile/android/app/Frag;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;Lcom/p1/mobile/android/app/Frag;Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->g:Z

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i:Lcom/p1/mobile/android/app/Frag;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;->users:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p2, p1, v0, p3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;->L(Ljava/util/List;ZZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->y()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadView;

    .line 4
    .line 5
    const-string v2, "\u9644\u8fd1\u7684\u4eba"

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 15
    .line 16
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b:Lv/VText;

    .line 27
    .line 28
    new-instance v1, Ll/eey;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/eey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 41
    .line 42
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadView;

    .line 46
    .line 47
    sget v0, Ll/gbc0;->h1:I

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "\u7cbe\u786e\u641c\u7d22\u9644\u8fd13\u516c\u91cc\u5185\u7684\u7528\u6237"

    .line 54
    .line 55
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadView;->b(Ljava/lang/Integer;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->o()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "from_my_tab"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "from_meet"

    .line 17
    .line 18
    :goto_0
    invoke-static {v1, p0}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
