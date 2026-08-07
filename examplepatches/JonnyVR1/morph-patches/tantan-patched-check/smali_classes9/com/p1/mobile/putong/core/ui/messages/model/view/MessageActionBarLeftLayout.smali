.class public Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

.field public b:Lv/VFrame;

.field public c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public d:Lv/VLinear;

.field public e:Lv/VDraweeView;

.field public f:Lv/VLinear;

.field public g:Lv/VFrame;

.field public h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VText;

.field public m:Lv/VDraweeView;

.field public n:Lv/VImage;

.field public o:Lv/VLinear;

.field public p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public q:Lv/VImage;

.field public r:Lv/VLinear;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VImage;

.field public y:Lv/VText;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "guide_type"

    .line 2
    .line 3
    const-string v0, "tag"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_character_guide"

    .line 14
    .line 15
    const-string v1, "p_chat_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object p2, Lcom/p1/mobile/putong/core/api/o;->T:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const-string v2, "chat_tag"

    .line 26
    .line 27
    invoke-static {p2, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->r(Lcom/p1/mobile/putong/data/User;Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->s(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u(Lcom/p1/mobile/putong/data/User;Ll/clz;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    xor-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->w:Lv/VText;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, "\u5df2\u6ce8\u9500"

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nuy;->a(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ina;->x3(Lcom/p1/mobile/putong/data/User;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0, p1}, Ll/r97;->W(Lcom/p1/mobile/putong/data/User;)J

    .line 39
    .line 40
    .line 41
    move-result-wide p0

    .line 42
    long-to-double p0, p0

    .line 43
    invoke-static {p0, p1, v0}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0, p1}, Ll/r97;->I1(Lcom/p1/mobile/putong/data/User;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_2

    .line 75
    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide p0

    .line 80
    long-to-double p0, p0

    .line 81
    invoke-static {p0, p1, v0}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 87
    .line 88
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 89
    .line 90
    invoke-static {p0, p1, v0}, Ll/pzi0;->J(DZ)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_3
    const-string p0, ""

    .line 96
    .line 97
    return-object p0
.end method

.method public final h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v1, -0x1

    .line 26
    if-eq p1, v1, :cond_1

    .line 27
    .line 28
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget v2, Ll/g9c0;->o:I

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-direct {v1, p0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-int/2addr p0, p1

    .line 52
    const/16 p2, 0x21

    .line 53
    .line 54
    invoke-virtual {v0, v1, p1, p0, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-object v0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->d:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->d:Lv/VLinear;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget v1, Ll/g9c0;->g:I

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p1}, Ll/ux0;->f()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 40
    .line 41
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v1, Ll/g9c0;->i:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const-string v0, "#99212121"

    .line 67
    .line 68
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 76
    .line 77
    const/4 v0, 0x2

    .line 78
    const/high16 v1, 0x41800000    # 16.0f

    .line 79
    .line 80
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const/4 p1, 0x1

    .line 90
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;Ll/fwy;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "p_chat_view"

    .line 5
    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    new-instance v1, Ll/muy;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2}, Ll/muy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;Ll/ovb0;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ll/fwy;",
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/app/ActivityManager$TaskDescription;

    .line 8
    .line 9
    iget-object v1, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget v3, Ll/g9c0;->U:I

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {v0, v1, v3, v2}, Landroid/app/ActivityManager$TaskDescription;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTaskDescription(Landroid/app/ActivityManager$TaskDescription;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 44
    .line 45
    move-object v4, v0

    .line 46
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v3, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_3

    .line 71
    .line 72
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 73
    .line 74
    invoke-virtual {v2}, Ll/clz;->l7()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_3

    .line 85
    .line 86
    invoke-static {v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-nez v3, :cond_2

    .line 95
    .line 96
    const-string v3, " \u00b7 "

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    const/4 v8, 0x1

    .line 118
    xor-int/2addr v0, v8

    .line 119
    iget-object v2, v4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->B(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 127
    .line 128
    iget-object v3, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_4

    .line 139
    .line 140
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->B(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_7

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_7

    .line 163
    .line 164
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_6

    .line 169
    .line 170
    iget-boolean v2, v4, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 171
    .line 172
    if-eqz v2, :cond_5

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_5
    iget-object v2, v4, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 176
    .line 177
    const-string v3, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 178
    .line 179
    invoke-static {v3}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    if-eqz v2, :cond_7

    .line 188
    .line 189
    const-string v2, "\u6635\u79f0\u5df2\u91cd\u7f6e"

    .line 190
    .line 191
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->B(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_6
    :goto_1
    const-string v2, "\u5df2\u6ce8\u9500"

    .line 196
    .line 197
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->B(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_7
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 201
    .line 202
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->e()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    const-string v3, "p_chat_view"

    .line 218
    .line 219
    if-eqz v2, :cond_8

    .line 220
    .line 221
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_8

    .line 226
    .line 227
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-nez v2, :cond_8

    .line 232
    .line 233
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isSupremePartner()Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-eqz v2, :cond_8

    .line 238
    .line 239
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 240
    .line 241
    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 242
    .line 243
    .line 244
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 245
    .line 246
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->n0()V

    .line 247
    .line 248
    .line 249
    goto/16 :goto_4

    .line 250
    .line 251
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    if-eqz v2, :cond_9

    .line 264
    .line 265
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    if-eqz v2, :cond_9

    .line 270
    .line 271
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    if-nez v2, :cond_9

    .line 276
    .line 277
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    if-eqz v2, :cond_9

    .line 282
    .line 283
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 284
    .line 285
    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 286
    .line 287
    .line 288
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 289
    .line 290
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->m0()V

    .line 291
    .line 292
    .line 293
    goto/16 :goto_4

    .line 294
    .line 295
    :cond_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-interface {v2}, Ll/r97;->A1()Z

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    if-eqz v2, :cond_11

    .line 308
    .line 309
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    if-eqz v2, :cond_11

    .line 314
    .line 315
    invoke-static {v4}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    if-eqz v2, :cond_11

    .line 320
    .line 321
    invoke-static {}, Ll/nrb0;->b()Z

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    if-nez v2, :cond_11

    .line 326
    .line 327
    iget-object v2, v4, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 328
    .line 329
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getUserCharacter()Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    iget-object v2, v2, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 334
    .line 335
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->s:Lv/VText;

    .line 336
    .line 337
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    .line 339
    .line 340
    const-string v5, "\u51b0\u5c71\u5a01\u58eb\u5fcc"

    .line 341
    .line 342
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 343
    .line 344
    .line 345
    move-result v5

    .line 346
    if-eqz v5, :cond_a

    .line 347
    .line 348
    const-string v2, "#309cec"

    .line 349
    .line 350
    goto :goto_3

    .line 351
    :cond_a
    const-string v5, "\u9648\u5e74\u62c9\u83f2\u9152"

    .line 352
    .line 353
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 354
    .line 355
    .line 356
    move-result v5

    .line 357
    if-eqz v5, :cond_b

    .line 358
    .line 359
    const-string v2, "#e498b1"

    .line 360
    .line 361
    goto :goto_3

    .line 362
    :cond_b
    const-string v5, "\u6e05\u9192\u51b0\u7f8e\u5f0f"

    .line 363
    .line 364
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 365
    .line 366
    .line 367
    move-result v5

    .line 368
    if-eqz v5, :cond_c

    .line 369
    .line 370
    const-string v2, "#6f4106"

    .line 371
    .line 372
    goto :goto_3

    .line 373
    :cond_c
    const-string v5, "\u624b\u6253\u67e0\u6aac\u8336"

    .line 374
    .line 375
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 376
    .line 377
    .line 378
    move-result v5

    .line 379
    if-eqz v5, :cond_d

    .line 380
    .line 381
    const-string v2, "#d5d700"

    .line 382
    .line 383
    goto :goto_3

    .line 384
    :cond_d
    const-string v5, "\u5965\u5229\u5965\u5976\u8336"

    .line 385
    .line 386
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 387
    .line 388
    .line 389
    move-result v5

    .line 390
    if-eqz v5, :cond_e

    .line 391
    .line 392
    const-string v2, "#dfb74d"

    .line 393
    .line 394
    goto :goto_3

    .line 395
    :cond_e
    const-string v5, "\u6a58\u5b50\u76d0\u6c7d\u6c34"

    .line 396
    .line 397
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 398
    .line 399
    .line 400
    move-result v5

    .line 401
    if-eqz v5, :cond_f

    .line 402
    .line 403
    const-string v2, "#ff913b"

    .line 404
    .line 405
    goto :goto_3

    .line 406
    :cond_f
    const-string v5, "\u7eaf\u7eaf\u51c9\u767d\u5f00"

    .line 407
    .line 408
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 409
    .line 410
    .line 411
    move-result v2

    .line 412
    if-eqz v2, :cond_10

    .line 413
    .line 414
    const-string v2, "#1fd2de"

    .line 415
    .line 416
    goto :goto_3

    .line 417
    :cond_10
    const-string v2, "#65cb72"

    .line 418
    .line 419
    :goto_3
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->s:Lv/VText;

    .line 420
    .line 421
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    sget v6, Ll/qa00;->e:I

    .line 426
    .line 427
    invoke-static {v2, v6}, Ll/egm;->a(II)Landroid/graphics/drawable/ShapeDrawable;

    .line 428
    .line 429
    .line 430
    move-result-object v2

    .line 431
    invoke-virtual {v5, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 432
    .line 433
    .line 434
    const-string v2, "guide_type"

    .line 435
    .line 436
    const-string v5, "tag"

    .line 437
    .line 438
    invoke-static {v2, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 439
    .line 440
    .line 441
    move-result-object v2

    .line 442
    filled-new-array {v2}, [Ll/pf60;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    const-string v5, "e_character_guide"

    .line 447
    .line 448
    invoke-static {v5, v3, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 449
    .line 450
    .line 451
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->r:Lv/VLinear;

    .line 452
    .line 453
    invoke-static {v2, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 454
    .line 455
    .line 456
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->r:Lv/VLinear;

    .line 457
    .line 458
    new-instance v5, Ll/luy;

    .line 459
    .line 460
    invoke-direct {v5, p1, v4}, Ll/luy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)V

    .line 461
    .line 462
    .line 463
    invoke-static {v2, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 464
    .line 465
    .line 466
    :cond_11
    :goto_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 467
    .line 468
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v2

    .line 476
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 477
    .line 478
    .line 479
    move-result v5

    .line 480
    if-eqz v5, :cond_12

    .line 481
    .line 482
    const-string v2, ""

    .line 483
    .line 484
    :cond_12
    move-object v9, v2

    .line 485
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u:Lv/VImage;

    .line 486
    .line 487
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 488
    .line 489
    .line 490
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 491
    .line 492
    invoke-static {v2, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 493
    .line 494
    .line 495
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->W8()Z

    .line 504
    .line 505
    .line 506
    move-result v2

    .line 507
    if-eqz v2, :cond_17

    .line 508
    .line 509
    iget-object v2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 510
    .line 511
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    if-eqz v2, :cond_17

    .line 516
    .line 517
    iget-object v2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 518
    .line 519
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 520
    .line 521
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 522
    .line 523
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    move-result v2

    .line 527
    if-eqz v2, :cond_17

    .line 528
    .line 529
    iget-object v2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 530
    .line 531
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 532
    .line 533
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 534
    .line 535
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 536
    .line 537
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result v2

    .line 541
    if-eqz v2, :cond_17

    .line 542
    .line 543
    iget-object v2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 544
    .line 545
    move-object v5, v2

    .line 546
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 547
    .line 548
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 549
    .line 550
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 551
    .line 552
    iget-boolean v5, v5, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 553
    .line 554
    if-eqz v5, :cond_17

    .line 555
    .line 556
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 557
    .line 558
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 559
    .line 560
    .line 561
    move-result v2

    .line 562
    if-eqz v2, :cond_17

    .line 563
    .line 564
    iget-object v2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 565
    .line 566
    move-object v5, v2

    .line 567
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 568
    .line 569
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 570
    .line 571
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 572
    .line 573
    iget v5, v5, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 574
    .line 575
    if-lez v5, :cond_17

    .line 576
    .line 577
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 578
    .line 579
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 580
    .line 581
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 582
    .line 583
    iget v2, v2, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 584
    .line 585
    const/4 v5, 0x3

    .line 586
    if-lt v2, v5, :cond_17

    .line 587
    .line 588
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u:Lv/VImage;

    .line 589
    .line 590
    invoke-static {v0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 591
    .line 592
    .line 593
    iget-object v0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 594
    .line 595
    move-object v2, v0

    .line 596
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 597
    .line 598
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 599
    .line 600
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 601
    .line 602
    iget v2, v2, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 603
    .line 604
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 605
    .line 606
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 607
    .line 608
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 609
    .line 610
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 611
    .line 612
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u:Lv/VImage;

    .line 613
    .line 614
    invoke-static {v5, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 615
    .line 616
    .line 617
    new-instance v5, Ljava/util/HashMap;

    .line 618
    .line 619
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 620
    .line 621
    .line 622
    if-ne v2, v8, :cond_13

    .line 623
    .line 624
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u:Lv/VImage;

    .line 625
    .line 626
    sget v7, Ll/ibc0;->N:I

    .line 627
    .line 628
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 629
    .line 630
    .line 631
    goto :goto_5

    .line 632
    :cond_13
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u:Lv/VImage;

    .line 633
    .line 634
    const/4 v7, 0x2

    .line 635
    if-ne v2, v7, :cond_14

    .line 636
    .line 637
    sget v7, Ll/ibc0;->O:I

    .line 638
    .line 639
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 640
    .line 641
    .line 642
    goto :goto_5

    .line 643
    :cond_14
    sget v7, Ll/ibc0;->P:I

    .line 644
    .line 645
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 646
    .line 647
    .line 648
    :goto_5
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 649
    .line 650
    sget v7, Ll/qa00;->c:I

    .line 651
    .line 652
    neg-int v7, v7

    .line 653
    invoke-static {v6, v7}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 654
    .line 655
    .line 656
    const-string v6, "spark_level"

    .line 657
    .line 658
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 659
    .line 660
    .line 661
    move-result-object v2

    .line 662
    invoke-interface {v5, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    .line 664
    .line 665
    const-string v2, "message_pairs"

    .line 666
    .line 667
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 668
    .line 669
    .line 670
    move-result-object v6

    .line 671
    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    const-string v2, "e_spark"

    .line 675
    .line 676
    invoke-static {v2, v3, v5}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 677
    .line 678
    .line 679
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 680
    .line 681
    .line 682
    move-result v2

    .line 683
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 684
    .line 685
    if-eqz v2, :cond_15

    .line 686
    .line 687
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    move-result-object v0

    .line 691
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 692
    .line 693
    .line 694
    goto :goto_6

    .line 695
    :cond_15
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 700
    .line 701
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    sget v6, Ll/g9c0;->k:I

    .line 706
    .line 707
    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 708
    .line 709
    .line 710
    move-result v2

    .line 711
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 712
    .line 713
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 714
    .line 715
    .line 716
    move-result-object v6

    .line 717
    sget v7, Ll/g9c0;->k:I

    .line 718
    .line 719
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 720
    .line 721
    .line 722
    move-result v6

    .line 723
    invoke-static {v0, v9, v2, v6, v1}, Ll/c17;->p0(Ljava/lang/String;Ljava/lang/CharSequence;IIZ)Ljava/lang/CharSequence;

    .line 724
    .line 725
    .line 726
    move-result-object v0

    .line 727
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 728
    .line 729
    .line 730
    :goto_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 731
    .line 732
    new-instance v2, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;

    .line 733
    .line 734
    move-object v3, p0

    .line 735
    move-object v6, p1

    .line 736
    move-object v7, p2

    .line 737
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;)V

    .line 738
    .line 739
    .line 740
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 741
    .line 742
    .line 743
    :cond_16
    :goto_7
    move v0, v8

    .line 744
    goto/16 :goto_8

    .line 745
    .line 746
    :cond_17
    move-object v3, p0

    .line 747
    move-object v6, p1

    .line 748
    move-object v7, p2

    .line 749
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 750
    .line 751
    .line 752
    move-result-object p0

    .line 753
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 754
    .line 755
    .line 756
    move-result-object p0

    .line 757
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 758
    .line 759
    .line 760
    move-result p0

    .line 761
    const-string p1, "\u6765\u81ea\u62a2\u5148\u544a\u767d"

    .line 762
    .line 763
    if-eqz p0, :cond_18

    .line 764
    .line 765
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 766
    .line 767
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 768
    .line 769
    .line 770
    move-result p0

    .line 771
    if-eqz p0, :cond_18

    .line 772
    .line 773
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 774
    .line 775
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 776
    .line 777
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isConfessionFirstConv()Z

    .line 778
    .line 779
    .line 780
    move-result p0

    .line 781
    if-eqz p0, :cond_18

    .line 782
    .line 783
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 784
    .line 785
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 786
    .line 787
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 788
    .line 789
    .line 790
    move-result-object p2

    .line 791
    sget v0, Ll/g9c0;->k:I

    .line 792
    .line 793
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 794
    .line 795
    .line 796
    move-result p2

    .line 797
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 798
    .line 799
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 800
    .line 801
    .line 802
    move-result-object v0

    .line 803
    sget v2, Ll/g9c0;->k:I

    .line 804
    .line 805
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 806
    .line 807
    .line 808
    move-result v0

    .line 809
    invoke-static {p1, v9, p2, v0, v1}, Ll/c17;->p0(Ljava/lang/String;Ljava/lang/CharSequence;IIZ)Ljava/lang/CharSequence;

    .line 810
    .line 811
    .line 812
    move-result-object p1

    .line 813
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 814
    .line 815
    .line 816
    goto :goto_7

    .line 817
    :cond_18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 818
    .line 819
    .line 820
    move-result-object p0

    .line 821
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 822
    .line 823
    .line 824
    move-result-object p0

    .line 825
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xn()Z

    .line 826
    .line 827
    .line 828
    move-result p0

    .line 829
    if-eqz p0, :cond_19

    .line 830
    .line 831
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 832
    .line 833
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 834
    .line 835
    .line 836
    move-result p0

    .line 837
    if-eqz p0, :cond_19

    .line 838
    .line 839
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 840
    .line 841
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 842
    .line 843
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isConfessionFirstConv()Z

    .line 844
    .line 845
    .line 846
    move-result p0

    .line 847
    if-eqz p0, :cond_19

    .line 848
    .line 849
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 850
    .line 851
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 852
    .line 853
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 854
    .line 855
    .line 856
    move-result-object p2

    .line 857
    sget v0, Ll/g9c0;->k:I

    .line 858
    .line 859
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 860
    .line 861
    .line 862
    move-result p2

    .line 863
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 864
    .line 865
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 866
    .line 867
    .line 868
    move-result-object v0

    .line 869
    sget v2, Ll/g9c0;->k:I

    .line 870
    .line 871
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 872
    .line 873
    .line 874
    move-result v0

    .line 875
    invoke-static {p1, v9, p2, v0, v1}, Ll/c17;->p0(Ljava/lang/String;Ljava/lang/CharSequence;IIZ)Ljava/lang/CharSequence;

    .line 876
    .line 877
    .line 878
    move-result-object p1

    .line 879
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 880
    .line 881
    .line 882
    goto/16 :goto_7

    .line 883
    .line 884
    :cond_19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 885
    .line 886
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 887
    .line 888
    .line 889
    move-result-object p0

    .line 890
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 891
    .line 892
    .line 893
    move-result p0

    .line 894
    if-eqz p0, :cond_1a

    .line 895
    .line 896
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 897
    .line 898
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 899
    .line 900
    .line 901
    move-result p0

    .line 902
    if-eqz p0, :cond_1a

    .line 903
    .line 904
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 905
    .line 906
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 907
    .line 908
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 909
    .line 910
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 911
    .line 912
    .line 913
    move-result p0

    .line 914
    if-eqz p0, :cond_1a

    .line 915
    .line 916
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 917
    .line 918
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 919
    .line 920
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 921
    .line 922
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 923
    .line 924
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 925
    .line 926
    .line 927
    move-result p0

    .line 928
    if-eqz p0, :cond_1a

    .line 929
    .line 930
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 931
    .line 932
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 933
    .line 934
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 935
    .line 936
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 937
    .line 938
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->fromGreeting:Z

    .line 939
    .line 940
    if-eqz p0, :cond_1a

    .line 941
    .line 942
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 943
    .line 944
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 945
    .line 946
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 947
    .line 948
    .line 949
    move-result-object p2

    .line 950
    sget v0, Ll/g9c0;->k:I

    .line 951
    .line 952
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 953
    .line 954
    .line 955
    move-result p2

    .line 956
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 957
    .line 958
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 959
    .line 960
    .line 961
    move-result-object v0

    .line 962
    sget v2, Ll/g9c0;->k:I

    .line 963
    .line 964
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 965
    .line 966
    .line 967
    move-result v0

    .line 968
    invoke-static {p1, v9, p2, v0, v1}, Ll/c17;->p0(Ljava/lang/String;Ljava/lang/CharSequence;IIZ)Ljava/lang/CharSequence;

    .line 969
    .line 970
    .line 971
    move-result-object p1

    .line 972
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 973
    .line 974
    .line 975
    goto/16 :goto_7

    .line 976
    .line 977
    :cond_1a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 978
    .line 979
    .line 980
    move-result-object p0

    .line 981
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 982
    .line 983
    .line 984
    move-result-object p0

    .line 985
    invoke-interface {p0}, Ll/r97;->u()Z

    .line 986
    .line 987
    .line 988
    move-result p0

    .line 989
    if-eqz p0, :cond_1b

    .line 990
    .line 991
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 992
    .line 993
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 994
    .line 995
    .line 996
    move-result p0

    .line 997
    if-eqz p0, :cond_1b

    .line 998
    .line 999
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 1000
    .line 1001
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1002
    .line 1003
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 1004
    .line 1005
    .line 1006
    move-result p0

    .line 1007
    if-eqz p0, :cond_1b

    .line 1008
    .line 1009
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1010
    .line 1011
    .line 1012
    move-result-object p0

    .line 1013
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1014
    .line 1015
    .line 1016
    move-result-object p0

    .line 1017
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 1018
    .line 1019
    .line 1020
    move-result p0

    .line 1021
    if-eqz p0, :cond_16

    .line 1022
    .line 1023
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 1024
    .line 1025
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1026
    .line 1027
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 1028
    .line 1029
    .line 1030
    move-result p0

    .line 1031
    if-nez p0, :cond_16

    .line 1032
    .line 1033
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 1034
    .line 1035
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1036
    .line 1037
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->a3:I

    .line 1038
    .line 1039
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1040
    .line 1041
    .line 1042
    move-result-object p1

    .line 1043
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1044
    .line 1045
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1046
    .line 1047
    .line 1048
    move-result-object p2

    .line 1049
    sget v0, Ll/g9c0;->k:I

    .line 1050
    .line 1051
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 1052
    .line 1053
    .line 1054
    move-result p2

    .line 1055
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1056
    .line 1057
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1058
    .line 1059
    .line 1060
    move-result-object v0

    .line 1061
    sget v2, Ll/g9c0;->k:I

    .line 1062
    .line 1063
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 1064
    .line 1065
    .line 1066
    move-result v0

    .line 1067
    invoke-static {p1, v9, p2, v0}, Ll/c17;->o0(Ljava/lang/String;Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    .line 1068
    .line 1069
    .line 1070
    move-result-object p1

    .line 1071
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1072
    .line 1073
    .line 1074
    goto/16 :goto_7

    .line 1075
    .line 1076
    :cond_1b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1077
    .line 1078
    .line 1079
    move-result-object p0

    .line 1080
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 1081
    .line 1082
    .line 1083
    move-result-object p0

    .line 1084
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->wq()Z

    .line 1085
    .line 1086
    .line 1087
    move-result p0

    .line 1088
    if-eqz p0, :cond_1c

    .line 1089
    .line 1090
    iget-object p0, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 1091
    .line 1092
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1093
    .line 1094
    .line 1095
    move-result p0

    .line 1096
    if-eqz p0, :cond_1c

    .line 1097
    .line 1098
    iget-object p0, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 1099
    .line 1100
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 1101
    .line 1102
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 1103
    .line 1104
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1105
    .line 1106
    .line 1107
    move-result p0

    .line 1108
    if-eqz p0, :cond_1c

    .line 1109
    .line 1110
    iget-object p0, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 1111
    .line 1112
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 1113
    .line 1114
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 1115
    .line 1116
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 1117
    .line 1118
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1119
    .line 1120
    .line 1121
    move-result p0

    .line 1122
    if-eqz p0, :cond_1c

    .line 1123
    .line 1124
    iget-object p0, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 1125
    .line 1126
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 1127
    .line 1128
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 1129
    .line 1130
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 1131
    .line 1132
    const-string p1, "boosted"

    .line 1133
    .line 1134
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 1135
    .line 1136
    .line 1137
    move-result-object p1

    .line 1138
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 1139
    .line 1140
    .line 1141
    move-result p0

    .line 1142
    if-eqz p0, :cond_1c

    .line 1143
    .line 1144
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 1145
    .line 1146
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1147
    .line 1148
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1149
    .line 1150
    .line 1151
    move-result-object p1

    .line 1152
    sget p2, Ll/g9c0;->k:I

    .line 1153
    .line 1154
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 1155
    .line 1156
    .line 1157
    move-result p1

    .line 1158
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1159
    .line 1160
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1161
    .line 1162
    .line 1163
    move-result-object p2

    .line 1164
    sget v0, Ll/g9c0;->k:I

    .line 1165
    .line 1166
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 1167
    .line 1168
    .line 1169
    move-result p2

    .line 1170
    const-string v0, "\u6765\u81ea\u52a0\u901f\u914d\u5bf9"

    .line 1171
    .line 1172
    invoke-static {v0, v9, p1, p2, v1}, Ll/c17;->p0(Ljava/lang/String;Ljava/lang/CharSequence;IIZ)Ljava/lang/CharSequence;

    .line 1173
    .line 1174
    .line 1175
    move-result-object p1

    .line 1176
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1177
    .line 1178
    .line 1179
    goto/16 :goto_7

    .line 1180
    .line 1181
    :cond_1c
    :goto_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1182
    .line 1183
    .line 1184
    move-result-object p0

    .line 1185
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1186
    .line 1187
    .line 1188
    move-result-object p0

    .line 1189
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 1190
    .line 1191
    .line 1192
    move-result p0

    .line 1193
    if-eqz p0, :cond_1e

    .line 1194
    .line 1195
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1196
    .line 1197
    .line 1198
    move-result-object p0

    .line 1199
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1200
    .line 1201
    .line 1202
    move-result-object p0

    .line 1203
    invoke-interface {p0}, Ll/r97;->c()Z

    .line 1204
    .line 1205
    .line 1206
    move-result p0

    .line 1207
    if-eqz p0, :cond_1e

    .line 1208
    .line 1209
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 1210
    .line 1211
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1212
    .line 1213
    .line 1214
    move-result p0

    .line 1215
    if-eqz p0, :cond_1e

    .line 1216
    .line 1217
    iget-object p0, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 1218
    .line 1219
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1220
    .line 1221
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 1222
    .line 1223
    const-string p1, "quickchat"

    .line 1224
    .line 1225
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1226
    .line 1227
    .line 1228
    move-result p0

    .line 1229
    if-eqz p0, :cond_1e

    .line 1230
    .line 1231
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 1232
    .line 1233
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1234
    .line 1235
    .line 1236
    move-result-object p1

    .line 1237
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1238
    .line 1239
    .line 1240
    move-result-object p1

    .line 1241
    iget-object p2, p3, Ll/ovb0;->d:Ljava/lang/Object;

    .line 1242
    .line 1243
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1244
    .line 1245
    invoke-interface {p1, p2}, Ll/r97;->j5(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 1246
    .line 1247
    .line 1248
    move-result p1

    .line 1249
    if-eqz p1, :cond_1d

    .line 1250
    .line 1251
    const-string p1, "\u6765\u81ea\u8bed\u97f3\u95ea\u804a"

    .line 1252
    .line 1253
    goto :goto_9

    .line 1254
    :cond_1d
    const-string p1, "\u6765\u81ea\u95ea\u804a\u5339\u914d"

    .line 1255
    .line 1256
    :goto_9
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1257
    .line 1258
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1259
    .line 1260
    .line 1261
    move-result-object p2

    .line 1262
    sget p3, Ll/g9c0;->k:I

    .line 1263
    .line 1264
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 1265
    .line 1266
    .line 1267
    move-result p2

    .line 1268
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1269
    .line 1270
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1271
    .line 1272
    .line 1273
    move-result-object p3

    .line 1274
    sget v0, Ll/g9c0;->k:I

    .line 1275
    .line 1276
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 1277
    .line 1278
    .line 1279
    move-result p3

    .line 1280
    invoke-static {p1, v9, p2, p3}, Ll/c17;->o0(Ljava/lang/String;Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    .line 1281
    .line 1282
    .line 1283
    move-result-object p1

    .line 1284
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1285
    .line 1286
    .line 1287
    move v0, v8

    .line 1288
    :cond_1e
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 1289
    .line 1290
    .line 1291
    move-result p0

    .line 1292
    if-eqz p0, :cond_1f

    .line 1293
    .line 1294
    move v0, v1

    .line 1295
    :cond_1f
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 1296
    .line 1297
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 1298
    .line 1299
    .line 1300
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 1301
    .line 1302
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 1303
    .line 1304
    .line 1305
    move-result p0

    .line 1306
    if-eqz p0, :cond_20

    .line 1307
    .line 1308
    invoke-virtual {v7}, Ll/fwy;->Q1()V

    .line 1309
    .line 1310
    .line 1311
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->w:Lv/VText;

    .line 1312
    .line 1313
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1314
    .line 1315
    .line 1316
    :cond_20
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 1317
    .line 1318
    .line 1319
    move-result-object p0

    .line 1320
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 1321
    .line 1322
    .line 1323
    move-result-object p0

    .line 1324
    invoke-virtual {p0}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 1325
    .line 1326
    .line 1327
    move-result-object p0

    .line 1328
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 1329
    .line 1330
    .line 1331
    move-result-object p0

    .line 1332
    invoke-static {p0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1333
    .line 1334
    .line 1335
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 1336
    .line 1337
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1338
    .line 1339
    .line 1340
    iget-object p0, v3, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 1341
    .line 1342
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 1343
    .line 1344
    .line 1345
    return-void
.end method

.method public m(Ll/pf60;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;I)V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 31
    .line 32
    const-string v2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 33
    .line 34
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 45
    .line 46
    sget p2, Ll/ibc0;->k1:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g:Lv/VFrame;

    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b:Lv/VFrame;

    .line 57
    .line 58
    const/4 p2, 0x1

    .line 59
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 63
    .line 64
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 84
    .line 85
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {v0, v2, p1, p2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->xp(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 23
    .line 24
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-lez v0, :cond_3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM_EXP:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 75
    .line 76
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    :goto_0
    return-void

    .line 83
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 96
    .line 97
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 100
    .line 101
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_8

    .line 14
    .line 15
    invoke-static {}, Ll/nrb0;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-static {}, Ll/bnl0;->y0()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/high16 v3, 0x43c80000    # 400.0f

    .line 61
    .line 62
    cmpg-float v0, v0, v3

    .line 63
    .line 64
    if-gez v0, :cond_2

    .line 65
    .line 66
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->i(Lcom/p1/mobile/putong/data/User;Z)I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    const/4 v0, -0x1

    .line 71
    if-ne p2, v0, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    new-instance v0, Landroid/widget/ImageView;

    .line 75
    .line 76
    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 83
    .line 84
    const/high16 p2, 0x41800000    # 16.0f

    .line 85
    .line 86
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-direct {p1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 106
    .line 107
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 112
    .line 113
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    if-nez p1, :cond_3

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 121
    .line 122
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 126
    .line 127
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_7

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-lez v0, :cond_5

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 155
    .line 156
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM_EXP:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 160
    .line 161
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    if-nez p1, :cond_6

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 169
    .line 170
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 174
    .line 175
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_7
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 180
    .line 181
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 184
    .line 185
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 186
    .line 187
    .line 188
    :cond_8
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/ibc0;->b4:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v0, Ll/ibc0;->a4:I

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/bkj0;Ll/fwy;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ll/fwy;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v1, v0, Ll/yxz;

    .line 14
    .line 15
    if-eqz v1, :cond_9

    .line 16
    .line 17
    check-cast v0, Ll/yxz;

    .line 18
    .line 19
    iget-object v1, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x1

    .line 36
    const/4 v4, 0x0

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 46
    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 50
    .line 51
    const-string v5, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 52
    .line 53
    invoke-static {v5}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 64
    .line 65
    sget p2, Ll/ibc0;->k1:I

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g:Lv/VFrame;

    .line 71
    .line 72
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b:Lv/VFrame;

    .line 76
    .line 77
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-virtual {p3}, Ll/fwy;->l0()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const/16 v5, 0x64

    .line 91
    .line 92
    if-eq v2, v5, :cond_4

    .line 93
    .line 94
    iget-object p1, v0, Ll/qzz;->t1:Ll/rdz;

    .line 95
    .line 96
    invoke-interface {p1}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_2

    .line 105
    .line 106
    iget-object p1, v0, Ll/qzz;->t1:Ll/rdz;

    .line 107
    .line 108
    invoke-interface {p1}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F0(Lcom/p1/mobile/putong/data/User;I)V

    .line 113
    .line 114
    .line 115
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 124
    .line 125
    invoke-virtual {p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    invoke-static {v1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    invoke-interface {p1, p3, v5, v2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->i:Lv/VDraweeView;

    .line 149
    .line 150
    invoke-static {v1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    invoke-interface {p1, p3, v5, v2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g:Lv/VFrame;

    .line 162
    .line 163
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b:Lv/VFrame;

    .line 167
    .line 168
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_3

    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 186
    .line 187
    sget p3, Ll/ibc0;->Y5:I

    .line 188
    .line 189
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setBitmapRes(I)V

    .line 190
    .line 191
    .line 192
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 193
    .line 194
    const/high16 p3, 0x40200000    # 2.5f

    .line 195
    .line 196
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 197
    .line 198
    .line 199
    move-result p3

    .line 200
    int-to-float p3, p3

    .line 201
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setThreeDp(F)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 205
    .line 206
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setProgress(I)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 210
    .line 211
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_2

    .line 215
    .line 216
    :cond_4
    invoke-virtual {p3}, Ll/fwy;->e1()Z

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    iget-object v5, v0, Ll/qzz;->t1:Ll/rdz;

    .line 221
    .line 222
    if-eqz v2, :cond_5

    .line 223
    .line 224
    invoke-interface {v5}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    if-eqz v2, :cond_6

    .line 233
    .line 234
    iget-object v2, v0, Ll/qzz;->t1:Ll/rdz;

    .line 235
    .line 236
    invoke-interface {v2}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    invoke-virtual {v2, v1, v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0(Lcom/p1/mobile/putong/data/User;I)V

    .line 241
    .line 242
    .line 243
    goto :goto_0

    .line 244
    :cond_5
    invoke-interface {v5}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    if-eqz v2, :cond_6

    .line 253
    .line 254
    iget-object v2, v0, Ll/qzz;->t1:Ll/rdz;

    .line 255
    .line 256
    invoke-interface {v2}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOtherSmallImage(Lcom/p1/mobile/putong/data/User;)V

    .line 261
    .line 262
    .line 263
    :cond_6
    :goto_0
    invoke-virtual {p3}, Ll/fwy;->e1()Z

    .line 264
    .line 265
    .line 266
    move-result p3

    .line 267
    if-eqz p3, :cond_7

    .line 268
    .line 269
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 278
    .line 279
    invoke-virtual {p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 280
    .line 281
    .line 282
    move-result-object p3

    .line 283
    invoke-static {v1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-interface {p1, p3, v2, v4}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 292
    .line 293
    .line 294
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 295
    .line 296
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 297
    .line 298
    .line 299
    goto :goto_1

    .line 300
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 301
    .line 302
    invoke-static {v1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-virtual {p3, v1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    if-eqz p1, :cond_8

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 320
    .line 321
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 322
    .line 323
    .line 324
    :cond_8
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g:Lv/VFrame;

    .line 325
    .line 326
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b:Lv/VFrame;

    .line 330
    .line 331
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 332
    .line 333
    .line 334
    :goto_2
    iget-object p1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 335
    .line 336
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 337
    .line 338
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 339
    .line 340
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 341
    .line 342
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 343
    .line 344
    .line 345
    move-result-object p2

    .line 346
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 347
    .line 348
    .line 349
    move-result p1

    .line 350
    if-eqz p1, :cond_9

    .line 351
    .line 352
    iget-object p1, v0, Ll/qzz;->t1:Ll/rdz;

    .line 353
    .line 354
    invoke-interface {p1}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    if-eqz p1, :cond_9

    .line 363
    .line 364
    iget-object p1, v0, Ll/qzz;->t1:Ll/rdz;

    .line 365
    .line 366
    invoke-interface {p1}, Ll/rdz;->c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOtherSmallImage(Lcom/p1/mobile/putong/data/User;)V

    .line 371
    .line 372
    .line 373
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 374
    .line 375
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->i:Lv/VDraweeView;

    .line 376
    .line 377
    invoke-static {v1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 378
    .line 379
    .line 380
    move-result-object p2

    .line 381
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 382
    .line 383
    .line 384
    move-result-object p2

    .line 385
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p2

    .line 389
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    :cond_9
    return-void
.end method

.method public q(Ll/fwy;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/View;

    .line 16
    .line 17
    new-instance v1, Ll/juy;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Ll/juy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->j:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    const/high16 v1, 0x42000000    # 32.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->k:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    const/high16 v1, 0x40c00000    # 6.0f

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 54
    .line 55
    new-instance v1, Ll/kuy;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Ll/kuy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Ll/clz;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/data/User;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->u(Lcom/p1/mobile/putong/data/User;Ll/clz;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    add-int/lit8 v1, v1, -0xa

    .line 14
    .line 15
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0xa

    .line 20
    .line 21
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    add-int/lit8 v1, v1, -0xa

    .line 26
    .line 27
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0xa

    .line 32
    .line 33
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 34
    .line 35
    new-instance v1, Landroid/view/TouchDelegate;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 38
    .line 39
    invoke-direct {v1, v0, v2}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-class v0, Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public final synthetic t(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/qzz;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/qzz;->e0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 19
    .line 20
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    sget p1, Ll/ibc0;->Z3:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    sget p1, Ll/ibc0;->Y3:I

    .line 38
    .line 39
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/qzz;->h0()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 51
    .line 52
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    sget p1, Ll/ibc0;->b4:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    sget p1, Ll/ibc0;->a4:I

    .line 70
    .line 71
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/User;Ll/clz;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 27
    .line 28
    const-string p1, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    :goto_0
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p2}, Ll/clz;->pageId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string v0, "is_self_avatar"

    .line 77
    .line 78
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v0, "e_chat_avatar"

    .line 87
    .line 88
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 89
    .line 90
    .line 91
    const-string p0, "messages_title"

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->d:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->e:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->d:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->e:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 14
    .line 15
    sget v1, Ll/qa00;->p:I

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/ChatGroup;Z)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget v3, Ll/ibc0;->I0:I

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 56
    .line 57
    const/4 v2, 0x1

    .line 58
    if-le v0, v2, :cond_1

    .line 59
    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->y:Lv/VText;

    .line 63
    .line 64
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->f:Lv/VLinear;

    .line 68
    .line 69
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->q3:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v:Lv/VText;

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->r6:I

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l:Lv/VText;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->y:Lv/VText;

    .line 150
    .line 151
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->f:Lv/VLinear;

    .line 155
    .line 156
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->y:Lv/VText;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-boolean v1, p3, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 33
    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    iget-object v1, p3, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 37
    .line 38
    const-string v3, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 39
    .line 40
    invoke-static {v3}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 51
    .line 52
    sget p2, Ll/ibc0;->k1:I

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->g:Lv/VFrame;

    .line 58
    .line 59
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b:Lv/VFrame;

    .line 63
    .line 64
    const/4 p2, 0x1

    .line 65
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v1}, Ll/r97;->c()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {p3}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {p2}, Ll/fwy;->l0()I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    invoke-interface {p1, v1, v2, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 122
    .line 123
    .line 124
    goto/16 :goto_1

    .line 125
    .line 126
    :cond_2
    invoke-virtual {p2}, Ll/fwy;->e1()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-static {p3}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {p2}, Ll/fwy;->l0()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-interface {p1, v1, v2, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_1

    .line 162
    .line 163
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_4

    .line 176
    .line 177
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_4

    .line 182
    .line 183
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isLoveBuzz()Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_4

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-static {p3}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {p2}, Ll/fwy;->k0()I

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    invoke-interface {p1, v1, v2, p2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->xp(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 216
    .line 217
    .line 218
    goto :goto_1

    .line 219
    :cond_4
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_5

    .line 224
    .line 225
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-nez v1, :cond_6

    .line 230
    .line 231
    :cond_5
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {p2}, Ll/clz;->Y3()Z

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-eqz p2, :cond_7

    .line 244
    .line 245
    :cond_6
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 246
    .line 247
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 248
    .line 249
    invoke-virtual {p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {p1, p2, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 262
    .line 263
    invoke-static {p3}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-virtual {p2, p3, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_8

    .line 279
    .line 280
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 281
    .line 282
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 283
    .line 284
    .line 285
    :cond_8
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    if-eqz p1, :cond_9

    .line 290
    .line 291
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 292
    .line 293
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 294
    .line 295
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-eqz p1, :cond_9

    .line 304
    .line 305
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 306
    .line 307
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 308
    .line 309
    invoke-virtual {p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 310
    .line 311
    .line 312
    move-result-object p2

    .line 313
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 329
    .line 330
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->i:Lv/VDraweeView;

    .line 331
    .line 332
    invoke-static {p3}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 333
    .line 334
    .line 335
    move-result-object p2

    .line 336
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p2

    .line 344
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    :cond_9
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->t:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->w:Lv/VText;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    :cond_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
