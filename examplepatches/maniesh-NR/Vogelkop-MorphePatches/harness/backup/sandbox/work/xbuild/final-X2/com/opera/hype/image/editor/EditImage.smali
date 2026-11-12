.class public final Lcom/opera/hype/image/editor/EditImage;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001:\u0007\u0002\u0003\u0004\u0005\u0006\u0007\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/hype/image/editor/EditImage;",
        "Landroid/widget/FrameLayout;",
        "qq6",
        "bt7",
        "gt7",
        "ht7",
        "ft7",
        "at7",
        "zs7",
        "image-editor"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic s:[Lxtb;


# instance fields
.field public final a:F

.field public final b:Lean;

.field public final c:Lit7;

.field public d:Ldya;

.field public final e:Lywl;

.field public final f:Lkk7;

.field public final g:Lbpd;

.field public final h:Llxl;

.field public i:Lat7;

.field public j:Lbfl;

.field public k:Lzs7;

.field public final l:Lrdb;

.field public m:Lqq6;

.field public final n:Lo8g;

.field public final o:Lqk3;

.field public final p:Let7;

.field public final q:Li76;

.field public r:Ltam;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lcom/opera/hype/image/editor/EditImage;

    const-string v2, "textMode"

    const-string v3, "getTextMode()Lcom/opera/hype/image/editor/EditImage$TextMode;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 192
    const/4 v0, 0x0

    const/16 v1, 0xc

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/opera/hype/image/editor/EditImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;FI)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;FI)V
    .registers 15

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move-object p2, v1

    :cond_6
    const/16 v0, 0x8

    and-int/2addr p4, v0

    if-eqz p4, :cond_d

    const/high16 p3, 0x3f800000    # 1.0f

    :cond_d
    const/4 p4, 0x0

    invoke-direct {p0, p1, p2, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput p3, p0, Lcom/opera/hype/image/editor/EditImage;->a:F

    new-instance p2, Lean;

    new-instance p3, Lydb;

    invoke-direct {p3, p1}, Lydb;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    iput-boolean v2, p3, Lydb;->D:Z

    iput-boolean v2, p3, Lydb;->E:Z

    iput-boolean v2, p3, Lydb;->F:Z

    invoke-direct {p2, p3}, Lean;-><init>(Lydb;)V

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v3

    invoke-virtual {p3, v3}, Landroid/view/View;->setId(I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object p2, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    new-instance p2, Lit7;

    invoke-direct {p2, p0, p4}, Lit7;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lcom/opera/hype/image/editor/EditImage;->c:Lit7;

    new-instance p2, Ldya;

    sget-object p3, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-direct {p2, p3}, Ldya;-><init>(Landroid/net/Uri;)V

    iput-object p2, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    new-instance p2, Lywl;

    new-instance p3, Lft7;

    invoke-direct {p3, p0}, Lft7;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    invoke-direct {p2, p1, p3}, Lywl;-><init>(Landroid/content/Context;Lft7;)V

    iput-object p2, p0, Lcom/opera/hype/image/editor/EditImage;->e:Lywl;

    new-instance p2, Lkk7;

    new-instance p3, Li97;

    const/4 v3, 0x7

    invoke-direct {p3, v1, v3}, Li97;-><init>(Landroid/graphics/PointF;I)V

    invoke-direct {p2, p1, p3}, Lkk7;-><init>(Landroid/content/Context;Li97;)V

    iput-object p2, p0, Lcom/opera/hype/image/editor/EditImage;->f:Lkk7;

    new-instance p1, Lbpd;

    invoke-direct {p1, p0}, Lbpd;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    new-instance p1, Llxl;

    new-instance p2, Lqq6;

    invoke-direct {p2, p0, v0}, Lqq6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, p0}, Llxl;-><init>(Lqq6;Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->h:Llxl;

    sget-object p1, Lat7;->f:Lat7;

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    sget-object p1, Lzs7;->a:Lzs7;

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    new-instance p1, Lrdb;

    new-instance p2, Lws7;

    invoke-direct {p2, p0, p4}, Lws7;-><init>(Lcom/opera/hype/image/editor/EditImage;B)V

    invoke-direct {p1, p2}, Lrdb;-><init>(Lws7;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->l:Lrdb;

    new-instance p1, Lo8g;

    invoke-direct {p1, p0}, Lo8g;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->n:Lo8g;

    new-instance p1, Lqk3;

    invoke-direct {p1, p0}, Lqk3;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->o:Lqk3;

    new-instance v3, Lbt7;

    sget-object v7, Lnil;->b:Lnil;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v9}, Lbt7;-><init>(IZILnil;ZI)V

    new-instance p1, Let7;

    invoke-direct {p1, v3, p0}, Let7;-><init>(Lbt7;Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->p:Let7;

    new-instance p1, Li76;

    invoke-direct {p1, p0}, Li76;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->q:Li76;

    new-instance p1, Ln57;

    const/16 p2, 0x1d

    invoke-direct {p1, p2}, Ln57;-><init>(B)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->r:Ltam;

    invoke-virtual {p0, p4}, Landroid/view/View;->setWillNotDraw(Z)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    return-void
.end method


# virtual methods
.method public final a(Lbfl;Z)V
    .registers 13

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    if-eq v0, p1, :cond_a9

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    const/4 v1, 0x1

    if-eqz p2, :cond_24

    iget-object p2, p1, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p2}, Landroid/view/View;->requestFocus()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v2, p2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_24
    invoke-virtual {p1, v1, v0}, Lbfl;->e(ZZ)V

    invoke-virtual {p1, v1}, Lbfl;->f(Z)V

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->m:Lqq6;

    if-eqz p0, :cond_a9

    iget-object p1, p1, Lbfl;->b:Lba3;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lywa;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p2, p0, Llxa;->g:Lra5;

    iget-object v0, p0, Llxa;->n:Lnak;

    iget-object p0, p0, Llxa;->p:Lnak;

    instance-of v1, p1, Loel;

    if-eqz v1, :cond_a0

    check-cast p1, Loel;

    iget-boolean v1, p1, Loel;->l:Z

    if-eqz v1, :cond_4b

    sget-object v1, Lnsl;->g:Lnsl;

    goto :goto_4d

    :cond_4b
    sget-object v1, Lnsl;->f:Lnsl;

    :goto_4d
    invoke-virtual {v0, v1}, Lnak;->j(Ljava/lang/Object;)V

    sget-object v0, Ln8g;->c:La36;

    invoke-virtual {p1}, Loel;->i()I

    move-result v1

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ls5h;

    iget-object v2, v2, Ls5h;->a:Ln8g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, v2, p2}, La36;->k(ILn8g;Lra5;)Ln8g;

    move-result-object v4

    invoke-virtual {p1}, Loel;->k()I

    move-result v0

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ls5h;

    iget-object v1, v1, Ls5h;->f:Ln8g;

    invoke-static {v0, v1, p2}, La36;->k(ILn8g;Lra5;)Ln8g;

    move-result-object v9

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ls5h;

    invoke-virtual {p1}, Loel;->j()Z

    move-result v5

    invoke-virtual {p1}, Loel;->l()I

    move-result v6

    invoke-virtual {p1}, Loel;->u()Z

    move-result v8

    iget-object p1, p1, Loel;->p:Lmel;

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object p1, p1, La7f;->b:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Lnil;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ls5h;

    invoke-direct/range {v3 .. v9}, Ls5h;-><init>(Ln8g;ZILnil;ZLn8g;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_a0
    instance-of p0, p1, Lox7;

    if-eqz p0, :cond_a9

    sget-object p0, Lnsl;->i:Lnsl;

    invoke-virtual {v0, p0}, Lnak;->j(Ljava/lang/Object;)V

    :cond_a9
    return-void
.end method

.method public final b(Lba3;)Lbfl;
    .registers 16

    new-instance v0, Lbfl;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->r:Ltam;

    new-instance v3, Lal7;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, p1, v2, v3}, Lbfl;-><init>(Landroid/content/Context;Lba3;Ltam;Lal7;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x33

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, v0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v3, v1, Lbpd;->c:Ljava/lang/Object;

    check-cast v3, Li97;

    iget-object v1, v1, Lbpd;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v3, v1}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-virtual {v0, v3}, Lbfl;->d(Li97;)V

    :cond_33
    new-instance v1, Lys7;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lys7;-><init>(Ljava/lang/Object;B)V

    iget-object v5, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance v1, Lvs7;

    invoke-direct {v1, p0, v0, v3}, Lvs7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v1, Lup2;

    invoke-direct {v1, p0, v0, v4}, Lup2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v1, v0, Lbfl;->d:Lrf2;

    iget-object v1, v1, Lrf2;->k:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    new-instance v3, Ljf7;

    invoke-direct {v3, p0, p1, v4}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object p1, Lew7;->e:Li06;

    new-instance v6, Lci7;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/opera/hype/image/editor/EditImage;->l:Lrdb;

    const-class v9, Lrdb;

    const-string v10, "onUserInteracting"

    const-string v11, "onUserInteracting(Z)V"

    invoke-direct/range {v6 .. v13}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lew7;

    invoke-direct {p1, v6}, Lew7;-><init>(Lci7;)V

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance v1, Lz61;

    const/16 v3, 0x9

    invoke-direct {v1, p1, v3}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public final c(ZZ)Z
    .registers 10

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    const/4 v1, 0x0

    if-eqz v0, :cond_a5

    iget-object v2, v0, Lbfl;->b:Lba3;

    const/4 v3, 0x0

    iput-object v3, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    iget-object v4, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    if-eqz p1, :cond_50

    invoke-virtual {v4}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v5, v2, Lba3;->e:Laa3;

    sget-object v6, Lba3;->j:[Lxtb;

    aget-object v6, v6, v1

    invoke-virtual {v5, v6, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object p1, v0, Lbfl;->c:Lal7;

    iget-object p1, p1, Lal7;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p1, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-static {p1, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_40

    invoke-virtual {v0}, Lbfl;->a()Z

    move-result v5

    if-nez v5, :cond_39

    invoke-virtual {v0}, Lbfl;->b()Z

    move-result v5

    if-eqz v5, :cond_53

    :cond_39
    invoke-virtual {v2, v3}, Lfya;->d(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v2}, Ldya;->b(Lfya;)V

    goto :goto_53

    :cond_40
    invoke-virtual {v0}, Lbfl;->a()Z

    move-result v5

    if-nez v5, :cond_53

    invoke-virtual {v0}, Lbfl;->b()Z

    move-result v5

    if-nez v5, :cond_53

    invoke-virtual {p1, v2}, Ldya;->c(Lfya;)V

    goto :goto_53

    :cond_50
    invoke-virtual {v2, v4}, Lba3;->h(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    :cond_53
    :goto_53
    if-eqz v4, :cond_71

    invoke-virtual {v4}, Landroid/view/View;->clearFocus()V

    invoke-virtual {v4}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p1

    if-eqz p1, :cond_71

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v5, "input_method"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v4}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {p1, v4, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_71
    invoke-virtual {v0, v1, p2}, Lbfl;->e(ZZ)V

    invoke-virtual {v0, v1}, Lbfl;->f(Z)V

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-static {p1, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_84

    iget-object p1, v0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_84
    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->m:Lqq6;

    if-eqz p0, :cond_a3

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lywa;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p1, p0, Llxa;->f:Ljava/util/List;

    iget-object p0, p0, Llxa;->n:Lnak;

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a3

    invoke-virtual {p0, v3}, Lnak;->j(Ljava/lang/Object;)V

    :cond_a3
    const/4 p0, 0x1

    return p0

    :cond_a5
    return v1
.end method

.method public final d()Landroid/graphics/Bitmap;
    .registers 2

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object p0, p0, Lean;->a:Lydb;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_1e

    instance-of v0, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_15

    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_15
    instance-of v0, p0, Lqp8;

    if-eqz v0, :cond_1e

    check-cast p0, Lqp8;

    iget-object p0, p0, Lqp8;->a:Landroid/graphics/Bitmap;

    return-object p0

    :cond_1e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 10

    sget-object v0, Lzs7;->a:Lzs7;

    iput-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    iget-object v1, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object v1, v1, Lean;->a:Lydb;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v2, v1, Lbpd;->c:Ljava/lang/Object;

    check-cast v2, Li97;

    iget-object v3, v1, Lbpd;->c:Ljava/lang/Object;

    check-cast v3, Li97;

    iget-object v4, v1, Lbpd;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v2, v4}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v5

    if-nez v5, :cond_23

    :cond_22
    return-void

    :cond_23
    iget-object v5, v2, Li97;->a:Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    iget v5, v5, Landroid/graphics/PointF;->y:F

    iget-object v2, v2, Li97;->b:Landroid/graphics/PointF;

    iget v7, v2, Landroid/graphics/PointF;->x:F

    add-float/2addr v7, v6

    iget v2, v2, Landroid/graphics/PointF;->y:F

    add-float/2addr v2, v5

    invoke-virtual {p1, v6, v5, v7, v2}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    sget-object v2, Lzs7;->b:Lzs7;

    iput-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    sget-object v2, Lzs7;->c:Lzs7;

    iput-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    iget-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    sget-object v5, Lat7;->a:Lat7;

    if-ne v2, v5, :cond_6b

    iget-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->o:Lqk3;

    iget-object v5, v2, Lqk3;->c:Lfz2;

    sget-object v6, Lqk3;->d:[Lxtb;

    const/4 v7, 0x0

    aget-object v6, v6, v7

    iget-object v5, v5, La7f;->b:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/Bitmap;

    if-eqz v5, :cond_6b

    invoke-virtual {v3, v4}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v6

    if-eqz v6, :cond_6b

    iget-object v2, v2, Lqk3;->b:Lok3;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v2, v6, v5, v3}, Lok3;->f(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Li97;)Landroid/graphics/Paint;

    move-result-object v2

    iget-object v5, p0, Lcom/opera/hype/image/editor/EditImage;->h:Llxl;

    iget-object v5, v5, Llxl;->c:Landroid/graphics/Path;

    invoke-virtual {p1, v5, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_6b
    new-instance v2, Lwhf;

    const/16 v5, 0x16

    invoke-direct {v2, p0, v5}, Lwhf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v4

    if-eqz v4, :cond_8b

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    iget-object v5, v3, Li97;->a:Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v6, v5}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v2, p1, v3}, Lwhf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_8b
    new-instance v2, Lcv2;

    const/16 v3, 0x1b

    invoke-direct {v2, p0, p1, v3}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    sget-object v1, Lzs7;->d:Lzs7;

    iput-object v1, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    iput-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    return-void
.end method

.method public final drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 8

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->k:Lzs7;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    if-eq v0, v1, :cond_1b

    const/4 v1, 0x3

    if-ne v0, v1, :cond_23

    iget-object v0, v2, Lean;->a:Lydb;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p0

    return p0

    :cond_1b
    iget-object v0, v2, Lean;->a:Lydb;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    :cond_23
    const/4 p0, 0x0

    return p0

    :cond_25
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p0

    return p0
.end method

.method public final e(Lba3;)Lbfl;
    .registers 4

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object p0

    new-instance v0, Lu39;

    invoke-direct {v0, p0}, Lu39;-><init>(Lv39;)V

    :cond_9
    invoke-virtual {v0}, Lu39;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1f

    invoke-virtual {v0}, Lu39;->next()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lbfl;

    iget-object v1, v1, Lbfl;->b:Lba3;

    invoke-virtual {v1, p1}, Lfya;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    goto :goto_20

    :cond_1f
    const/4 p0, 0x0

    :goto_20
    check-cast p0, Lbfl;

    return-object p0
.end method

.method public final f()Lv39;
    .registers 4

    new-instance v0, Lg6n;

    invoke-direct {v0, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    new-instance p0, Lm57;

    const/16 v1, 0x11

    invoke-direct {p0, v1}, Lm57;-><init>(B)V

    new-instance v1, Lm2m;

    invoke-direct {v1, v0, p0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Lbli;

    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lbli;-><init>(B)V

    new-instance v0, Lv39;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method public final g()Lbt7;
    .registers 3

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->p:Let7;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Lbt7;

    return-object p0
.end method

.method public final h(Lba3;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    if-eqz v0, :cond_13

    iget-object v1, v0, Lbfl;->b:Lba3;

    invoke-virtual {v1, p1}, Lfya;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    const/4 v0, 0x0

    :cond_d
    if-eqz v0, :cond_13

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    :cond_13
    new-instance v0, Lg6n;

    invoke-direct {v0, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    new-instance v1, Lwg5;

    const/16 v2, 0x1c

    invoke-direct {v1, p1, v2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p1

    new-instance v0, Lu39;

    invoke-direct {v0, p1}, Lu39;-><init>(Lv39;)V

    :goto_28
    invoke-virtual {v0}, Lu39;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_38

    invoke-virtual {v0}, Lu39;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_28

    :cond_38
    return-void
.end method

.method public final i(I)V
    .registers 5

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object p0

    new-instance v0, Lu39;

    invoke-direct {v0, p0}, Lu39;-><init>(Lv39;)V

    :cond_9
    :goto_9
    invoke-virtual {v0}, Lu39;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_28

    invoke-virtual {v0}, Lu39;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbfl;

    iget-object v1, p0, Lbfl;->b:Lba3;

    invoke-virtual {v1}, Lba3;->e()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-lez v1, :cond_9

    iget-object p0, p0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_9

    :cond_28
    return-void
.end method

.method public final j(Lat7;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    sget-object v0, Lat7;->c:Lat7;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_12

    sget-object v3, Lat7;->d:Lat7;

    if-eq p1, v3, :cond_12

    invoke-virtual {p0, v2, v1}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    :cond_12
    if-eq p1, v0, :cond_1e

    sget-object v0, Lat7;->d:Lat7;

    if-eq p1, v0, :cond_1e

    sget-object v0, Lat7;->f:Lat7;

    if-eq p1, v0, :cond_1e

    move v0, v1

    goto :goto_1f

    :cond_1e
    move v0, v2

    :goto_1f
    iget-object v3, p0, Lcom/opera/hype/image/editor/EditImage;->e:Lywl;

    iget-object v3, v3, Lywl;->b:Lfz2;

    sget-object v4, Lywl;->c:[Lxtb;

    aget-object v4, v4, v1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->h:Llxl;

    if-eqz p1, :cond_75

    if-eq p1, v2, :cond_75

    const/4 v3, 0x4

    if-eq p1, v3, :cond_75

    const/4 v3, 0x6

    const/4 v4, 0x0

    if-eq p1, v3, :cond_5c

    iget-object p1, v0, Lean;->a:Lydb;

    iput-boolean v2, p1, Lydb;->F:Z

    iput-boolean v2, p1, Lydb;->E:Z

    iput-boolean v2, p1, Lydb;->D:Z

    invoke-virtual {p0}, Llxl;->b()V

    iget-object p0, p0, Llxl;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object p0, p0, Lean;->a:Lydb;

    invoke-virtual {p0, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void

    :cond_5c
    iget-object p1, v0, Lean;->a:Lydb;

    iput-boolean v1, p1, Lydb;->F:Z

    iput-boolean v1, p1, Lydb;->E:Z

    iput-boolean v1, p1, Lydb;->D:Z

    invoke-virtual {p0}, Llxl;->b()V

    iget-object p0, p0, Llxl;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object p0, p0, Lean;->a:Lydb;

    invoke-virtual {p0, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void

    :cond_75
    iget-object p1, v0, Lean;->a:Lydb;

    iput-boolean v1, p1, Lydb;->F:Z

    iput-boolean v2, p1, Lydb;->E:Z

    iput-boolean v2, p1, Lydb;->D:Z

    iget-object p1, p0, Llxl;->a:Lqq6;

    iget-object p1, p1, Lqq6;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p1, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object p1, p1, Lean;->a:Lydb;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public final k(Ldya;)V
    .registers 8

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    if-eq v0, p1, :cond_53

    iget-object v0, v0, Ldya;->c:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/opera/hype/image/editor/EditImage;->c:Lit7;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    iget-object v2, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    iget-object v2, v2, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v0

    :goto_18
    if-ge v4, v3, :cond_26

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lfya;

    invoke-virtual {v1, v5}, Lit7;->c(Lfya;)V

    goto :goto_18

    :cond_26
    iput-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_54

    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    move-result p1

    if-nez p1, :cond_54

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    iget-object p1, p1, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    iget-object p0, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_45
    if-ge v0, p1, :cond_53

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lfya;

    invoke-virtual {v1, v2}, Lit7;->a(Lfya;)V

    goto :goto_45

    :cond_53
    return-void

    :cond_54
    new-instance p1, Lho3;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lho3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->e:Lywl;

    invoke-virtual {v0, p1}, Lywl;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
