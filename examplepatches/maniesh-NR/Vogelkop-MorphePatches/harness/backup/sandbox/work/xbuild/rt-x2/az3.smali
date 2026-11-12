.class public final Laz3;
.super Liz4;
.source "SourceFile"

# interfaces
.implements Liq9;


# instance fields
.field public final a:Lysl;

.field public final b:Leq9;

.field public final c:Lz4k;

.field public final d:Lbz3;

.field public final e:Ljava/util/HashSet;

.field public final f:Lb7f;

.field public final g:Lwa;

.field public final h:Lh7f;

.field public i:Z


# direct methods
.method public constructor <init>(ZLeq9;Lb7f;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Laz3;->e:Ljava/util/HashSet;

    new-instance v0, Lwa;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lwa;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Laz3;->g:Lwa;

    new-instance v2, Lh7f;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Laz3;->h:Lh7f;

    if-eqz p1, :cond_21

    new-instance v2, Lr16;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    goto :goto_26

    :cond_21
    new-instance v2, Leme;

    invoke-direct {v2, p0}, Leme;-><init>(Ljava/lang/Object;)V

    :goto_26
    iput-object v2, p0, Laz3;->a:Lysl;

    new-instance v2, Lbz3;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v3, Ldtl;

    invoke-direct {v3}, Ldtl;-><init>()V

    iput-object v3, v2, Lbz3;->g:Ljava/lang/Object;

    iput-object v2, p0, Laz3;->d:Lbz3;

    new-instance v2, Lz4k;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lz4k;-><init>(BZ)V

    iput-object v2, p0, Laz3;->c:Lz4k;

    iput-object p2, p0, Laz3;->b:Leq9;

    iput-object p3, p0, Laz3;->f:Lb7f;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3, v0}, Lb7f;->c(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    iget-object p3, p3, Lb7f;->b:Ljava/lang/Object;

    check-cast p3, Ldtl;

    invoke-virtual {p0, p3}, Laz3;->M(Ldtl;)V

    if-eqz p1, :cond_52

    return-void

    :cond_52
    invoke-virtual {p2, p0}, Leq9;->a(Liq9;)V

    return-void
.end method


# virtual methods
.method public final F(ZZ)V
    .registers 8

    const/4 v0, 0x3

    iget-object v1, p0, Laz3;->c:Lz4k;

    const/4 v2, 0x0

    if-eqz p1, :cond_1f

    iget-object p1, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4, v2}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    :cond_1b
    invoke-virtual {p0, v0, v2}, Laz3;->N(IZ)Z

    return-void

    :cond_1f
    if-eqz p2, :cond_22

    const/4 v0, 0x4

    :cond_22
    iget-object p1, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4, v2}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    :cond_37
    invoke-virtual {p0, v0, v2}, Laz3;->N(IZ)Z

    return-void
.end method

.method public final H(Lcom/opera/android/browser/chromium/ChromiumContent;Lqwi;)V
    .registers 3

    iget-object p2, p0, Laz3;->c:Lz4k;

    invoke-virtual {p2, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    const/4 p1, 0x1

    const/4 p2, 0x3

    invoke-virtual {p0, p2, p1}, Laz3;->N(IZ)Z

    return-void
.end method

.method public final M(Ldtl;)V
    .registers 6

    iget-object v0, p0, Laz3;->d:Lbz3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, p1, Ldtl;->a:I

    const/4 v2, 0x0

    if-lez v1, :cond_14

    iget-object v3, v0, Lbz3;->g:Ljava/lang/Object;

    check-cast v3, Ldtl;

    iget v3, v3, Ldtl;->a:I

    if-nez v3, :cond_14

    const/4 v3, 0x1

    goto :goto_15

    :cond_14
    move v3, v2

    :goto_15
    iput-object p1, v0, Lbz3;->g:Ljava/lang/Object;

    if-eqz v3, :cond_1c

    invoke-virtual {v0, v2, v1}, Lbz3;->e(II)V

    :cond_1c
    invoke-virtual {v0}, Lbz3;->f()V

    const/4 p1, 0x3

    invoke-virtual {p0, p1, v2}, Laz3;->N(IZ)Z

    return-void
.end method

.method public final N(IZ)Z
    .registers 10

    iget-object v0, p0, Laz3;->c:Lz4k;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v2

    const-string v3, "operaui"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    xor-int/2addr v2, v3

    iget-boolean v4, v0, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    xor-int/2addr v4, v3

    and-int/2addr v2, v4

    iget-object v4, p0, Laz3;->e:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    and-int/2addr v2, v4

    iget-object v4, p0, Laz3;->b:Leq9;

    invoke-virtual {v4}, Leq9;->c()Z

    move-result v5

    if-nez v5, :cond_3f

    iget-boolean v5, p0, Laz3;->i:Z

    if-eqz v5, :cond_3d

    iget-object v5, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v5, v5, Lnp1;->a:Z

    if-eqz v5, :cond_3f

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->n()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3f

    :cond_3d
    move v5, v1

    goto :goto_40

    :cond_3f
    move v5, v3

    :goto_40
    and-int/2addr v2, v5

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->o()Lnwi;

    move-result-object v5

    sget-object v6, Lnwi;->d:Lnwi;

    if-ne v5, v6, :cond_4b

    move v5, v3

    goto :goto_4c

    :cond_4b
    move v5, v1

    :goto_4c
    xor-int/2addr v5, v3

    and-int/2addr v2, v5

    if-eqz v2, :cond_58

    invoke-virtual {v4}, Leq9;->c()Z

    move-result v2

    if-eqz v2, :cond_59

    const/4 p1, 0x2

    goto :goto_59

    :cond_58
    move p1, v3

    :cond_59
    :goto_59
    const/4 v2, 0x4

    if-eq p1, v2, :cond_60

    if-eq p1, v3, :cond_60

    move v2, v1

    goto :goto_61

    :cond_60
    move v2, v3

    :goto_61
    iget-object v4, p0, Laz3;->d:Lbz3;

    invoke-virtual {v4}, Lbz3;->c()Z

    move-result v4

    if-eq v2, v4, :cond_6a

    move v1, v3

    :cond_6a
    and-int/2addr p2, v1

    invoke-static {v0, p1, p2}, Lz4k;->h(Lcom/opera/android/browser/chromium/ChromiumContent;IZ)V

    iget-object p0, p0, Laz3;->a:Lysl;

    invoke-interface {p0}, Lysl;->q()Z

    move-result p0

    iget-wide p1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_7d

    return v2

    :cond_7d
    invoke-static {p1, p2, p0}, LJ/N;->MmoI4FKZ(JZ)V

    return v2
.end method

.method public final P(Z)V
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Laz3;->c:Lz4k;

    if-eqz p1, :cond_1f

    iget-object p1, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v1, v2, v0}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    :cond_1a
    const/4 p1, 0x3

    invoke-virtual {p0, p1, v0}, Laz3;->N(IZ)Z

    return-void

    :cond_1f
    iget-object p1, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_34

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v1, v2, v0}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    :cond_34
    const/4 p1, 0x4

    invoke-virtual {p0, p1, v0}, Laz3;->N(IZ)Z

    return-void
