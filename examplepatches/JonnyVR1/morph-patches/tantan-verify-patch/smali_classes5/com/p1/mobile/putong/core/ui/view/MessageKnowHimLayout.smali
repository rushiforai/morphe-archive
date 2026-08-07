.class public Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

.field public b:Lv/VFrame;

.field public c:Lv/AutoVDraweeView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VFrame;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VLinear;

.field public i:Lv/AutoVDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VLinear;

.field public m:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

.field public n:Landroid/view/View;

.field public o:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

.field public p:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

.field public q:Landroid/view/View;

.field public r:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

.field public s:Lv/VFrame;

.field public t:Landroid/widget/TextView;

.field public u:Z

.field public v:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->d(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->e(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private getRootBg()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget p0, Ll/ibc0;->s:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    sget p0, Ll/ibc0;->v:I

    .line 19
    .line 20
    return p0
.end method

.method private setMessageKnowHimInSVIPUI(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->s:Lv/VFrame;

    .line 8
    .line 9
    sget v2, Ll/ibc0;->z1:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->t:Landroid/widget/TextView;

    .line 15
    .line 16
    sget v2, Ll/ibc0;->H6:I

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->t:Landroid/widget/TextView;

    .line 22
    .line 23
    const-string v1, "\u5f00\u901a\u4f1a\u5458\u89e3\u9501"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->n:Landroid/view/View;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget p1, Ll/ibc0;->n:I

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->q:Landroid/view/View;

    .line 38
    .line 39
    sget p1, Ll/ibc0;->n:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    sget p1, Ll/ibc0;->r:I

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->q:Landroid/view/View;

    .line 51
    .line 52
    sget p1, Ll/ibc0;->r:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private setTitle(Z)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "\u5979"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "\u4ed6"

    .line 21
    .line 22
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "\u66f4\u4e86\u89e3%s"

    .line 29
    .line 30
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->e:Landroid/widget/TextView;

    .line 38
    .line 39
    filled-new-array {p1, p1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v3, "\u4e86\u89e3%s\u7684\u6027\u683c\uff0c\u770b%s\u662f\u5426\u548c\u4f60\u5408\u62cd"

    .line 44
    .line 45
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->j:Landroid/widget/TextView;

    .line 53
    .line 54
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->k:Landroid/widget/TextView;

    .line 66
    .line 67
    filled-new-array {p1, p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jfz;->a(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Ljava/lang/String;Landroid/view/View;)V
    .locals 16

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i()V

    .line 2
    .line 3
    .line 4
    move-object/from16 v0, p0

    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v3, v0

    .line 37
    check-cast v3, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    const/4 v8, 0x0

    .line 42
    const/4 v9, 0x0

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v7, 0x0

    .line 45
    move-object/from16 v4, p1

    .line 46
    .line 47
    invoke-interface/range {v2 .. v9}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ya(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move-object v11, v0

    .line 64
    check-cast v11, Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    sget-object v13, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    const/4 v14, 0x0

    .line 69
    const/4 v15, 0x0

    .line 70
    move-object/from16 v12, p1

    .line 71
    .line 72
    invoke-interface/range {v10 .. v15}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/data/UserActivityInfo;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/data/UserActivityInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->m:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->o:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->p:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->r:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/UserActivityInfo;->activityInfos:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x4

    .line 30
    if-lt v1, v2, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-ge v1, v2, :cond_1

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserActivityInfo;->activityInfos:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;

    .line 52
    .line 53
    iget-boolean v4, p1, Lcom/p1/mobile/putong/data/UserActivityInfo;->actorPrivilege:Z

    .line 54
    .line 55
    if-eqz v4, :cond_0

    .line 56
    .line 57
    iget-object v4, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->icon:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v5, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->value:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->category:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v2, v4, v5, v3}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    iget-object v4, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->icon:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v5, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->category:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserActivityInfoItem;->value:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v4, v5, v3}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimItem;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->h:Lv/VLinear;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 86
    .line 87
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/data/UserActivityInfo;Z)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/data/UserActivityInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget v3, Ll/g9c0;->Y:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 22
    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->v:I

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    const-string v3, "e_know_him_better"

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    const/4 v5, 0x0

    .line 31
    if-ne v1, v2, :cond_3

    .line 32
    .line 33
    const-string v1, "p_chat_view"

    .line 34
    .line 35
    invoke-static {v3, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->j:Landroid/widget/TextView;

    .line 39
    .line 40
    const/high16 v2, 0x41700000    # 15.0f

    .line 41
    .line 42
    invoke-virtual {v1, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    const/high16 v2, 0x41400000    # 12.0f

    .line 48
    .line 49
    invoke-virtual {v1, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 50
    .line 51
    .line 52
    const/high16 v1, 0x41a80000    # 21.0f

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 59
    .line 60
    new-array v6, v4, [Landroid/view/View;

    .line 61
    .line 62
    aput-object v3, v6, v5

    .line 63
    .line 64
    invoke-static {v2, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 77
    .line 78
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 79
    .line 80
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 81
    .line 82
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 102
    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->b:Lv/VFrame;

    .line 106
    .line 107
    if-eqz v1, :cond_0

    .line 108
    .line 109
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->h:Lv/VLinear;

    .line 113
    .line 114
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 118
    .line 119
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 123
    .line 124
    sget v0, Ll/ibc0;->q:I

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_0
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->f(Lcom/p1/mobile/putong/data/UserActivityInfo;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->s:Lv/VFrame;

    .line 137
    .line 138
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 142
    .line 143
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->getRootBg()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->setMessageKnowHimInSVIPUI(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->b:Lv/VFrame;

    .line 155
    .line 156
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->f(Lcom/p1/mobile/putong/data/UserActivityInfo;)V

    .line 160
    .line 161
    .line 162
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 163
    .line 164
    if-eqz p1, :cond_2

    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 167
    .line 168
    sget v0, Ll/ibc0;->q:I

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->s:Lv/VFrame;

    .line 175
    .line 176
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 180
    .line 181
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->getRootBg()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 186
    .line 187
    .line 188
    :goto_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->setTitle(Z)V

    .line 189
    .line 190
    .line 191
    const-string p1, "p_chat,femalevip_knowbetter"

    .line 192
    .line 193
    goto/16 :goto_2

    .line 194
    .line 195
    :cond_3
    if-ne v1, v4, :cond_5

    .line 196
    .line 197
    const-string v1, "p_suggest_user_profile_info_view"

    .line 198
    .line 199
    invoke-static {v3, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->h:Lv/VLinear;

    .line 203
    .line 204
    sget v2, Ll/qa00;->q:I

    .line 205
    .line 206
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 207
    .line 208
    .line 209
    const/high16 v1, 0x41b00000    # 22.0f

    .line 210
    .line 211
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 216
    .line 217
    new-array v6, v4, [Landroid/view/View;

    .line 218
    .line 219
    aput-object v3, v6, v5

    .line 220
    .line 221
    invoke-static {v2, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 222
    .line 223
    .line 224
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 225
    .line 226
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 231
    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->j:Landroid/widget/TextView;

    .line 234
    .line 235
    const/high16 v2, 0x41900000    # 18.0f

    .line 236
    .line 237
    invoke-virtual {v1, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->k:Landroid/widget/TextView;

    .line 241
    .line 242
    const/high16 v2, 0x41500000    # 13.0f

    .line 243
    .line 244
    invoke-virtual {v1, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 245
    .line 246
    .line 247
    sget v1, Ll/qa00;->o:I

    .line 248
    .line 249
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 250
    .line 251
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 252
    .line 253
    sget v1, Ll/qa00;->j:I

    .line 254
    .line 255
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 256
    .line 257
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 260
    .line 261
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 265
    .line 266
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    sget v2, Ll/g9c0;->a0:I

    .line 271
    .line 272
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->b:Lv/VFrame;

    .line 280
    .line 281
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->l:Lv/VLinear;

    .line 285
    .line 286
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->getRootBg()I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 291
    .line 292
    .line 293
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-eqz v0, :cond_4

    .line 298
    .line 299
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UserActivityInfo;->actorPrivilege:Z

    .line 300
    .line 301
    if-nez v0, :cond_4

    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_4
    move v4, v5

    .line 305
    :goto_1
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 306
    .line 307
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->f(Lcom/p1/mobile/putong/data/UserActivityInfo;)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->s:Lv/VFrame;

    .line 311
    .line 312
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 313
    .line 314
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 315
    .line 316
    .line 317
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->setTitle(Z)V

    .line 318
    .line 319
    .line 320
    const-string p1, "p_profile,femalevip_knowbetter"

    .line 321
    .line 322
    goto :goto_2

    .line 323
    :cond_5
    const-string p1, ""

    .line 324
    .line 325
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 326
    .line 327
    new-instance v0, Ll/ifz;

    .line 328
    .line 329
    invoke-direct {v0, p0, p1}, Ll/ifz;-><init>(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 333
    .line 334
    .line 335
    return-void
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->c:Lv/AutoVDraweeView;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxPUUtGUUE2Q1hFWFFJNU0yTkhaN09BWlhXWlBPUzE0IiwidyI6MTI2LCJoIjoxMjYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzA1NDAwNDc2MzE5Mzk0MzI3fQ.png"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 10
    .line 11
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxWRVJYM0hFWFk3NEJKR0ZDVzVFUlpSUVRYMzRVWjE0IiwidyI6NjYsImgiOjY3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NTU5MDY5OTM1NDA4NzgzMDc4NH0.png"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->g:Landroid/widget/TextView;

    .line 17
    .line 18
    const-string v1, "#EF8E44"

    .line 19
    .line 20
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->g:Landroid/widget/TextView;

    .line 28
    .line 29
    sget v2, Ll/ibc0;->G6:I

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v0, v2, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->t:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->t:Landroid/widget/TextView;

    .line 45
    .line 46
    sget v1, Ll/ibc0;->G6:I

    .line 47
    .line 48
    invoke-virtual {v0, v1, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->s:Lv/VFrame;

    .line 52
    .line 53
    sget v1, Ll/ibc0;->u:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->n:Landroid/view/View;

    .line 59
    .line 60
    sget v1, Ll/ibc0;->r:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->q:Landroid/view/View;

    .line 66
    .line 67
    sget v0, Ll/ibc0;->r:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->v:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const-string p0, "p_chat_view"

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p0, "p_suggest_user_profile_info_view"

    .line 10
    .line 11
    :goto_0
    const-string v0, "e_know_him_better"

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->c:Lv/AutoVDraweeView;

    .line 8
    .line 9
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjQzTDNQMlVGNVlRUlU3RFZSTTNZUVBaWTdZT0JRSzE0IiwidyI6MTI2LCJoIjoxMjYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDgzMDQ2OTAyODk4NTU4OTE0Mn0.png"

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->i:Lv/AutoVDraweeView;

    .line 16
    .line 17
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpENUFERlRQNTQyQ1E2UTdFVEhCN1k1NUZFTkhYRTE0IiwidyI6NjYsImgiOjY3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE3Mjg0MDYxMDA1NTEzMjkyOH0.png"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/hfz;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/hfz;-><init>(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->h()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public setLocked(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPage(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->v:I

    .line 2
    .line 3
    return-void
.end method
