.class public final Lz61;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 30
    const/16 v0, 0x14

    iput-byte v0, p0, Lz61;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 4

    const/16 v0, 0x19

    iput-byte v0, p0, Lz61;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_12

    sget-object v1, Lng;->a:Lng;

    goto :goto_14

    :cond_12
    sget-object v1, Log;->a:Log;

    :goto_14
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lz61;->b:Ljava/lang/Object;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 29
    iput-byte p2, p0, Lz61;->a:B

    iput-object p1, p0, Lz61;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final c(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final d(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final e(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final h(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final j(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final k(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final l(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final m(Landroid/view/View;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 12

    iget-byte v0, p0, Lz61;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_2a2

    :pswitch_8
    return-void

    :pswitch_9
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lwjj;

    iget-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/core/widget/NestedScrollView;

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Ln9n;

    invoke-virtual {p1, v0}, Landroidx/core/widget/NestedScrollView;->z(Ln9n;)V

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Lho3;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lsw0;

    iget-object p1, p0, Lsw0;->m:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lsw0;->n:Landroid/content/ComponentCallbacks;

    check-cast p0, Lit5;

    invoke-virtual {p1, p0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    return-void

    :pswitch_43
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    sget-object p1, Lng;->a:Lng;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_4d
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lh5k;

    iget-object p1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast p0, Lml2;

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :pswitch_60
    return-void

    :pswitch_61
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    if-eqz p1, :cond_78

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Leck;

    invoke-virtual {p1, p0}, Lc1f;->d(Lfck;)V

    :cond_78
    :pswitch_78
    return-void

    :pswitch_79
    const v0, 0x7f0a0a8f

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_86

    move-object v2, v0

    check-cast v2, Latj;

    goto :goto_98

    :cond_86
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_91

    check-cast v0, Landroid/view/View;

    goto :goto_92

    :cond_91
    move-object v0, v2

    :goto_92
    if-eqz v0, :cond_98

    invoke-static {v0}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v2

    :cond_98
    :goto_98
    iput-object v2, p0, Lz61;->b:Ljava/lang/Object;

    if-eqz v2, :cond_a7

    iget-object p0, v2, Latj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a7

    invoke-virtual {v2}, Latj;->b()V

    :cond_a7
    return-void

    :pswitch_a8
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Ll8i;

    invoke-virtual {p0}, Ll8i;->a()V

    :pswitch_af
    return-void

    :pswitch_b0
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lshf;

    iget-object p1, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ld8d;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_c0
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Llqe;

    iget-object p1, p0, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    invoke-static {p1}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object p1

    iput-object p1, p0, Llqe;->q:Lc1f;

    if-eqz p1, :cond_d3

    iget-object p0, p0, Llqe;->r:Lkqe;

    invoke-virtual {p1, p0}, Lc1f;->d(Lfck;)V

    :cond_d3
    return-void

    :pswitch_d4
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lbpd;

    invoke-virtual {p0}, Lbpd;->E()Lydn;

    move-result-object p1

    iget-object v0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast v0, Lqxc;

    invoke-virtual {p1, v0}, Lydn;->b(Ltdn;)V

    invoke-virtual {p0}, Lbpd;->a0()V

    :pswitch_e6
    return-void

    :pswitch_e7
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void

    :pswitch_f3
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lz28;

    iget-object p1, p0, Lz28;->q:Landroid/view/accessibility/AccessibilityManager;

    iget-object v0, p0, Lz28;->r:Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;

    if-eqz v0, :cond_10a

    if-eqz p1, :cond_10a

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_10a

    iget-object p0, p0, Lz28;->r:Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityManager;->addTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    :cond_10a
    :pswitch_10a
    return-void

    :pswitch_10b
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lyv7;

    iget-object v0, p0, Lyv7;->c:Lhz4;

    iget-object v4, v0, Lhz4;->g:Ljava/lang/Object;

    check-cast v4, Lbpd;

    iput-object p0, v4, Lbpd;->b:Ljava/lang/Object;

    iget-object v0, v0, Lhz4;->h:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_226

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->g0()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12e

    invoke-static {v4}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    :cond_12e
    iget-object v4, v0, Ld7l;->e:Lw6j;

    invoke-virtual {v4}, Lw6j;->h()Lknf;

    move-result-object v4

    if-eqz v4, :cond_13b

    invoke-interface {v4}, Lknf;->z()Ljava/lang/String;

    move-result-object v4

    goto :goto_145

    :cond_13b
    iget-object v4, v0, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/opera/android/browser/BrowserUtils;->getEditableString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_145
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x3e8

    if-lt v5, v6, :cond_16f

    const-string v5, "data:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16f

    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/2addr v5, v3

    if-eqz v5, :cond_16f

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    if-le v6, v5, :cond_16f

    invoke-virtual {v4, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, "uri-content"

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_16f
    iget-object v5, v0, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    invoke-virtual {v0}, Ld7l;->i0()Ljava/lang/String;

    new-instance v6, Lorg/chromium/url/GURL;

    invoke-direct {v6, v5}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, LJ/N;->MKonq97J(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18d

    invoke-static {v6}, LJ/N;->M6gdEujY(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_191

    :cond_18d
    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v6

    :goto_191
    iget-object v7, v0, Ld7l;->j:Le7l;

    invoke-interface {v7}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/opera/android/browser/BrowserUtils;->b(Ljava/lang/String;)Lzg;

    move-result-object v7

    invoke-static {v5}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v8

    invoke-static {v5}, Lwqm;->A(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1de

    invoke-static {v5}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1de

    if-nez v8, :cond_1de

    iget-object v8, v0, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1de

    invoke-static {v5}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1de

    invoke-static {v5}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1de

    const-string v8, "jump"

    invoke-static {v5}, Lcom/opera/android/browser/UrlMangler;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1de

    const-string v8, "market://"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1de

    iget-object v8, v0, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->c0()Z

    :cond_1de
    iget-object v8, v0, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->m()Z

    invoke-virtual {v0}, Ld7l;->n0()Z

    invoke-virtual {v0}, Ld7l;->o0()Z

    move-result v8

    iget-object v9, v0, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->r()Z

    move-result v9

    if-nez v9, :cond_201

    iget-object v9, v0, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->c0()Z

    move-result v9

    if-eqz v9, :cond_200

    invoke-virtual {v0}, Ld7l;->o0()Z

    move-result v0

    if-eqz v0, :cond_201

    :cond_200
    move v3, v1

    :cond_201
    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    const/4 v9, 0x2

    if-eqz v7, :cond_216

    iget-object v4, v7, Lzg;->b:Ljava/lang/Object;

    check-cast v4, Lsre;

    invoke-virtual {v4}, Lsre;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Lsre;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v6, v4, v9, v1}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    goto :goto_219

    :cond_216
    invoke-virtual {v0, v4, v6, v9, v1}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    :goto_219
    if-nez v3, :cond_222

    if-nez v8, :cond_222

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iput-object v5, v0, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    goto :goto_226

    :cond_222
    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iput-object v2, v0, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    :cond_226
    :goto_226
    invoke-virtual {p0}, Lyv7;->o()V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    return-void

    :pswitch_22d
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lwt7;

    iput-boolean v3, p0, Lwt7;->l:Z

    invoke-virtual {p0}, Lwt7;->b()V

    :pswitch_236
    return-void

    :pswitch_237
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    iget-object p0, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->e:Lm9f;

    invoke-virtual {p0}, Lm9f;->f()V

    return-void

    :pswitch_241
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lx65;

    iput-boolean v3, p0, Lx65;->z:Z

    iget-object v0, p0, Lx65;->e:Ldll;

    invoke-virtual {v0, p0}, Ldll;->a(Lcll;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    invoke-virtual {p0}, Lx65;->m0()V

    :pswitch_256
    return-void

    :pswitch_257
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lx03;

    iget-object p1, p0, Lx03;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lx03;->f:Lml2;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-static {p1}, Lujp;->k(Landroid/view/View;)Ln03;

    move-result-object p1

    iput-object p1, p0, Lx03;->e:Ln03;

    if-eqz p1, :cond_277

    iget-object p1, p1, Ln03;->b:Lpde;

    if-eqz p1, :cond_277

    iget-object p0, p0, Lx03;->g:Lk9;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    :cond_277
    return-void

    :pswitch_278
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lql2;

    iput-boolean v3, p0, Lql2;->g:Z

    iget-object p1, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    new-instance v0, Lol2;

    invoke-direct {v0, p0, v1}, Lol2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p0, v2, v0}, Lp37;->A(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnDrawListener;)V

    return-void

    :pswitch_289
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, La71;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-boolean v0, p0, La71;->c:Z

    if-nez v0, :cond_2a0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, La71;->d:Ly61;

    invoke-virtual {p1, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    iput-boolean v3, p0, La71;->c:Z

    :cond_2a0
    return-void

    nop

    :pswitch_data_2a2
    .packed-switch 0x0
        :pswitch_289
        :pswitch_278
        :pswitch_257
        :pswitch_256
        :pswitch_241
        :pswitch_237
        :pswitch_236
        :pswitch_22d
        :pswitch_10b
        :pswitch_10a
        :pswitch_f3
        :pswitch_e7
        :pswitch_e6
        :pswitch_e6
        :pswitch_e6
        :pswitch_d4
        :pswitch_c0
        :pswitch_b0
        :pswitch_af
        :pswitch_a8
        :pswitch_79
        :pswitch_78
        :pswitch_61
        :pswitch_60
        :pswitch_4d
        :pswitch_43
        :pswitch_20
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lz61;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_23c

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Ld3k;

    invoke-virtual {p0, v2}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    return-void

    :pswitch_12
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    return-void

    :pswitch_1c
    iget-object p1, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p1, Lwjj;

    iget-object v0, p1, Lwjj;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0, v2}, Landroidx/core/widget/NestedScrollView;->z(Ln9n;)V

    iget-object p0, p1, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Lho3;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    :pswitch_32
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lsw0;

    iget-object p1, p0, Lsw0;->m:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lsw0;->n:Landroid/content/ComponentCallbacks;

    check-cast p0, Lit5;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    return-void

    :pswitch_46
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    sget-object p1, Log;->a:Log;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_50
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lh5k;

    iget-object p1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast p0, Lml2;

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return-void

    :pswitch_64
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lhqk;

    invoke-virtual {p0, v2, v1}, Lhqk;->H(Lpvb;Z)V

    return-void

    :pswitch_6c
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Lc1f;

    if-eqz p1, :cond_7d

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Leck;

    invoke-virtual {p1, v0}, Lc1f;->g(Lfck;)V

    :cond_7d
    iput-object v2, p0, Lghf;->d:Ljava/lang/Object;

    return-void

    :pswitch_80
    iget-object v0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Ll3k;

    iget-object v1, v0, Ll3k;->p:Landroid/view/ViewTreeObserver;

    if-eqz v1, :cond_9b

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-nez v1, :cond_94

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iput-object v1, v0, Ll3k;->p:Landroid/view/ViewTreeObserver;

    :cond_94
    iget-object v1, v0, Ll3k;->p:Landroid/view/ViewTreeObserver;

    iget-object v0, v0, Ll3k;->j:Ldh;

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_9b
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :pswitch_9f
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Latj;

    if-eqz p0, :cond_b0

    iget-object v0, p0, Latj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b0

    invoke-virtual {p0}, Latj;->b()V

    :cond_b0
    return-void

    :pswitch_b1
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Ll8i;

    iget-object p1, p0, Ll8i;->e:Lq65;

    invoke-virtual {p1}, Ln1;->S()V

    iget-object p0, p0, Ll8i;->d:Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_c5

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_c5
    return-void

    :pswitch_c6
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lrmh;

    iget-object p1, p0, Lrmh;->b:Lp1j;

    if-eqz p1, :cond_d3

    invoke-virtual {p1, v1}, Lp1j;->cancel(Z)Z

    iput-object v2, p0, Lrmh;->b:Lp1j;

    :cond_d3
    return-void

    :pswitch_d4
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lshf;

    iget-object p1, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ld8d;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    return-void

    :pswitch_e4
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Llqe;

    iget-object p1, p0, Llqe;->q:Lc1f;

    if-eqz p1, :cond_f1

    iget-object v0, p0, Llqe;->r:Lkqe;

    invoke-virtual {p1, v0}, Lc1f;->g(Lfck;)V

    :cond_f1
    iput-object v2, p0, Llqe;->q:Lc1f;

    return-void

    :pswitch_f4
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lbpd;

    invoke-virtual {p0}, Lbpd;->E()Lydn;

    move-result-object p1

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lqxc;

    invoke-virtual {p1, p0}, Lydn;->A(Ltdn;)V

    return-void

    :pswitch_104
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;

    iget-object p1, p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;->c:Lcba;

    if-eqz p1, :cond_115

    iget-object v0, p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;->b:Landroid/view/accessibility/AccessibilityManager;

    if-eqz v0, :cond_115

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityManager;->removeTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    iput-object v2, p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;->c:Lcba;

    :cond_115
    return-void

    :pswitch_116
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;

    iget-object p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->h:Lcba;

    if-eqz p1, :cond_127

    iget-object v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->g:Landroid/view/accessibility/AccessibilityManager;

    if-eqz v0, :cond_127

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityManager;->removeTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    iput-object v2, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->h:Lcba;

    :cond_127
    return-void

    :pswitch_128
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;

    iget v0, p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;->b:I

    const/4 v2, 0x1

    if-lez v0, :cond_134

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;->b:I

    :cond_134
    iget-object v0, p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;->a:Lz61;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget p1, p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;->b:I

    if-lez p1, :cond_13f

    move p1, v2

    goto :goto_140

    :cond_13f
    move p1, v1

    :goto_140
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_147

    move v2, v1

    :cond_147
    if-eq p1, v2, :cond_14f

    if-nez p1, :cond_14c

    const/4 v1, 0x4

    :cond_14c
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_14f
    return-void

    :pswitch_150
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void

    :pswitch_15c
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lz28;

    iget-object p1, p0, Lz28;->r:Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;

    if-eqz p1, :cond_16b

    iget-object p0, p0, Lz28;->q:Landroid/view/accessibility/AccessibilityManager;

    if-eqz p0, :cond_16b

    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityManager;->removeTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    :cond_16b
    return-void

    :pswitch_16c
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lew7;

    sget-object p1, Lew7;->e:Li06;

    iget-object p1, p0, Lew7;->c:Lfz2;

    sget-object v0, Lew7;->f:[Lxtb;

    aget-object v2, v0, v1

    iget-object v2, p1, La7f;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_190

    iget-object v2, p0, Lew7;->a:Landroid/os/Handler;

    iget-object p0, p0, Lew7;->b:Lbn7;

    invoke-virtual {v2, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    aget-object p0, v0, v1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0, v0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    :cond_190
    return-void

    :pswitch_191
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lyv7;

    iget-object p0, p0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->g:Ljava/lang/Object;

    check-cast p0, Lbpd;

    iput-object v2, p0, Lbpd;->b:Ljava/lang/Object;

    :pswitch_19d
    return-void

    :pswitch_19e
    iget-object v0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Lzk7;

    iget-object v3, v0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iput-object v2, v0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    :pswitch_1ac
    return-void

    :pswitch_1ad
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lx65;

    iput-boolean v1, p0, Lx65;->z:Z

    iget-object v0, p0, Lx65;->p:Lz61;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    iget-object p1, p0, Lx65;->e:Ldll;

    invoke-virtual {p1, p0}, Ldll;->b(Lcll;)V

    return-void

    :pswitch_1c5
    iget-object v0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Lnl4;

    iget-object v1, v0, Lnl4;->y:Landroid/view/ViewTreeObserver;

    if-eqz v1, :cond_1e0

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-nez v1, :cond_1d9

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iput-object v1, v0, Lnl4;->y:Landroid/view/ViewTreeObserver;

    :cond_1d9
    iget-object v1, v0, Lnl4;->y:Landroid/view/ViewTreeObserver;

    iget-object v0, v0, Lnl4;->j:Ldh;

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1e0
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :pswitch_1e4
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lx03;

    iget-object p1, p0, Lx03;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object v0, p0, Lx03;->f:Lml2;

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object p1, p0, Lx03;->e:Ln03;

    if-eqz p1, :cond_200

    iget-object p1, p1, Ln03;->b:Lpde;

    if-eqz p1, :cond_200

    iget-object v0, p0, Lx03;->g:Lk9;

    invoke-virtual {p1, v0}, Lekc;->p(Lf7f;)V

    :cond_200
    iput-object v2, p0, Lx03;->e:Ln03;

    return-void

    :pswitch_203
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, Lql2;

    iget-object p1, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_223

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    sget-object p1, Lql2;->j:Landroid/view/animation/DecelerateInterpolator;

    iget-object p1, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget p0, p0, Lql2;->f:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_223

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p0, :cond_223

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_223
    return-void

    :pswitch_224
    iget-object p0, p0, Lz61;->b:Ljava/lang/Object;

    check-cast p0, La71;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-boolean v0, p0, La71;->c:Z

    if-eqz v0, :cond_23b

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, La71;->d:Ly61;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    iput-boolean v1, p0, La71;->c:Z

    :cond_23b
    return-void

    :pswitch_data_23c
    .packed-switch 0x0
        :pswitch_224
        :pswitch_203
        :pswitch_1e4
        :pswitch_1c5
        :pswitch_1ad
        :pswitch_1ac
        :pswitch_19e
        :pswitch_19d
        :pswitch_191
        :pswitch_16c
        :pswitch_15c
        :pswitch_150
        :pswitch_128
        :pswitch_116
        :pswitch_104
        :pswitch_f4
        :pswitch_e4
        :pswitch_d4
        :pswitch_c6
        :pswitch_b1
        :pswitch_9f
        :pswitch_80
        :pswitch_6c
        :pswitch_64
        :pswitch_50
        :pswitch_46
        :pswitch_32
        :pswitch_1c
        :pswitch_12
    .end packed-switch
.end method
