.class public final Lp3k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt43;


# static fields
.field public static final j:Ljava/util/Set;


# instance fields
.field public final a:Lcom/opera/android/bar/ExtraSideActionsAppbar;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Landroid/view/ViewGroup;

.field public final d:Landroid/view/View;

.field public final e:Lesg;

.field public f:Z

.field public final g:Lvs;

.field public final h:Lvs;

.field public final i:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    invoke-static {}, Lo3k;->values()[Lo3k;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    array-length v2, v0

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v2, :cond_22

    aget-object v4, v0, v3

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_1c
    const-string v0, "duplicate element: "

    invoke-static {v4, v0}, Ls49;->l(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    :cond_22
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lp3k;->j:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/util/Set;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a010a

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/bar/ExtraSideActionsAppbar;

    iput-object p1, p0, Lp3k;->a:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    iput-object p2, p0, Lp3k;->i:Ljava/util/Set;

    const p2, 0x7f0a0106

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    move-object v1, p2

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lp3k;->b:Landroid/view/ViewGroup;

    const p2, 0x7f0a0105

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lp3k;->c:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    const v0, 0x7f0d0063

    invoke-virtual {v6, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0058

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v7, 0x0

    const-string v8, "Missing required view with ID: "

    if-eqz v2, :cond_146

    const v0, 0x7f0a013d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v3, :cond_146

    const v0, 0x7f0a04ce

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v4, :cond_146

    new-instance v0, Lvs;

    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lp3k;->g:Lvs;

    if-eqz p2, :cond_140

    const v0, 0x7f0d0062

    invoke-virtual {v6, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0061

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v4, :cond_12f

    const v0, 0x7f0a0b30

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/custom_views/TabCountButton;

    if-eqz v5, :cond_12f

    const v0, 0x7f0a0bbc

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v6, :cond_12f

    new-instance v2, Lvs;

    const/4 v7, 0x1

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, p0, Lp3k;->h:Lvs;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-virtual {p0, p2}, Lp3k;->b(Landroid/content/res/Configuration;)V

    const p2, 0x7f0a0793

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    iput-object p2, p0, Lp3k;->d:Landroid/view/View;

    iput-object p0, p1, Lu43;->c:Lt43;

    invoke-virtual {v1}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_c8

    invoke-virtual {v1}, Landroid/view/View;->isLayoutRequested()Z

    move-result p1

    if-nez p1, :cond_c8

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result p1

    goto :goto_cf

    :cond_c8
    invoke-virtual {v1, v0, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    :goto_cf
    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_e8

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v4

    if-eq v4, p1, :cond_e8

    invoke-virtual {v2, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_e8
    invoke-virtual {v3}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_f9

    invoke-virtual {v3}, Landroid/view/View;->isLayoutRequested()Z

    move-result p1

    if-nez p1, :cond_f9

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result p1

    goto :goto_100

    :cond_f9
    invoke-virtual {v3, v0, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    :goto_100
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_117

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v3

    if-eq v3, p1, :cond_117

    invoke-virtual {v2, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_117
    new-instance p1, Lesg;

    new-instance v1, Lmcj;

    new-instance v2, Ln3k;

    invoke-direct {v2, p0, v0}, Ln3k;-><init>(Lp3k;B)V

    new-instance v0, Ln3k;

    const/4 v3, 0x1

    invoke-direct {v0, p0, v3}, Ln3k;-><init>(Lp3k;B)V

    invoke-direct {v1, v2, v0}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p1, p2, v1}, Lesg;-><init>(Landroid/view/View;Lybf;)V

    iput-object p1, p0, Lp3k;->e:Lesg;

    return-void

    :cond_12f
    move-object v3, p2

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v7

    :cond_140
    const-string p0, "parent"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v7

    :cond_146
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v7
.end method

.method public static a(Landroid/view/View;Z)V
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    goto :goto_6

    :cond_4
    const/16 p1, 0x8

    :goto_6
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/res/Configuration;)V
    .registers 8

    iget p1, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v0, 0x258

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lt p1, v0, :cond_a

    move p1, v2

    goto :goto_b

    :cond_a
    move p1, v1

    :goto_b
    xor-int/lit8 v0, p1, 0x1

    iget-boolean v3, p0, Lp3k;->f:Z

    if-ne v0, v3, :cond_12

    return-void

    :cond_12
    iput-boolean v0, p0, Lp3k;->f:Z

    iget-object v0, p0, Lp3k;->g:Lvs;

    iget-object v3, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v4, p0, Lp3k;->i:Ljava/util/Set;

    if-eqz p1, :cond_28

    sget-object v5, Lo3k;->a:Lo3k;

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28

    move v5, v2

    goto :goto_29

    :cond_28
    move v5, v1

    :goto_29
    invoke-static {v3, v5}, Lp3k;->a(Landroid/view/View;Z)V

    iget-object v3, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_3c

    sget-object v5, Lo3k;->b:Lo3k;

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3c

    move v5, v2

    goto :goto_3d

    :cond_3c
    move v5, v1

    :goto_3d
    invoke-static {v3, v5}, Lp3k;->a(Landroid/view/View;Z)V

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_4f

    sget-object p1, Lo3k;->c:Lo3k;

    invoke-interface {v4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    move v1, v2

    :cond_4f
    invoke-static {v0, v1}, Lp3k;->a(Landroid/view/View;Z)V

    iget-object p0, p0, Lp3k;->h:Lvs;

    iget-object p1, p0, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v0, Lo3k;->e:Lo3k;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {p1, v0}, Lp3k;->a(Landroid/view/View;Z)V

    iget-object p1, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v0, Lo3k;->f:Lo3k;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {p1, v0}, Lp3k;->a(Landroid/view/View;Z)V

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/TabCountButton;

    sget-object p1, Lo3k;->d:Lo3k;

    invoke-interface {v4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p0, p1}, Lp3k;->a(Landroid/view/View;Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-virtual {p0, p1}, Lp3k;->b(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lp3k;->e:Lesg;

    invoke-virtual {p0}, Lesg;->G()V

    return-void
.end method
