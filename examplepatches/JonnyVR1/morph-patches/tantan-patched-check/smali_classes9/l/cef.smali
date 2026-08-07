.class public Ll/cef;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public A:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public w:Lv/VLinear;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S([ZLcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    aget-boolean p0, p0, v1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-boolean p0, p0, Ll/aw90;->c:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic T(Ll/cef;[ZLjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cef;->X([ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic V(Ll/cef;Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cef;->Y(Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic X([ZLjava/lang/String;Landroid/view/View;)V
    .locals 8

    .line 1
    const/4 p3, 0x0

    .line 2
    new-array v0, p3, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_test_mbti"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-boolean p3, v0, Ll/aw90;->c:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    aput-boolean v0, p1, p3

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v6, 0x1

    .line 39
    const/4 v7, 0x0

    .line 40
    const-string v1, ""

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    const/4 v4, 0x1

    .line 44
    const/4 v5, 0x1

    .line 45
    move-object v2, p2

    .line 46
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/api/o;->T:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 30
    .line 31
    const-string v2, "my_profile"

    .line 32
    .line 33
    invoke-static {v1, p0, p1, v2}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p2, v0, p0}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/uhx;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MbtiInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/cef;->x:Lv/VText;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MbtiInfo;->key:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MbtiInfo;->character:Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "%s%s"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/cef;->y:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MbtiInfo;->desc:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/cef;->A:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 40
    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MbtiInfo;->pic:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MbtiInfo;->labels:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/lang/String;

    .line 68
    .line 69
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 70
    .line 71
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 75
    .line 76
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    iget-object p1, p0, Ll/cef;->z:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 81
    .line 82
    const-string v1, "mbti"

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setTestKey(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/cef;->z:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setLabel(Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u793e\u4ea4\u6027\u683c"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "character"

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/cef;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string v1, "\u6211\u7684MBTI"

    .line 13
    .line 14
    sget v2, Ll/dbc0;->st:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Ll/kec0;->u2:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VLinear;

    .line 35
    .line 36
    iput-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 37
    .line 38
    sget v1, Ll/qa00;->e:I

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 50
    .line 51
    sget v1, Ll/adc0;->e8:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 58
    .line 59
    iput-object v0, p0, Ll/cef;->A:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 60
    .line 61
    iget-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 62
    .line 63
    sget v1, Ll/adc0;->g8:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lv/VText;

    .line 70
    .line 71
    iput-object v0, p0, Ll/cef;->x:Lv/VText;

    .line 72
    .line 73
    iget-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 74
    .line 75
    sget v1, Ll/adc0;->d8:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lv/VText;

    .line 82
    .line 83
    iput-object v0, p0, Ll/cef;->y:Lv/VText;

    .line 84
    .line 85
    iget-object v0, p0, Ll/cef;->w:Lv/VLinear;

    .line 86
    .line 87
    sget v1, Ll/adc0;->f8:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 94
    .line 95
    iput-object v0, p0, Ll/cef;->z:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 96
    .line 97
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 107
    .line 108
    const-string v1, "\u5185\u5728\u6027\u683c\u6d4b\u8bd5"

    .line 109
    .line 110
    sget v2, Ll/dbc0;->qt:I

    .line 111
    .line 112
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 113
    .line 114
    .line 115
    new-instance v0, Landroid/widget/LinearLayout;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    const/4 p1, 0x1

    .line 125
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/cef;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/cef;->w:Lv/VLinear;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 148
    .line 149
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    return-object v0
.end method

.method public z()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [Z

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    aput-boolean v2, v1, v2

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v3}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget-object v4, p0, Ll/cef;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    const-string v3, "\u6dfb\u52a0"

    .line 24
    .line 25
    invoke-virtual {v4, v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Ll/cef;->w:Lv/VLinear;

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v3, Ll/tr90;->o:Ljava/lang/String;

    .line 34
    .line 35
    const-string v4, "edit_profile"

    .line 36
    .line 37
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    new-instance v4, Ll/xdf;

    .line 46
    .line 47
    invoke-direct {v4, p0, v1, v3}, Ll/xdf;-><init>(Ll/cef;[ZLjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/cef;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const-string v3, ""

    .line 57
    .line 58
    const/4 v5, 0x2

    .line 59
    invoke-virtual {v4, v3, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Ll/cef;->w:Lv/VLinear;

    .line 63
    .line 64
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Ll/cef$a;

    .line 68
    .line 69
    invoke-direct {v3, p0, v1}, Ll/cef$a;-><init>(Ll/cef;[Z)V

    .line 70
    .line 71
    .line 72
    iget-object v4, p0, Ll/cef;->w:Lv/VLinear;

    .line 73
    .line 74
    invoke-static {v4, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v4, p0, Ll/cef;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 78
    .line 79
    invoke-static {v4, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-interface {v3}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 95
    .line 96
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p0, v3}, Ll/cef;->Z(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    iget-object v3, v3, Ll/dkb;->R:Ll/gyd0;

    .line 112
    .line 113
    invoke-virtual {v3}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 118
    .line 119
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 120
    .line 121
    if-eqz v3, :cond_2

    .line 122
    .line 123
    iget-object v4, v3, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-eqz v4, :cond_1

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_1
    iget-object v2, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 133
    .line 134
    new-instance v4, Ll/ydf;

    .line 135
    .line 136
    invoke-direct {v4, p0, v3}, Ll/ydf;-><init>(Ll/cef;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 144
    .line 145
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Ll/cef;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 149
    .line 150
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-interface {p0}, Ll/t3m;->lifecycle()Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    new-instance v2, Ll/zdf;

    .line 166
    .line 167
    invoke-direct {v2, v1}, Ll/zdf;-><init>([Z)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    new-instance v0, Ll/aef;

    .line 179
    .line 180
    invoke-direct {v0}, Ll/aef;-><init>()V

    .line 181
    .line 182
    .line 183
    new-instance v1, Ll/bef;

    .line 184
    .line 185
    invoke-direct {v1}, Ll/bef;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 193
    .line 194
    .line 195
    return-void
.end method
