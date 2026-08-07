.class public Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;
.super Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;
.source "SourceFile"


# instance fields
.field public d:Lv/VFrame;

.field public e:Landroid/view/View;

.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VLinear;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public m:Lv/VEditText;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic A2(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->m:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string p0, "\u4e0d\u80fd\u53d1\u9001\u7a7a\u767d\u4fe1\u606f"

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->o:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->p:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->C2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic B2(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    :goto_0
    return-void

    .line 40
    :cond_1
    new-instance v0, Ljava/security/SecureRandom;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/String;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->pageId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "answer_write"

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    filled-new-array {p0}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v0, "e_change_one"

    .line 91
    .line 92
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static D2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "userId"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p1, "msgId"

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p1, "question"

    .line 19
    .line 20
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const/16 p1, 0x277f

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/y7c0;->e:I

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static E2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "userId"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p1, "question"

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const/16 p1, 0x277f

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    sget p1, Ll/y7c0;->e:I

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic e2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->y2()V

    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->A2(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance v0, Ll/hfh0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/hfh0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v1, 0xc8

    .line 29
    .line 30
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->j:Lv/VLinear;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->p:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->g:Lv/VImage;

    .line 52
    .line 53
    new-instance v1, Ll/ifh0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/ifh0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 62
    .line 63
    new-instance v1, Ll/jfh0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/jfh0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->j:Lv/VLinear;

    .line 72
    .line 73
    new-instance v1, Ll/kfh0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/kfh0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic r2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->B2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->z2(Landroid/view/View;)V

    return-void
.end method

.method private synthetic y2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "https://fe-static.tancdn.com/v1/raw/5266f729-e0ff-4677-96f9-09373278f58214.svga"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic z2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_close_click"

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final C2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "icebreak_qa"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 24
    .line 25
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 34
    .line 35
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->title:Ljava/lang/String;

    .line 36
    .line 37
    :cond_0
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 40
    .line 41
    iput-object p3, p2, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-nez p2, :cond_1

    .line 48
    .line 49
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 52
    .line 53
    iput-object p4, p2, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->refMsgID:Ljava/lang/String;

    .line 54
    .line 55
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    const/4 p3, 0x0

    .line 60
    invoke-virtual {p2, p1, v0, p3}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ll/lfh0;

    .line 65
    .line 66
    invoke-direct {p2}, Ll/lfh0;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance p3, Ll/mfh0;

    .line 70
    .line 71
    invoke-direct {p3}, Ll/mfh0;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->pageId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string p2, "to_uid"

    .line 86
    .line 87
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->o:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const-string p3, "answer_write"

    .line 94
    .line 95
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p3, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    filled-new-array {p2, p3}, [Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    const-string p3, "e_sent_answer"

    .line 106
    .line 107
    invoke-static {p3, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    const/4 p1, -0x1

    .line 111
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->w2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->l:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/g9c0;->i:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->k:Lv/VImage;

    .line 35
    .line 36
    sget v0, Ll/ibc0;->F7:I

    .line 37
    .line 38
    invoke-static {p2, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->m:Lv/VEditText;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/g9c0;->g:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->m:Lv/VEditText;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v1, Ll/g9c0;->i:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->m:Lv/VEditText;

    .line 72
    .line 73
    invoke-static {p2}, Ll/wpe;->a(Lv/VEditText;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/g9c0;->j:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->g:Lv/VImage;

    .line 92
    .line 93
    sget p2, Ll/ibc0;->m7:I

    .line 94
    .line 95
    invoke-static {p0, p2}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 96
    .line 97
    .line 98
    :cond_0
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "userId"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->o:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "msgId"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->p:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "question"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ljava/security/SecureRandom;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ljava/lang/String;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 67
    .line 68
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->initDataOnCreate()V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/gfh0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/gfh0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public initPageHelper()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 5
    .line 6
    const-string v1, "answer_write"

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->q:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k2()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public l2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->f:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public m2()Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->m:Lv/VEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public n2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->d:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "msgId"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const-string p0, "p_exchange_answer_question_pop"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "p_exchange_answer_pop"

    .line 21
    .line 22
    return-object p0
.end method

.method public w2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nfh0;->b(Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