.end method

.method public final i(Lcom/opera/android/browser/chromium/ChromiumContent;III)V
    .registers 8

    iget-object v0, p0, Laz3;->c:Lz4k;

    invoke-virtual {v0, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p1

    if-eqz p1, :cond_4c

    iget-object p1, p0, Laz3;->d:Lbz3;

    iget-boolean v0, p1, Lbz3;->d:Z

    if-eqz v0, :cond_4c

    iget v0, p1, Lbz3;->a:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p2, v0, :cond_1a

    iget v0, p1, Lbz3;->b:I

    if-ne p3, v0, :cond_1a

    move p2, v2

    goto :goto_1e

    :cond_1a
    invoke-virtual {p1, p2, p3}, Lbz3;->e(II)V

    move p2, v1

    :goto_1e
    iget p3, p1, Lbz3;->c:I

    if-ne p4, p3, :cond_24

    move v1, v2

    goto :goto_29

    :cond_24
    iput p4, p1, Lbz3;->c:I

    invoke-virtual {p1}, Lbz3;->f()V

    :goto_29
    if-nez p2, :cond_2d

    if-eqz v1, :cond_4c

    :cond_2d
    invoke-virtual {p1}, Lbz3;->c()Z

    move-result p1

    if-eqz p1, :cond_4c

    iget-object p0, p0, Laz3;->h:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_39
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_49

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Runnable;

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    goto :goto_39

    :cond_49
    invoke-virtual {p0}, Lh7f;->clear()V

    :cond_4c
    return-void
.end method

.method public final l(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 5

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v0, :cond_19

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p2, :cond_19

    iget-object p2, p0, Laz3;->c:Lz4k;

    invoke-virtual {p2, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x4

    if-eqz p2, :cond_16

    invoke-virtual {p0, v1, v0}, Laz3;->N(IZ)Z

    return-void

    :cond_16
    invoke-static {p1, v1, v0}, Lz4k;->h(Lcom/opera/android/browser/chromium/ChromiumContent;IZ)V

    :cond_19
    return-void
.end method

.method public final n(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-object v0, p0, Laz3;->c:Lz4k;

    invoke-virtual {v0, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1d

    iget-object v0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v0, v0, Lnp1;->a:Z

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->n()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1c

    invoke-virtual {p0, v1, v1}, Laz3;->N(IZ)Z

    :cond_1c
    return-void

    :cond_1d
    const/4 p0, 0x0

    invoke-static {p1, v1, p0}, Lz4k;->h(Lcom/opera/android/browser/chromium/ChromiumContent;IZ)V

    return-void
.end method

.method public final p(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-object v0, p0, Laz3;->c:Lz4k;

    invoke-virtual {v0, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_e

    const/4 p1, 0x1

    invoke-virtual {p0, v1, p1}, Laz3;->N(IZ)Z

    return-void

    :cond_e
    const/4 p0, 0x0

    invoke-static {p1, v1, p0}, Lz4k;->h(Lcom/opera/android/browser/chromium/ChromiumContent;IZ)V

    return-void
.end method

.method public final z(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-object v0, p0, Laz3;->c:Lz4k;

    invoke-virtual {v0, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p1

    if-eqz p1, :cond_12

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-boolean p1, p0, Lbz3;->d:Z

    if-eqz p1, :cond_12

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbz3;->d(Z)V

    :cond_12
    return-void
.end method
