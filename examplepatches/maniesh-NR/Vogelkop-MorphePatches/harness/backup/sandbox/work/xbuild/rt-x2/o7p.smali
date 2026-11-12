.class public final Lo7p;
.super Lpxo;
.source "SourceFile"


# instance fields
.field public k:Liko;

.field public l:Landroid/view/View;

.field public m:Ligi;

.field public n:Lne5;

.field public o:Lny3;

.field public p:Ljkp;

.field public final q:Lm42;

.field public r:Lphe;

.field public final s:Lzyk;

.field public final t:Lbxk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lq5p;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lpxo;-><init>(Landroid/content/Context;Lr22;)V

    new-instance p1, Lm42;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lm42;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lo7p;->q:Lm42;

    sget-object p1, Lphe;->a:Ls16;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lphe;->b:Lphe;

    iput-object p1, p0, Lo7p;->r:Lphe;

    new-instance p1, Lqqo;

    const/16 p2, 0xd

    invoke-direct {p1, p0, p2}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lo7p;->s:Lzyk;

    new-instance p1, Lbxk;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p2}, Lbxk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lo7p;->t:Lbxk;

    return-void
.end method

.method public static final synthetic g(Lo7p;)V
    .registers 1

    invoke-super {p0}, Lpxo;->a()V

    return-void
.end method


# virtual methods
.method public final b(Lvoo;)V
    .registers 11

    move-object v2, p1

    check-cast v2, Ly2p;

    iget-object p1, v2, Ly2p;->z:Lc4p;

    iget-object p1, p1, Lc4p;->i:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 v6, 0x0

    if-eqz p1, :cond_16

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_21

    :cond_16
    iget-object p1, p0, Lpxo;->i:Lp7p;

    if-eqz p1, :cond_21

    sget-object v0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v0, 0x2332

    invoke-virtual {p1, v0, v6}, Lp7p;->g(ILjava/lang/String;)V

    :cond_21
    iget-object p1, v2, Ly2p;->z:Lc4p;

    iget-object p1, p1, Lc4p;->n:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_33

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3e

    :cond_33
    iget-object p1, p0, Lpxo;->i:Lp7p;

    if-eqz p1, :cond_3e

    sget-object v0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v0, 0x2333

    invoke-virtual {p1, v0, v6}, Lp7p;->g(ILjava/lang/String;)V

    :cond_3e
    new-instance p1, Lgqo;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v2, v0}, Lgqo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v2, Ly2p;->F:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lylp;

    if-eqz v0, :cond_6a

    new-instance v1, Lagm;

    iget-object v3, p0, Lpxo;->b:Lr22;

    iget-object v3, v3, Lr22;->c:Ljava/lang/Object;

    check-cast v3, Lwjh;

    iget-object v4, p0, Lpxo;->i:Lp7p;

    const/16 v5, 0xb

    iget-object v7, p0, Lpxo;->a:Landroid/content/Context;

    invoke-direct {v1, v7, v3, v4, v5}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Ln6p;

    invoke-direct {v3, p1, p0}, Ln6p;-><init>(Lgqo;Lo7p;)V

    invoke-virtual {v1, v0, v3}, Lagm;->g(Lylp;Ln1p;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_6b

    :cond_6a
    move-object v0, v6

    :goto_6b
    const/16 v7, 0xe

    const/4 v8, 0x0

    if-nez v0, :cond_c8

    new-instance v3, Ldcl;

    iget-object v0, p0, Lpxo;->i:Lp7p;

    invoke-direct {v3, v0}, Ldcl;-><init>(Ljava/lang/Object;)V

    new-instance v1, Ln6p;

    invoke-direct {v1, p0, p1}, Ln6p;-><init>(Lo7p;Lgqo;)V

    iget-object p1, v2, Ly2p;->D:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lsro;

    if-nez v4, :cond_a7

    const/16 p1, 0x232e

    if-eqz v0, :cond_90

    sget-object v3, Lp7p;->c:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1, v6}, Lp7p;->g(ILjava/lang/String;)V

    :cond_90
    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lvjo;

    const-string v3, "Mandatory asset isn\'t present!"

    invoke-direct {v0, p1, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ln6p;->invoke(Ljava/lang/Object;)V

    goto :goto_c8

    :cond_a7
    iget-object p1, v4, Lyjo;->c:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_b2

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    :cond_b2
    new-instance v0, Lgep;

    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Lgep;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Ll5b;

    invoke-direct {p1, v7, v8}, Ll5b;-><init>(BZ)V

    sget-object v1, Ll1p;->a:Lsa7;

    iget-object v1, v4, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {v4}, Lyjo;->a()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v3, p1, v6, v0}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    :cond_c8
    :goto_c8
    iget-object p1, v2, Ly2p;->E:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsro;

    if-eqz p1, :cond_f3

    iget-object v0, p1, Lyjo;->c:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_dd

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_dd
    new-instance v0, Lgqo;

    const/4 v1, 0x2

    invoke-direct {v0, p1, p0, v1}, Lgqo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Ll5b;

    invoke-direct {p0, v7, v8}, Ll5b;-><init>(BZ)V

    sget-object v1, Ll1p;->a:Lsa7;

    iget-object v1, p1, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {p1}, Lyjo;->a()Ljava/io/File;

    move-result-object p1

    invoke-static {v1, p1, p0, v6, v0}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    :cond_f3
    return-void
