.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e(Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pfz;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()Lcom/p1/mobile/android/app/Act;
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

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p4, 0x0

    .line 2
    invoke-virtual {p0, p4, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->g(ZLl/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->c()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p1, p0, p2}, Ll/r97;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    :catch_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->f:Ljava/lang/String;

    .line 28
    .line 29
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->title:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->b:Lv/VText;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->subTitle:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    const-string v0, "\u5979"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string v0, "\u4ed6"

    .line 61
    .line 62
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "\u7ed9%s\u5199\u60c5\u4e66"

    .line 67
    .line 68
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    const/4 p2, 0x1

    .line 76
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 82
    .line 83
    new-instance v2, Ll/ofz;

    .line 84
    .line 85
    invoke-direct {v2, p0, p3, v0, p1}, Ll/ofz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->e:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 92
    .line 93
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->g(ZLl/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const/4 p1, 0x0

    .line 98
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    :goto_1
    return-void
.end method

.method public final g(ZLl/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;)V
    .locals 4

    .line 1
    const-string v0, "trigger_type"

    .line 2
    .line 3
    const-string v1, "to_uid"

    .line 4
    .line 5
    const-string v2, "p_chat_view"

    .line 6
    .line 7
    const-string v3, "e_love_letter_guide"

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2, v3}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p2, v3}, Ll/n100;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->d:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget p1, p3, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->triggerType:I

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v3, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->d:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget p1, p3, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->triggerType:I

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v3, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->b:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Ll/g9c0;->j:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->d()V

    .line 67
    .line 68
    .line 69
    return-void
.end method
