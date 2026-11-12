.class public Lcom/opera/android/account/auth/OperaAuthPortalActivity;
.super Lyij;
.source "SourceFile"

# interfaces
.implements Lm24;


# instance fields
.field public final S:Lpad;

.field public T:I

.field public U:Ltvh;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lyij;-><init>()V

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->S:Lpad;

    const/4 v0, 0x1

    iput v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    return-void
.end method


# virtual methods
.method public final E0(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Lrz4;->E0(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z

    move-result p1

    const/4 p3, 0x1

    if-eqz p1, :cond_8

    return p3

    :cond_8
    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iget p2, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    if-ne p2, p3, :cond_33

    const/4 p2, 0x4

    invoke-static {p1, p2}, Lf03;->J(Landroid/net/Uri;I)Z

    move-result p2

    if-nez p2, :cond_2e

    const/16 p2, 0xb

    invoke-static {p1, p2}, Lf03;->J(Landroid/net/Uri;I)Z

    move-result p2

    if-nez p2, :cond_2e

    const/4 p2, 0x7

    invoke-static {p1, p2}, Lf03;->J(Landroid/net/Uri;I)Z

    move-result p1

    if-eqz p1, :cond_33

    :cond_2e
    iput p3, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    invoke-virtual {p0}, Lfp1;->invalidateOptionsMenu()V

    :cond_33
    const/4 p0, 0x0

    return p0
.end method

.method public final F0()Landroid/net/Uri;
    .registers 3

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const/16 v0, 0xb

    invoke-static {v0}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "service"

    const-string v1, "ofa"

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final G0()Ljava/lang/String;
    .registers 2

    iget v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f140077

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final J0()V
    .registers 1

    return-void
.end method

.method public final L0(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->S:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->S:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public final c0(Ljava/lang/Class;)Lcjm;
    .registers 3

    const-class p0, Lryl;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x0

    goto :goto_10

    :cond_a
    const-class p0, Landroidx/fragment/app/i;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    :goto_10
    new-instance p1, Lcjm;

    const v0, 0x7f0a006f

    invoke-direct {p1, v0, p0}, Lcjm;-><init>(IZ)V

    return-object p1
.end method

.method public final finish()V
    .registers 3

    invoke-super {p0}, Landroid/app/Activity;->finish()V

    const/4 v0, 0x0

    const v1, 0x7f010048

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    invoke-super {p0, p1}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lzhj;)V
    .registers 3

    const v0, 0x7f0a006f

    invoke-virtual {p0, p1, v0}, Ldx3;->X(Lzhj;I)V

    return-void
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d030a

    return p0
.end method

.method public final p0()V
    .registers 4

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "FALLBACK_REQUEST_BUILDER"

    const-class v2, Ltvh;

    invoke-static {v0, v1, v2}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltvh;

    iput-object v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->U:Ltvh;

    if-eqz v0, :cond_15

    const/4 v0, 0x2

    iput v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    :cond_15
    invoke-super {p0}, Lyij;->p0()V

    return-void
.end method

.method public final r0(ILjava/lang/String;)V
    .registers 13

    iget v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->T:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_93

    iget-object v0, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->U:Ltvh;

    if-eqz v0, :cond_93

    iget-object p2, v0, Ltvh;->c:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    iget-object v1, v0, Ltvh;->a:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz p2, :cond_1d

    new-instance p2, Llsc;

    invoke-direct {p2, v1, v3}, Lksc;-><init>(Ljava/lang/String;I)V

    move-object v1, v2

    goto :goto_29

    :cond_1d
    new-instance p2, Llsc;

    const/4 v5, 0x7

    invoke-direct {p2, v1, v5}, Lksc;-><init>(Ljava/lang/String;I)V

    iput-boolean v4, p2, Lksc;->c:Z

    invoke-virtual {v0}, Ltvh;->a()Llj9;

    move-result-object v1

    :goto_29
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iget-object v0, v0, Ltvh;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v3

    :goto_35
    if-ge v7, v6, :cond_4b

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Llyf;

    iget-object v9, v8, Llyf;->a:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v8, v8, Llyf;->b:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    :cond_4b
    if-eqz v1, :cond_59

    sget-object v0, Llj9;->c:Lesd;

    iget-object v0, v0, Lesd;->a:Ljava/lang/String;

    const-string v6, "Content-Type"

    invoke-virtual {v5, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_59
    iput-object v5, p2, Lksc;->f:Ljava/util/HashMap;

    if-eqz v1, :cond_7c

    new-instance v0, Ld04;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    :try_start_62
    invoke-virtual {v1, v0, v3}, Llj9;->a(Lu04;Z)J
    :try_end_65
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_65} :catch_65

    :catch_65
    invoke-virtual {v0}, Ld04;->G()Lg54;

    move-result-object v0

    invoke-virtual {v0}, Lg54;->v()[B

    move-result-object v0

    invoke-static {v0}, LJ/N;->MugoAW_d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    new-instance v1, Lorg/chromium/content_public/common/ResourceRequestBody;

    invoke-direct {v1, v0}, Lorg/chromium/content_public/common/ResourceRequestBody;-><init>([B)V

    iput-object v1, p2, Lksc;->i:Lorg/chromium/content_public/common/ResourceRequestBody;

    iput-boolean v4, p2, Lksc;->c:Z

    :cond_7c
    iput-object v2, p0, Lcom/opera/android/account/auth/OperaAuthPortalActivity;->U:Ltvh;

    if-eqz p1, :cond_85

    if-ne p1, v4, :cond_87

    iput-boolean v3, p2, Lksc;->k:Z

    goto :goto_87

    :cond_85
    iput-boolean v4, p2, Lksc;->k:Z

    :cond_87
    :goto_87
    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, p2}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    return-void

    :cond_93
    invoke-super {p0, p1, p2}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    return-void
.end method