.end method

.method public final f(Landroid/view/View;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lpxo;->f:Landroid/view/ViewGroup;

    if-ne p1, v0, :cond_7

    const-string p0, "root"

    return-object p0

    :cond_7
    instance-of v0, p1, Lkko;

    if-nez v0, :cond_72

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Lkko;

    if-nez v0, :cond_72

    iget-object p0, p0, Lo7p;->m:Ligi;

    if-eqz p0, :cond_6c

    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lksd;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    const-string p0, "media"

    goto :goto_69

    :cond_24
    iget-object v0, p0, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    const-string p0, "title"

    goto :goto_69

    :cond_31
    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    const-string p0, "description"

    goto :goto_69

    :cond_3e
    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4b

    const-string p0, "cta"

    goto :goto_69

    :cond_4b
    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    const-string p0, "icon"

    goto :goto_69

    :cond_58
    iget-object p0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_68

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_68

    const-string p0, "extra"

    goto :goto_69

    :cond_68
    const/4 p0, 0x0

    :goto_69
    if-eqz p0, :cond_6c

    return-object p0

    :cond_6c
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    const-string p0, "unknown"

    return-object p0

    :cond_72
    const-string p0, "ac"

    return-object p0
.end method

.method public final h(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    iget-object v0, p0, Lpxo;->e:Lbap;

    iget-boolean v0, v0, Lbap;->e:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->d()V

    iget-object v0, p0, Lpxo;->g:Lsxo;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lsxo;->b()V

    :cond_12
    iget-object v0, p0, Lo7p;->p:Ljkp;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljkp;->a()V

    :cond_19
    iget-object v0, p0, Lpxo;->c:Luuj;

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Luuj;->onAdClicked()V

    :cond_20
    iget-object v0, p0, Lpxo;->d:Lvoo;

    check-cast v0, Ly2p;

    if-eqz v0, :cond_56

    new-instance v1, Lagm;

    iget-object v2, p0, Lpxo;->a:Landroid/content/Context;

    sget-object v3, Lsm;->c:Lsm;

    const/16 v4, 0x9

    invoke-direct {v1, v2, v3, p1, v4}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, v0, Lvoo;->o:Ljava/lang/String;

    iget-object v2, v0, Lvoo;->p:Ljava/lang/String;

    if-eqz p2, :cond_40

    invoke-static {p2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3e

    const/4 p2, 0x0

    :cond_3e
    if-nez p2, :cond_46

    :cond_40
    iget-object p2, v0, Ly2p;->z:Lc4p;

    iget-object p2, p2, Lc4p;->a:La5p;

    iget-object p2, p2, La5p;->a:Ljava/lang/String;

    :cond_46
    iget-object v0, v0, Ly2p;->z:Lc4p;

    iget-object v0, v0, Lc4p;->a:La5p;

    iget-object v0, v0, La5p;->b:Ljava/lang/String;

    new-instance v3, Lh1p;

    invoke-direct {v3, p1, v2, p2, v0}, Lh1p;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lpxo;->i:Lp7p;

    invoke-virtual {v1, v3, p0}, Lagm;->e(Lh1p;Lp7p;)V

    :cond_56
    return-void
.end method

.method public final i(Z)V
    .registers 11

    iget-object v0, p0, Lo7p;->k:Liko;

    if-eqz v0, :cond_15

    iget-object v0, v0, Liko;->a:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_16

    sget p0, Liko;->b:I

    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lkko;

    if-eqz p0, :cond_15

    invoke-static {p0}, Lxgh;->g(Landroid/view/View;)V

    :cond_15
    return-void

    :cond_16
    iget-object p1, p0, Lo7p;->r:Lphe;

    new-instance v1, Lcfn;

    const/4 v7, 0x0

    const/16 v8, 0x14

    const/4 v2, 0x0

    const-class v4, Lo7p;

    const-string v5, "onPrivacyClick"

    const-string v6, "onPrivacyClick()V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    sget p0, Liko;->b:I

    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lkko;

    if-eqz v2, :cond_35

    invoke-static {v2}, Lxgh;->g(Landroid/view/View;)V

    :cond_35
    new-instance v2, Lkko;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v3, v3, Lo7p;->q:Lm42;

    invoke-direct {v2, v4, v3, v1}, Lkko;-><init>(Landroid/content/Context;Lm42;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v2, p0}, Landroid/view/View;->setId(I)V

    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    sget-object v1, Llgo;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v1, p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_6a

    const/4 v1, 0x2

    if-eq p1, v1, :cond_67

    const/4 v1, 0x3

    if-eq p1, v1, :cond_64

    const/4 v1, 0x4

    if-ne p1, v1, :cond_60

    const/16 p1, 0x55

    goto :goto_6c

    :cond_60
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_64
    const/16 p1, 0x53

    goto :goto_6c

    :cond_67
    const/16 p1, 0x35

    goto :goto_6c

    :cond_6a
    const/16 p1, 0x33

    :goto_6c
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f07082b

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final j()Lc4p;
    .registers 1

    iget-object p0, p0, Lpxo;->d:Lvoo;

    check-cast p0, Ly2p;

    if-eqz p0, :cond_9

    iget-object p0, p0, Ly2p;->z:Lc4p;

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final k()V
    .registers 6

    iget-object v0, p0, Lpxo;->e:Lbap;

    instance-of v0, v0, Lu9p;

    if-eqz v0, :cond_3d

    iget-object v0, p0, Lpxo;->d:Lvoo;

    check-cast v0, Ly2p;

    if-eqz v0, :cond_3d

    iget-object v0, v0, Lvoo;->u:Ljava/lang/String;

    if-eqz v0, :cond_3d

    iget-object v1, p0, Lo7p;->p:Ljkp;

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Ljkp;->a()V

    :cond_17
    sget-object v1, Lblp;->a:Ljava/util/Set;

    iget-object v1, p0, Lpxo;->a:Landroid/content/Context;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v1, v0}, Lblp;->c(Landroid/content/Context;Landroid/net/Uri;)Z

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_3d

    iget-object v0, p0, Lp7p;->a:Lvoo;

    new-instance v1, Lnio;

    iget-object v2, v0, Lvoo;->c:Ljava/lang/String;

    iget-object v3, v0, Lvoo;->b:Lpro;

    iget-object v3, v3, Lpro;->a:Ljava/lang/String;

    iget-object v4, v0, Lvoo;->j:Ljava/lang/String;

    iget-object v0, v0, Lvoo;->l:Lfuo;

    invoke-direct {v1, v2, v3, v4, v0}, Lnio;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;)V

    const/4 v0, 0x0

    iget-object p0, p0, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v1, v0, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_3d
    return-void
.end method
