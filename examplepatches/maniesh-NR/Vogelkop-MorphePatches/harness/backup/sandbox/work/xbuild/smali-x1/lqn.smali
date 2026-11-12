.class public abstract Llqn;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Ljbl;


# instance fields
.field public final A:Lsw3;

.field public final B:Lcom/opera/android/Lazy;

.field public C:Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

.field public D:Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

.field public E:Lzv0;

.field public F:Lmlj;

.field public G:Lmrn;

.field public final H:Lkqn;

.field public I:Lp8f;

.field public J:Lorg/chromium/content_public/browser/WebContents;

.field public K:Lsba;

.field public L:Landroid/view/View;

.field public M:Ljava/lang/String;

.field public N:Z

.field public O:Z

.field public final P:Ltvk;

.field public final Q:Ldcl;

.field public final r:Lru9;

.field public final s:Lpjn;

.field public final t:Lcom/opera/android/Lazy;

.field public final u:Lorm;

.field public final v:Lhq3;

.field public final w:Lvsn;

.field public final x:Lwll;

.field public final y:Lqwe;

.field public final z:Ld7h;


# direct methods
.method public constructor <init>(Lu7k;Lru9;Lpjn;Lcom/opera/android/Lazy;Lorm;Lhq3;Lvsn;Lwll;Lqwe;Ld7h;Lsw3;Lcom/opera/android/Lazy;)V
    .registers 14

    const v0, 0x7f140110

    invoke-virtual {p1, v0}, Lu7k;->s(I)V

    iget-object p1, p1, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    const v0, 0x7f100005

    iput v0, p1, Litl;->b:I

    const/4 v0, 0x1

    iput-boolean v0, p1, Litl;->f:Z

    invoke-direct {p0, p1}, Lltl;-><init>(Litl;)V

    iput-object p2, p0, Llqn;->r:Lru9;

    iput-object p3, p0, Llqn;->s:Lpjn;

    iput-object p4, p0, Llqn;->t:Lcom/opera/android/Lazy;

    iput-object p5, p0, Llqn;->u:Lorm;

    iput-object p6, p0, Llqn;->v:Lhq3;

    iput-object p7, p0, Llqn;->w:Lvsn;

    iput-object p8, p0, Llqn;->x:Lwll;

    iput-object p9, p0, Llqn;->y:Lqwe;

    iput-object p10, p0, Llqn;->z:Ld7h;

    iput-object p11, p0, Llqn;->A:Lsw3;

    iput-object p12, p0, Llqn;->B:Lcom/opera/android/Lazy;

    new-instance p1, Lkqn;

    invoke-direct {p1, p0}, Lkqn;-><init>(Llqn;)V

    iput-object p1, p0, Llqn;->H:Lkqn;

    new-instance p1, Ltvk;

    invoke-direct {p1, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Llqn;->P:Ltvk;

    new-instance p1, Ldcl;

    invoke-direct {p1, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Llqn;->Q:Ldcl;

    return-void
.end method

.method public static I0(Llqn;IZI)V
    .registers 6

    and-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object p1, p0, Llqn;->C:Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    if-nez p1, :cond_a

    move-object p1, v1

    :cond_a
    iget p1, p1, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->d:I

    :cond_c
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1b

    iget-object p2, p0, Llqn;->G:Lmrn;

    if-nez p2, :cond_15

    move-object p2, v1

    :cond_15
    iget-object p2, p2, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p2}, Landroid/view/View;->hasFocus()Z

    move-result p2

    :cond_1b
    iget-object p3, p0, Llqn;->v:Lhq3;

    int-to-float p1, p1

    iget-object p0, p0, Llqn;->G:Lmrn;

    if-eqz p0, :cond_23

    move-object v1, p0

    :cond_23
    iget-object p0, v1, Lmrn;->m:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget-object v0, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, p0

    float-to-int p0, p1

    int-to-long p0, p0

    iget-object p3, p3, Ls62;->q:Lpde;

    new-instance v0, Lr52;

    invoke-direct {v0, p0, p1, p2}, Lr52;-><init>(JZ)V

    invoke-static {p3, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 6

    iget-object v0, p0, Llqn;->w:Lvsn;

    iget-object v0, v0, Lvsn;->q:Lwnm;

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltsn;

    iget-boolean v0, v0, Ltsn;->f:Z

    const/4 v1, 0x0

    if-nez v0, :cond_16

    iput-object v1, p0, Llqn;->M:Ljava/lang/String;

    return-void

    :cond_16
    iget-object v0, p0, Llqn;->M:Ljava/lang/String;

    iget-object v2, p0, Llqn;->t:Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljbn;

    invoke-virtual {v2}, Ljbn;->a()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Llqn;->M:Ljava/lang/String;

    iget-boolean v3, p0, Llqn;->N:Z

    if-eqz v3, :cond_58

    if-eqz v0, :cond_58

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_58

    iget-object v0, p0, Llqn;->F:Lmlj;

    if-eqz v0, :cond_3d

    move-object v1, v0

    :cond_3d
    new-instance v0, Lrxh;

    const v2, 0x7f140124

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lrxh;

    const v3, 0x7f14012a

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Ldqn;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Ldqn;-><init>(Llqn;B)V

    const/16 p0, 0x1388

    invoke-virtual {v1, v0, p0, v2, v3}, Lmlj;->b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    :cond_58
    return-void
.end method

.method public final H0(Ljava/lang/String;)V
    .registers 2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    iget-object p0, p0, Llqn;->w:Lvsn;

    invoke-virtual {p0, p1}, Lvsn;->d(Z)V

    return-void
.end method

.method public final J0(Lxrn;)V
    .registers 3

    sget-object v0, Lgqn;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1e

    iget-object p0, p0, Llqn;->F:Lmlj;

    if-nez p0, :cond_10

    const/4 p0, 0x0

    :cond_10
    new-instance p1, Lrxh;

    const v0, 0x7f140cd3

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const/16 v0, 0x9c4

    invoke-virtual {p0, p1, v0}, Lmlj;->a(Lrxh;I)V

    return-void

    :cond_1e
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final K0()V
    .registers 4

    iget-object v0, p0, Llqn;->G:Lmrn;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v0, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object v0, p0, Llqn;->B:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgjm;

    new-instance v1, Ltca;

    sget-object v2, Lsca;->b:Lsca;

    invoke-direct {v1, v2}, Ltca;-><init>(Lsca;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lgjm;->e(Ln37;Z)V

    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->k:Lg7m;

    sget-object v0, Ll60;->b:Ll60;

    invoke-virtual {p0, v0}, Lg7m;->c(Ll60;)V

    return-void
.end method

.method public final L()V
    .registers 2

    invoke-super {p0}, Lk24;->L()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Llqn;->N:Z

    return-void
.end method

.method public final L0(Lsba;Lkz3;)V
    .registers 4

    invoke-virtual {p1, p2}, Llz3;->a(Lkz3;)V

    new-instance p2, Lq22;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lq22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Llz3;->a(Lkz3;)V

    invoke-virtual {p1}, Llz3;->f()V

    iput-object p1, p0, Llqn;->K:Lsba;

    return-void
.end method

.method public final M0(Lzm9;)V
    .registers 4

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object p1, p1, Lzm9;->c:Ljava/lang/Object;

    check-cast p1, Ldxh;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->d:Landroidx/appcompat/widget/AppCompatImageView;

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    if-eqz p1, :cond_34

    new-instance v0, Ldxh;

    const v1, 0x7f0402c4

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_34
    return-void
.end method

.method public final g0()V
    .registers 5

    iget-boolean v0, p0, Lryl;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Lryl;->g0()V

    iget-object v0, p0, Llqn;->w:Lvsn;

    iget-object v0, v0, Lvsn;->k:Lg7m;

    iget-object v0, v0, Lg7m;->g:Ljava/lang/Object;

    check-cast v0, Ld5o;

    sget-object v1, Lu70;->d:Lu70;

    invoke-virtual {v0, v1}, Ld5o;->w(Lu70;)V

    iget-object v0, p0, Llqn;->s:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Ltw3;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v1

    new-instance v2, Ljw0;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljw0;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v1, v2}, Ltcc;->a(Lmdc;)V

    iget-object v0, p0, Llqn;->D:Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    const/4 v1, 0x0

    if-eqz v0, :cond_4e

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    if-eqz v2, :cond_3d

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_3d
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    if-eqz v2, :cond_4c

    iget-object v3, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->g:Laq8;

    iget-object v2, v2, Lqwe;->b:Li7f;

    invoke-virtual {v2, v3}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_4c
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    :cond_4e
    iget-object v0, p0, Llqn;->I:Lp8f;

    if-eqz v0, :cond_55

    invoke-virtual {v0}, Lp8f;->j()V

    :cond_55
    iput-object v1, p0, Llqn;->I:Lp8f;

    iput-object v1, p0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public final h0(Landroidx/fragment/app/w;)V
    .registers 4

    const/4 p0, 0x1

    const/4 v0, -0x1

    const-string v1, "WebAiAssistantFragmentBase"

    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    return-void
.end method

.method public final k0()I
    .registers 1

    const p0, 0x7f040557

    return p0
.end method

.method public final l()V
    .registers 2

    invoke-super {p0}, Lk24;->l()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Llqn;->N:Z

    invoke-virtual {p0}, Llqn;->G0()V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object p1, p0, Llqn;->K:Lsba;

    if-eqz p1, :cond_a

    sget-object p0, Lhjm;->b:Lhjm;

    invoke-virtual {p1, p0}, Llz3;->b(Lhjm;)Z

    return-void

    :cond_a
    iget-object p1, p0, Llqn;->w:Lvsn;

    iget-object p1, p1, Lvsn;->k:Lg7m;

    iget-object p1, p1, Lg7m;->g:Ljava/lang/Object;

    check-cast p1, Ld5o;

    sget-object v0, Lu70;->c:Lu70;

    invoke-virtual {p1, v0}, Ld5o;->w(Lu70;)V

    check-cast p0, Lmqn;

    iget-object p0, p0, Lmqn;->T:Lvl6;

    if-nez p0, :cond_1e

    const/4 p0, 0x0

    :cond_1e
    invoke-virtual {p0}, Lvl6;->S()Z

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 16

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_1c

    new-instance v0, Lzv0;

    invoke-static {p1}, Lmkh;->u(Landroid/os/Bundle;)Lnv0;

    move-result-object v1

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v10}, Lzv0;-><init>(Lnv0;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLfw0;)V

    goto :goto_82

    :cond_1c
    invoke-static {p1}, Lmkh;->u(Landroid/os/Bundle;)Lnv0;

    move-result-object v2

    const-string v0, "submitted_text"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "prefilled_text"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "is_restore"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    const-string v0, "ask_aria_query"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "summarize_page_url"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "summarize_page_content"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "force_new_chat"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    const-string v0, "activate_input"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    const-string v0, "attribution"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_5f

    new-instance v1, Lorb;

    invoke-direct {v1, p1}, Lorb;-><init>(Ljava/lang/String;)V

    goto :goto_60

    :cond_5f
    move-object v1, v0

    :goto_60
    if-nez v1, :cond_64

    move-object v11, v0

    goto :goto_7c

    :cond_64
    new-instance p1, Lfw0;

    const-string v11, "c"

    invoke-virtual {v1, v11, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "s"

    invoke-virtual {v1, v12, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "t"

    invoke-virtual {v1, v13, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v11, v12, v0}, Lfw0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v11, p1

    :goto_7c
    new-instance v1, Lzv0;

    invoke-direct/range {v1 .. v11}, Lzv0;-><init>(Lnv0;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLfw0;)V

    move-object v0, v1

    :goto_82
    iput-object v0, p0, Llqn;->E:Lzv0;

    const/16 p1, 0x5ff

    invoke-static {v0, p1}, Lzv0;->a(Lzv0;I)Lzv0;

    move-result-object p1

    iput-object p1, p0, Llqn;->E:Lzv0;

    iget-boolean p1, v0, Lzv0;->i:Z

    iput-boolean p1, p0, Llqn;->O:Z

    return-void
.end method

.method public final onDestroyView()V
    .registers 5

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Llqn;->D:Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    if-eqz v2, :cond_16

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_16
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    if-eqz v2, :cond_25

    iget-object v3, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->g:Laq8;

    iget-object v2, v2, Lqwe;->b:Li7f;

    invoke-virtual {v2, v3}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_25
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    :cond_27
    iget-object v0, p0, Llqn;->I:Lp8f;

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Lp8f;->j()V

    :cond_2e
    iput-object v1, p0, Llqn;->I:Lp8f;

    iput-object v1, p0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    iget-object v0, p0, Llqn;->C:Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    if-eqz v0, :cond_37

    move-object v1, v0

    :cond_37
    iget-object v0, p0, Llqn;->H:Lkqn;

    invoke-virtual {v1, v0}, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->H(Ljava/lang/Object;)V

    iget-boolean v0, p0, Lryl;->a:Z

    if-nez v0, :cond_4d

    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->k:Lg7m;

    iget-object p0, p0, Lg7m;->g:Ljava/lang/Object;

    check-cast p0, Ld5o;

    sget-object v0, Lu70;->c:Lu70;

    invoke-virtual {p0, v0}, Ld5o;->w(Lu70;)V

    :cond_4d
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 12

    iget-object v0, p0, Llqn;->G:Lmrn;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0293

    const/4 v2, 0x1

    iget-object v3, p0, Llqn;->w:Lvsn;

    if-ne p1, v0, :cond_32

    invoke-virtual {v3}, Lvsn;->c()Lju4;

    move-result-object p0

    if-eqz p0, :cond_4e

    iget-wide p0, p0, Lju4;->a:J

    iget-object v0, v3, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->c()Lp62;

    move-result-object v0

    new-instance v1, Lvrn;

    const/4 v4, 0x4

    invoke-direct {v1, v3, v4}, Lvrn;-><init>(Lvsn;B)V

    invoke-virtual {v0, p0, p1, v1}, Lp62;->b(JLkotlin/jvm/functions/Function1;)V

    return v2

    :cond_32
    const v0, 0x7f0a0a3b

    if-ne p1, v0, :cond_4f

    invoke-virtual {v3}, Lvsn;->c()Lju4;

    move-result-object p0

    if-eqz p0, :cond_4e

    iget-wide p0, p0, Lju4;->a:J

    iget-object v0, v3, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->c()Lp62;

    move-result-object v0

    new-instance v1, Lvrn;

    const/4 v4, 0x3

    invoke-direct {v1, v3, v4}, Lvrn;-><init>(Lvsn;B)V

    invoke-virtual {v0, p0, p1, v1}, Lp62;->b(JLkotlin/jvm/functions/Function1;)V

    :cond_4e
    return v2

    :cond_4f
    const v0, 0x7f0a02cd

    if-ne p1, v0, :cond_b7

    invoke-virtual {v3}, Lvsn;->c()Lju4;

    move-result-object p1

    if-eqz p1, :cond_a4

    iget-wide v4, p1, Lju4;->a:J

    iget-object p1, v3, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->c()Lp62;

    move-result-object p1

    iget-object p1, p1, Lp62;->a:Lole;

    new-instance v0, Lt40;

    const/16 v3, 0x10

    invoke-direct {v0, v3}, Lt40;-><init>(B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lvpb;

    invoke-direct {v3}, Lvpb;-><init>()V

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    invoke-virtual {v3, v6}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v7, "id"

    invoke-virtual {v6, v4, v5, v7}, Lorb;->o(JLjava/lang/String;)V

    iget-object p1, p1, Lole;->a:Ljava/lang/Object;

    check-cast p1, Lqq8;

    invoke-virtual {p1}, Lqq8;->h()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2.0"

    const-string v6, "method"

    const-string v8, "jsonrpc"

    const-string v9, "actions.v1.deleteChat"

    invoke-static {v8, v5, v6, v9}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v5

    const-string v6, "params"

    invoke-virtual {v5, v3, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v4, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v3, Lf32;

    invoke-direct {v3, v0, v2}, Lf32;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v5, v3}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    :cond_a4
    iget-object p0, p0, Llqn;->F:Lmlj;

    if-eqz p0, :cond_a9

    move-object v1, p0

    :cond_a9
    new-instance p0, Lrxh;

    const p1, 0x7f140100

    invoke-direct {p0, p1}, Lrxh;-><init>(I)V

    const/16 p1, 0x9c4

    invoke-virtual {v1, p0, p1}, Lmlj;->a(Lrxh;I)V

    return v2

    :cond_b7
    const v0, 0x7f0a01ff

    if-ne p1, v0, :cond_c0

    invoke-virtual {p0}, Llqn;->K0()V

    return v2

    :cond_c0
    const v0, 0x7f0a0a65

    if-ne p1, v0, :cond_cb

    sget-object p0, Lb80;->b:Lb80;

    invoke-virtual {v3, p0}, Lvsn;->k(Lb80;)V

    return v2

    :cond_cb
    const v0, 0x7f0a041a

    if-ne p1, v0, :cond_e2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lrxh;

    const v0, 0x7f140fdc

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const-string v0, "https://help.opera.com/en/browser-ai-faq/"

    invoke-static {p0, v0, p1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return v2

    :cond_e2
    const v0, 0x7f0a0994

    const/4 v1, 0x0

    if-ne p1, v0, :cond_f9

    iget-object p0, p0, Llqn;->B:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    new-instance p1, Lic2;

    invoke-direct {p1}, Lic2;-><init>()V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return v2

    :cond_f9
    return v1
.end method

.method public final onStart()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object p0, p0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_b

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    :cond_b
    return-void
.end method

.method public final onStop()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object p0, p0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_b

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    :cond_b
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 15

    invoke-super/range {p0 .. p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object v0, p0, Llqn;->G:Lmrn;

    const/4 v8, 0x0

    if-nez v0, :cond_9

    move-object v0, v8

    :cond_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    iget-object v3, v0, Lmrn;->z:Lndc;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    iput-object v1, v0, Lmrn;->z:Lndc;

    :cond_17
    iget-object v0, p0, Llqn;->G:Lmrn;

    if-nez v0, :cond_1c

    move-object v0, v8

    :cond_1c
    iget-object v9, p0, Llqn;->w:Lvsn;

    iget-boolean v1, v9, Lvsn;->m:Z

    iget-object v3, v9, Lvsn;->c:Ls62;

    iget-object v0, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    if-nez v1, :cond_32

    invoke-virtual {v0}, Landroid/widget/TextView;->getImeOptions()I

    move-result v1

    const v4, -0x1000001

    and-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    goto :goto_3c

    :cond_32
    invoke-virtual {v0}, Landroid/widget/TextView;->getImeOptions()I

    move-result v1

    const/high16 v4, 0x1000000

    or-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    :goto_3c
    iget-object v0, p0, Llqn;->G:Lmrn;

    if-nez v0, :cond_41

    move-object v0, v8

    :cond_41
    invoke-virtual {v3}, Ls62;->f()Lqyj;

    move-result-object v1

    iget-object v1, v1, Lqyj;->i:Lode;

    iget-object v4, v0, Lmrn;->z:Lndc;

    if-eqz v4, :cond_7f

    iget-object v0, v0, Lmrn;->u:Lxbf;

    iget-object v5, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v5, Lvbn;

    invoke-interface {v5, v4, v1}, Lvbn;->i(Lndc;Lode;)Z

    move-result v5

    if-nez v5, :cond_7f

    iget-object v5, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v5, Lvbn;

    invoke-interface {v5}, Lvbn;->destroy()V

    new-instance v5, Lplk;

    invoke-direct {v5, v0, v4, v1}, Lplk;-><init>(Lxbf;Lndc;Lode;)V

    iput-object v5, v0, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {v5}, Lplk;->j()Lo2g;

    move-result-object v1

    iget-object v4, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v4, Lo2g;

    if-eq v1, v4, :cond_7f

    iput-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    iget-object v4, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v4}, Ln2d;->invalidate()V

    iget-object v1, v1, Lo2g;->c:Ljava/lang/Object;

    check-cast v1, Ls75;

    invoke-virtual {v0, v1, v8}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    :cond_7f
    new-instance v0, Lpqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v3}, Ls62;->d()Lekc;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Lgil;

    const/16 v5, 0x14

    invoke-direct {v4, v0, p0, v5}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Ljqn;

    const/4 v10, 0x0

    invoke-direct {v0, v4, v10}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v3, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v9, Lvsn;->q:Lwnm;

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v3, Lbqn;

    invoke-direct {v3, p0, v10}, Lbqn;-><init>(Llqn;B)V

    new-instance v4, Ljqn;

    invoke-direct {v4, v3, v10}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v11, v9, Lvsn;->p:Lrlh;

    new-instance v0, Lte5;

    const/4 v6, 0x4

    const/16 v7, 0x8

    const/4 v1, 0x2

    const-class v3, Llqn;

    const-string v4, "handleEvent"

    const-string v5, "handleEvent(Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$Event;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lz99;

    const/4 v3, 0x2

    invoke-direct {v1, v11, v0, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-static {v0}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v0

    invoke-static {v1, v0}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    iget-object v0, p0, Llqn;->t:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbn;

    invoke-virtual {v0}, Ljbn;->a()Lekc;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v4, Lbqn;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, Lbqn;-><init>(Llqn;B)V

    new-instance v6, Ljqn;

    invoke-direct {v6, v4, v10}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v6}, Lekc;->j(Lndc;Lf7f;)V

    iget-boolean v0, v9, Lvsn;->m:Z

    if-eqz v0, :cond_10b

    iget-object v0, v9, Lvsn;->a:Lize;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v4, Lbqn;

    invoke-direct {v4, p0, v3}, Lbqn;-><init>(Llqn;B)V

    new-instance v3, Ljqn;

    invoke-direct {v3, v4, v10}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    :cond_10b
    iget-object v0, p0, Llqn;->L:Landroid/view/View;

    if-eqz v0, :cond_11b

    new-instance v1, Ly1n;

    const/16 v3, 0x19

    invoke-direct {v1, p0, v3}, Ly1n;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v3, 0x1f4

    invoke-virtual {v0, v1, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_11b
    iget-object v0, p0, Llqn;->E:Lzv0;

    if-nez v0, :cond_121

    move-object v1, v8

    goto :goto_122

    :cond_121
    move-object v1, v0

    :goto_122
    iget-object v1, v1, Lzv0;->a:Lnv0;

    if-nez v0, :cond_128

    move-object v3, v8

    goto :goto_129

    :cond_128
    move-object v3, v0

    :goto_129
    iget-object v4, v3, Lzv0;->e:Ljava/lang/String;

    if-eqz v4, :cond_133

    new-instance v3, Lyrn;

    invoke-direct {v3, v4}, Lyrn;-><init>(Ljava/lang/String;)V

    goto :goto_151

    :cond_133
    iget-object v4, v3, Lzv0;->f:Ljava/lang/String;

    if-eqz v4, :cond_141

    iget-object v6, v3, Lzv0;->g:Ljava/lang/String;

    if-eqz v6, :cond_141

    new-instance v3, Ldsn;

    invoke-direct {v3, v4, v6}, Ldsn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_151

    :cond_141
    iget-object v4, v3, Lzv0;->c:Ljava/lang/String;

    if-eqz v4, :cond_148

    sget-object v3, Lbsn;->a:Lbsn;

    goto :goto_151

    :cond_148
    iget-boolean v3, v3, Lzv0;->h:Z

    if-eqz v3, :cond_14f

    sget-object v3, Lasn;->a:Lasn;

    goto :goto_151

    :cond_14f
    sget-object v3, Lzrn;->a:Lzrn;

    :goto_151
    if-eqz v0, :cond_154

    move-object v8, v0

    :cond_154
    iget-object v0, v8, Lzv0;->j:Lfw0;

    invoke-virtual {v9, v1, v3, v0}, Lvsn;->e(Lnv0;Ljoh;Lfw0;)V

    iget-object v0, p0, Llqn;->I:Lp8f;

    if-eqz v0, :cond_175

    iget-object v0, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lzll;

    new-instance v1, Lcqn;

    invoke-direct {v1, p0, v10}, Lcqn;-><init>(Llqn;B)V

    sget-object v3, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_175

    invoke-static {v3, v0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_175
    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v1, Lcqn;

    invoke-direct {v1, p0, v5}, Lcqn;-><init>(Llqn;B)V

    invoke-static {v0, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    new-instance v0, Lz61;

    invoke-direct {v0, p1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v0, v0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Lkze;

    new-instance v1, Lbqn;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v3}, Lbqn;-><init>(Llqn;B)V

    new-instance v2, Ljqn;

    invoke-direct {v2, v1, v10}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v2}, Lekc;->k(Lf7f;)V

    new-instance v0, Lca;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Lca;-><init>(Landroid/view/View;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 6

    const v0, 0x7f0a0200

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a0102

    if-eqz v0, :cond_15

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    iput-object v0, p0, Llqn;->L:Landroid/view/View;

    if-eqz v0, :cond_23

    new-instance v2, Leqn;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Leqn;-><init>(Llqn;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_23
    const v0, 0x7f0a0754

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3f

    new-instance v2, Leqn;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Leqn;-><init>(Llqn;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3f
    const v0, 0x7f0a034d

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5b

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5b

    new-instance v0, Leqn;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Leqn;-><init>(Llqn;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_5b
    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "WebAiAssistantFragmentBase"

    return-object p0
.end method

.method public final z0()V
    .registers 5

    iget-object v0, p0, Llqn;->G:Lmrn;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lmrn;->m:Landroid/view/View;

    new-instance v2, Lsjn;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Lsjn;-><init>(B)V

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v2}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {p0, v1}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
