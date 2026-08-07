.class public Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:Lv/VText;

.field public final l:[Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 11
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 13
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    return-void
.end method

.method public static synthetic a(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Landroid/view/View;)V
    .locals 9

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fzq;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v2, 0x1

    .line 35
    if-ne v0, v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 56
    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 64
    .line 65
    iget p2, p2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 66
    .line 67
    if-nez p2, :cond_1

    .line 68
    .line 69
    :cond_0
    return-void

    .line 70
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {p0}, Ll/fzq;->p()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const/4 v7, 0x0

    .line 83
    const/4 v8, 0x0

    .line 84
    const-string v5, "kankan_reply"

    .line 85
    .line 86
    const/4 v6, 0x0

    .line 87
    move-object v3, p1

    .line 88
    invoke-interface/range {v2 .. v8}, Ll/r97;->A5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v3, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 93
    .line 94
    .line 95
    sget p1, Ll/y7c0;->e:I

    .line 96
    .line 97
    invoke-virtual {v3, p1, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 98
    .line 99
    .line 100
    new-instance p1, Ll/pf60;

    .line 101
    .line 102
    const-string p2, "user_id"

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/fzq;->p()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-direct {p1, p2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    filled-new-array {p1}, [Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string p1, "e_kankan_stranger_message_pic"

    .line 116
    .line 117
    const-string p2, "p_kankan_stranger_message"

    .line 118
    .line 119
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "meet"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "undefined"

    .line 15
    .line 16
    :goto_0
    invoke-static {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/d;->i(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget p2, Ll/y7c0;->e:I

    .line 20
    .line 21
    sget v0, Ll/y7c0;->d:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/pf60;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "user_id"

    .line 33
    .line 34
    invoke-direct {p2, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/pf60;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/fzq;->o()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/4 v3, 0x0

    .line 44
    if-lez v2, :cond_1

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move v2, v3

    .line 49
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v4, "is_red_dot"

    .line 54
    .line 55
    invoke-direct {v0, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const-string v0, "e_kankan_stranger_message_item"

    .line 63
    .line 64
    const-string v2, "p_kankan_stranger_message"

    .line 65
    .line 66
    invoke-static {v0, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-instance v0, Ll/pf60;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    filled-new-array {v0}, [Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "e_meet_message_box_item"

    .line 93
    .line 94
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-virtual {p1, v3}, Ll/fzq;->M(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->d2()Ll/wj2;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Ll/wj2;->d()V

    .line 105
    .line 106
    .line 107
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eie;->a(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(I)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingInflatedId"
        }
    .end annotation

    .line 1
    sget v0, Ll/qec0;->B:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :pswitch_0
    sget v0, Ll/qec0;->y:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :pswitch_1
    sget v0, Ll/qec0;->E:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_2
    sget v0, Ll/qec0;->z:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :pswitch_3
    sget v0, Ll/qec0;->C:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :pswitch_4
    sget v0, Ll/qec0;->D:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_5
    sget v0, Ll/qec0;->A:I

    .line 23
    .line 24
    :goto_0
    :pswitch_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->d()Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->j:Lv/VFrame;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget v0, Ll/edc0;->A4:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VText;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->k:Lv/VText;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 50
    .line 51
    sget v1, Ll/edc0;->u1:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lv/VDraweeView;

    .line 58
    .line 59
    aput-object v1, v0, v2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 62
    .line 63
    sget v1, Ll/edc0;->x1:I

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lv/VDraweeView;

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    aput-object v1, v0, v3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 75
    .line 76
    sget v1, Ll/edc0;->w1:I

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lv/VDraweeView;

    .line 83
    .line 84
    const/4 v3, 0x2

    .line 85
    aput-object v1, v0, v3

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 88
    .line 89
    sget v1, Ll/edc0;->s1:I

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lv/VDraweeView;

    .line 96
    .line 97
    const/4 v3, 0x3

    .line 98
    aput-object v1, v0, v3

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->j:Lv/VFrame;

    .line 101
    .line 102
    invoke-virtual {p0, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    nop

    .line 107
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;I)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v0, Ll/cie;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/cie;-><init>(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance p3, Ll/die;

    .line 12
    .line 13
    invoke-direct {p3, p2, p1}, Ll/die;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final g(Ll/fzq;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->j:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p2, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/fzq;->g()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->h(Ll/fzq;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->j:Lv/VFrame;

    .line 27
    .line 28
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->k:Lv/VText;

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/fzq;->g()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string p2, "\u52a8\u6001\u5df2\u5220\u9664"

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->k:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/fzq;->g()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    xor-int/2addr p1, v1

    .line 56
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const/4 v2, 0x6

    .line 61
    if-ne p2, v2, :cond_3

    .line 62
    .line 63
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/fzq;->h()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->k:Lv/VText;

    .line 80
    .line 81
    iget p1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 82
    .line 83
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string p2, "%s\'\'"

    .line 96
    .line 97
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    const/4 v2, 0x5

    .line 106
    if-ne p2, v2, :cond_4

    .line 107
    .line 108
    move p2, v1

    .line 109
    :cond_4
    :goto_1
    if-ge v0, p2, :cond_9

    .line 110
    .line 111
    if-nez p1, :cond_5

    .line 112
    .line 113
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 116
    .line 117
    aget-object v2, v2, v0

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_5
    invoke-virtual {p1}, Ll/fzq;->h()Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 132
    .line 133
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 134
    .line 135
    if-eqz v2, :cond_6

    .line 136
    .line 137
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_6
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 143
    .line 144
    if-eqz v2, :cond_7

    .line 145
    .line 146
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_7
    const/4 v1, 0x0

    .line 150
    :goto_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    if-eqz v2, :cond_8

    .line 155
    .line 156
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 157
    .line 158
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 159
    .line 160
    aget-object v3, v3, v0

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v2, v3, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 167
    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_8
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 171
    .line 172
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l:[Lv/VDraweeView;

    .line 173
    .line 174
    aget-object v2, v2, v0

    .line 175
    .line 176
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 177
    .line 178
    .line 179
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_9
    return-void
.end method

.method public final h(Ll/fzq;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final i(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->d:Lv/VText;

    .line 2
    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->d:Lv/VText;

    .line 10
    .line 11
    const/16 v0, 0x63

    .line 12
    .line 13
    if-le p1, v0, :cond_0

    .line 14
    .line 15
    const-string p1, "99+"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const/16 p0, 0x8

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;II)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->c:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/fzq;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->e:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/fzq;->q()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ll/fzq;->o()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->i(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->k(Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p2}, Ll/fzq;->n()D

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->l(D)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->h:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {p2}, Ll/fzq;->i()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Ll/fzq;->r()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v1, 0x0

    .line 79
    const/4 v2, 0x1

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->g:Lv/VImage;

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-interface {v3}, Ll/r97;->j2()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->g:Lv/VImage;

    .line 100
    .line 101
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    invoke-virtual {p2}, Ll/fzq;->t()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->g:Lv/VImage;

    .line 110
    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    sget v0, Ll/ibc0;->K5:I

    .line 114
    .line 115
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->g:Lv/VImage;

    .line 119
    .line 120
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->f:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    invoke-virtual {p2}, Ll/fzq;->t()Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->g(Ll/fzq;I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->f(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;I)V

    .line 140
    .line 141
    .line 142
    new-instance p0, Ll/pf60;

    .line 143
    .line 144
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    const-string p3, "user_id"

    .line 149
    .line 150
    invoke-direct {p0, p3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    filled-new-array {p0}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, "e_kankan_stranger_message_pic"

    .line 158
    .line 159
    const-string p4, "p_kankan_stranger_message"

    .line 160
    .line 161
    invoke-static {p1, p4, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 162
    .line 163
    .line 164
    new-instance p0, Ll/pf60;

    .line 165
    .line 166
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-direct {p0, p3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    new-instance p1, Ll/pf60;

    .line 174
    .line 175
    invoke-virtual {p2}, Ll/fzq;->o()I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-lez p2, :cond_3

    .line 180
    .line 181
    move v1, v2

    .line 182
    :cond_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    const-string p3, "is_red_dot"

    .line 187
    .line 188
    invoke-direct {p1, p3, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    const-string p1, "e_kankan_stranger_message_item"

    .line 196
    .line 197
    invoke-static {p1, p4, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->i:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u6211\u53d1\u51fa\u7684"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p1, "\u6211\u6536\u5230\u7684"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final l(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->i:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
