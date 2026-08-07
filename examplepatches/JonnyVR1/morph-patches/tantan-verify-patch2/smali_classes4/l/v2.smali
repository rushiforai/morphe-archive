.class public Ll/v2;
.super Ll/f6l;
.source "SourceFile"

# interfaces
.implements Ll/z2b0;


# instance fields
.field public f:Lv/VLinear;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lv/VLinear;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public l:Lv/VLinear;

.field public m:Lv/VText;

.field public n:Lcom/tantan/library/svga/SVGAnimationView;

.field public o:Lv/VImage;

.field public p:Z

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/v2;->q:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/v2;->s:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic D(Ll/v2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/v2;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v2;->L(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/String;Ljava/lang/String;)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Ll/z2b0;->Companion:Ll/z2b0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/z2b0$a;->b()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public static synthetic G(Ll/v2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->P(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H(Ll/v2;Lcom/p1/mobile/putong/data/AiTranslateResultData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->O(Lcom/p1/mobile/putong/data/AiTranslateResultData;)V

    return-void
.end method

.method public static synthetic I(Ll/v2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->M(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    sget-object p1, Ll/z2b0;->Companion:Ll/z2b0$a;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/z2b0$a;->a(Ll/z2b0;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/v2;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 15
    .line 16
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/VText_Medium;->p(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 p3, 0x1

    .line 26
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Ll/v2;->r:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/v2;->S()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/v2;->K(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w2;->a(Ll/v2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final K(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/p2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p2;-><init>(Ll/v2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/i0;->d(Ljava/lang/String;Ll/i0$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic L(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Ll/v2;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/v2;->i:Lv/VLinear;

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/v2;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/v2;->j:Landroid/view/View;

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/v2;->T()V

    .line 37
    .line 38
    .line 39
    const-string p0, "e_intl_ai_translate"

    .line 40
    .line 41
    const-string p1, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object p0, p0, Ll/v2;->i:Lv/VLinear;

    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/v2;->p:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/v2;->s:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "e_intl_ai_translate"

    .line 11
    .line 12
    const-string v0, "p_suggest_user_profile_info_view"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/v2;->U()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_switch_language"

    .line 2
    .line 3
    const-string v0, "p_suggest_user_profile_info_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/q0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/s2;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/s2;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p1, p0, v0}, Ll/q0;-><init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/q0;->show()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/AiTranslateResultData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->R(Lcom/p1/mobile/putong/data/AiTranslateResultData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v2;->Q(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/v2;->m:Lv/VText;

    .line 5
    .line 6
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Sg:I

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/v2;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/v2;->j:Landroid/view/View;

    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/data/AiTranslateResultData;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/v2;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Ll/v2;->q:Z

    .line 10
    .line 11
    iget-object v2, p0, Ll/v2;->m:Lv/VText;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Sg:I

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AiTranslateResultData;->translated_text:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/v2;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iput-boolean v1, p0, Ll/v2;->s:Z

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AiTranslateResultData;->translated_text:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/v2;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 56
    .line 57
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/v2;->j:Landroid/view/View;

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public final S()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/v2;->s:Z

    .line 5
    .line 6
    iget-object v1, p0, Ll/v2;->i:Lv/VLinear;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/v2;->Q(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v2;->l:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/q2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/q2;-><init>(Ll/v2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/v2;->o:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/r2;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/r2;-><init>(Ll/v2;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final U()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/v2;->m:Lv/VText;

    .line 5
    .line 6
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Tg:I

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "ai_translating.svga"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, -0x1

    .line 43
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/v2;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v2, p0, Ll/v2;->r:Ljava/lang/String;

    .line 57
    .line 58
    const-wide/16 v3, 0x0

    .line 59
    .line 60
    const-wide/16 v5, 0x0

    .line 61
    .line 62
    const-string v1, "profile_description"

    .line 63
    .line 64
    invoke-static/range {v1 .. v6}, Ll/i0;->g(Ljava/lang/String;Ljava/lang/String;JJ)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p0, v0, v1}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/t2;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/t2;-><init>(Ll/v2;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ll/u2;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/u2;-><init>(Ll/v2;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/v2;->p:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/v2;->s:Z

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/v2;->q:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/v2;->i:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Ll/v2;->Q(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/v2;->J(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->q(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/v2;->q:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/v2;->i:Lv/VLinear;

    .line 11
    .line 12
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/v2;->q:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/dmf;->r()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/z2b0;->Companion:Ll/z2b0$a;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/z2b0$a;->c(Ll/z2b0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
