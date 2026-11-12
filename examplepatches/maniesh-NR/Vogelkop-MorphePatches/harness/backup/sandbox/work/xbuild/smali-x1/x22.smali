.class public abstract Lx22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lk6l;

.field public final c:Ltcc;

.field public final d:Ldll;

.field public final e:Lesk;

.field public final f:Lrvg;

.field public final g:Landroid/view/ViewGroup;

.field public final h:Lwv1;

.field public final i:Ly22;

.field public final j:Lzyk;

.field public final k:Lzyk;

.field public final l:Lmrn;

.field public final m:Lnrl;

.field public n:Lr22;

.field public final o:Li7f;

.field public final p:Ll32;

.field public final q:Lqz;

.field public final r:Ln22;

.field public final s:Lrw0;

.field public final t:Landroid/util/SparseArray;

.field public u:Lsba;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Ltcc;Ldll;Lesk;Lrvg;Lcom/opera/android/Lazy;Landroid/view/ViewGroup;Lwv1;Ly22;Lesk;Lj4c;Lqim;)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx22;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lx22;->b:Lk6l;

    iput-object p3, p0, Lx22;->c:Ltcc;

    iput-object p4, p0, Lx22;->d:Ldll;

    iput-object p5, p0, Lx22;->e:Lesk;

    iput-object p6, p0, Lx22;->f:Lrvg;

    iput-object p8, p0, Lx22;->g:Landroid/view/ViewGroup;

    move-object p1, p9

    iput-object p1, p0, Lx22;->h:Lwv1;

    move-object/from16 p1, p10

    iput-object p1, p0, Lx22;->i:Ly22;

    new-instance p1, Li22;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Li22;-><init>(Lx22;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lx22;->j:Lzyk;

    new-instance p1, Li22;

    const/4 p4, 0x1

    invoke-direct {p1, p0, p4}, Li22;-><init>(Lx22;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lx22;->k:Lzyk;

    new-instance v0, Lmrn;

    new-instance v3, Ltw2;

    const/16 p1, 0x8

    invoke-direct {v3, p0, p1}, Ltw2;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lbi;

    const/16 p1, 0x15

    invoke-direct {v4, p0, p1}, Lbi;-><init>(Ljava/lang/Object;B)V

    move-object v2, p6

    move-object v1, p7

    move-object/from16 v5, p11

    invoke-direct/range {v0 .. v5}, Lmrn;-><init>(Lcom/opera/android/Lazy;Lrvg;Lcrn;Lkrn;Lesk;)V

    iput-object v0, p0, Lx22;->l:Lmrn;

    new-instance p1, Lnrl;

    new-instance v0, Li22;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Li22;-><init>(Lx22;B)V

    new-instance v1, Li22;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v3}, Li22;-><init>(Lx22;B)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p6, p1, Lnrl;->b:Ljava/lang/Object;

    iget-object v3, p6, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast v3, Landroid/widget/FrameLayout;

    new-instance v4, Lz22;

    invoke-direct {v4, v1, p2}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v3, La32;

    invoke-direct {v3, p1, v0, v1, p2}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p8, v3}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    iput-object p1, p0, Lx22;->m:Lnrl;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lx22;->o:Li7f;

    invoke-virtual/range {p12 .. p12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll32;

    iput-object p1, p0, Lx22;->p:Ll32;

    new-instance p1, Lqz;

    invoke-direct {p1, p0, p4}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx22;->q:Lqz;

    new-instance p1, Ln22;

    invoke-direct {p1, p0}, Ln22;-><init>(Lx22;)V

    iput-object p1, p0, Lx22;->r:Ln22;

    new-instance p1, Lrw0;

    invoke-direct {p1, p0, p4}, Lrw0;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx22;->s:Lrw0;

    new-instance p1, Lm22;

    invoke-direct {p1, p0}, Lm22;-><init>(Lx22;)V

    new-instance p4, Landroid/util/SparseArray;

    invoke-direct {p4}, Landroid/util/SparseArray;-><init>()V

    iput-object p4, p0, Lx22;->t:Landroid/util/SparseArray;

    invoke-virtual {p3, p1}, Ltcc;->a(Lmdc;)V

    new-instance p1, Lj22;

    invoke-direct {p1, p0, p2}, Lj22;-><init>(Ljava/lang/Object;B)V

    move-object/from16 p0, p13

    iget-object p0, p0, Lqim;->r:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p6, Lrvg;->p:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    new-instance p1, Lz61;

    invoke-direct {p1}, Lz61;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_c5

    invoke-virtual {p1, p0}, Lz61;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_c5
    invoke-virtual {p0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lbx0;

    iget-object p0, p0, Lx22;->o:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lbx0;

    iget-object p0, p0, Lx22;->o:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public abstract a(Lb2l;Lm02;Lv22;Lu22;Lq2;)Lr22;
.end method

.method public final b(Lb2l;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p0

    if-eqz p0, :cond_33

    new-instance p1, Lk22;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lk22;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p0, p0, Lv22;->h:Lr22;

    if-eqz p0, :cond_32

    invoke-virtual {p0}, Lr22;->h()Ls62;

    move-result-object p0

    if-eqz p0, :cond_32

    iget-object p2, p0, Ls62;->s:Lode;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lu42;

    if-eqz p2, :cond_32

    iget-object p2, p2, Lu42;->c:Lpu4;

    iget-wide v0, p2, Lpu4;->a:J

    invoke-virtual {p0}, Ls62;->c()Lp62;

    move-result-object p2

    new-instance v2, Lq3;

    const/16 v3, 0x12

    invoke-direct {v2, p1, p0, v3}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0, v1, v2}, Lp62;->b(JLkotlin/jvm/functions/Function1;)V

    :cond_32
    return-void

    :cond_33
    sget-object p0, Lt0i;->b:Lp0i;

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lt0i;

    invoke-direct {p0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final c()Lmlj;
    .registers 1

    iget-object p0, p0, Lx22;->j:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmlj;

    return-object p0
.end method

.method public final e(Lb2l;)Lv22;
    .registers 3

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    new-instance v0, Lv22;

    invoke-direct {v0, p0, p1}, Lv22;-><init>(Lx22;Lb2l;)V

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    iget-object p0, p0, Lx22;->t:Landroid/util/SparseArray;

    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0
.end method

.method public final f(Lvsn;Lhsn;)V
    .registers 7

    iget-object v0, p1, Lvsn;->c:Ls62;

    sget-object v1, Lfsn;->a:Lfsn;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Lx22;->a:Lcom/opera/android/BrowserActivity;

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object p1

    invoke-virtual {p1}, Lqyj;->d()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p0}, Lx22;->c()Lmlj;

    move-result-object p0

    invoke-static {v2, p1, p0}, Lz5i;->t0(Landroid/content/Context;Ljava/util/Locale;Lmlj;)V

    return-void

    :cond_1c
    instance-of v1, p2, Lesn;

    const/16 v3, 0x1388

    if-eqz v1, :cond_2e

    invoke-virtual {p0}, Lx22;->c()Lmlj;

    move-result-object p0

    check-cast p2, Lesn;

    iget-object p1, p2, Lesn;->a:Lrxh;

    invoke-virtual {p0, p1, v3}, Lmlj;->a(Lrxh;I)V

    return-void

    :cond_2e
    sget-object v1, Lfsn;->b:Lfsn;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object p0

    invoke-virtual {p0}, Lqyj;->d()Ljava/util/Locale;

    move-result-object p0

    invoke-static {v2, p0}, Lz5i;->u0(Landroid/content/Context;Ljava/util/Locale;)V

    return-void

    :cond_42
    instance-of v0, p2, Lgsn;

    if-eqz v0, :cond_61

    invoke-virtual {p0}, Lx22;->c()Lmlj;

    move-result-object p0

    check-cast p2, Lgsn;

    iget-object p2, p2, Lgsn;->a:Lrxh;

    new-instance v0, Lrxh;

    const v1, 0x7f140ebc

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    new-instance v1, Lpa;

    const/16 v2, 0x1a

    invoke-direct {v1, p1, v2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p2, v3, v0, v1}, Lmlj;->b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    return-void

    :cond_61
    if-nez p2, :cond_64

    return-void

    :cond_64
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final g(Lb2l;)Lv22;
    .registers 2

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    iget-object p0, p0, Lx22;->t:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv22;

    return-object p0
.end method

.method public h(Lr22;)V
    .registers 6

    invoke-virtual {p1}, Lr22;->g()Lvsn;

    move-result-object v0

    iget-object v0, v0, Lvsn;->l:Lkze;

    sget-object v1, Lng;->a:Lng;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lr22;->h()Ls62;

    move-result-object v0

    iget-object v0, v0, Ls62;->t:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p1}, Lr22;->h()Ls62;

    move-result-object v0

    sget-object v1, Lz52;->x:Lz52;

    invoke-virtual {v0, v1}, Ls62;->k(Lz5i;)V

    :cond_26
    invoke-virtual {p1}, Lr22;->g()Lvsn;

    move-result-object v0

    sget-object v1, Lnv0;->d:Lnv0;

    sget-object v2, Lcsn;->a:Lcsn;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lvsn;->e(Lnv0;Ljoh;Lfw0;)V

    invoke-virtual {p1}, Lr22;->l()V

    invoke-virtual {p1}, Lr22;->g()Lvsn;

    move-result-object p1

    iget-object p1, p1, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->f()Lqyj;

    move-result-object p1

    iget-object p1, p1, Lqyj;->i:Lode;

    iget-object p0, p0, Lx22;->l:Lmrn;

    iget-object v0, p0, Lmrn;->z:Lndc;

    if-eqz v0, :cond_7b

    iget-object p0, p0, Lmrn;->u:Lxbf;

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lvbn;

    invoke-interface {v1, v0, p1}, Lvbn;->i(Lndc;Lode;)Z

    move-result v1

    if-nez v1, :cond_7b

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lvbn;

    invoke-interface {v1}, Lvbn;->destroy()V

    new-instance v1, Lplk;

    invoke-direct {v1, p0, v0, p1}, Lplk;-><init>(Lxbf;Lndc;Lode;)V

    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {v1}, Lplk;->j()Lo2g;

    move-result-object p1

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lo2g;

    if-eq p1, v0, :cond_7b

    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Ln2d;->invalidate()V

    iget-object p1, p1, Lo2g;->c:Ljava/lang/Object;

    check-cast p1, Ls75;

    invoke-virtual {p0, p1, v3}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    :cond_7b
    return-void
.end method

.method public final i(Lxrn;)V
    .registers 3

    sget-object v0, Lw22;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1d

    invoke-virtual {p0}, Lx22;->c()Lmlj;

    move-result-object p0

    new-instance p1, Lrxh;

    const v0, 0x7f140cd3

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const/16 v0, 0x9c4

    invoke-virtual {p0, p1, v0}, Lmlj;->a(Lrxh;I)V

    return-void

    :cond_1d
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public j(Ljava/lang/String;)Z
    .registers 2

    invoke-static {p1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public k(Lorg/chromium/url/GURL;)Z
    .registers 2

    invoke-static {p1}, Lz5i;->b0(Lorg/chromium/url/GURL;)Z

    move-result p0

    return p0
.end method
