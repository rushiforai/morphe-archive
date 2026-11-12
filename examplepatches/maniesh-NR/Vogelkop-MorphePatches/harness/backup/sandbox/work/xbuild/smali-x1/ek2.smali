.class public final Lek2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lneb;


# instance fields
.field public final a:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final b:Lorg/chromium/content_public/browser/WebContents;

.field public final c:Ljava/util/ArrayDeque;

.field public final d:Ljava/util/HashSet;

.field public e:Lsz8;

.field public f:Z

.field public final g:Lorg/chromium/url/Origin;

.field public h:Ln61;

.field public i:Ln61;


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/RenderFrameHost;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lek2;->c:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lek2;->d:Ljava/util/HashSet;

    iput-object p1, p0, Lek2;->a:Lorg/chromium/content_public/browser/RenderFrameHost;

    invoke-interface {p1}, Lorg/chromium/content_public/browser/RenderFrameHost;->d()Lorg/chromium/url/Origin;

    move-result-object v0

    iput-object v0, p0, Lek2;->g:Lorg/chromium/url/Origin;

    check-cast p1, Lorg/chromium/content/browser/framehost/RenderFrameHostImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/framehost/RenderFrameHostImpl;->b:Lorg/chromium/content/browser/framehost/RenderFrameHostDelegate;

    if-eqz p1, :cond_26

    instance-of v0, p1, Lorg/chromium/content_public/browser/WebContents;

    if-eqz v0, :cond_26

    check-cast p1, Lorg/chromium/content_public/browser/WebContents;

    goto :goto_27

    :cond_26
    const/4 p1, 0x0

    :goto_27
    iput-object p1, p0, Lek2;->b:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public static m(Lak2;Z)Lysn;
    .registers 4

    new-instance v0, Lysn;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Luik;-><init>(I)V

    iget-object p0, p0, Lak2;->a:Ljava/lang/String;

    iput-object p0, v0, Lysn;->b:Ljava/lang/String;

    iput-boolean p1, v0, Lysn;->c:Z

    return-object v0
.end method

.method public static p(ILrw9;)Ldx9;
    .registers 5

    new-instance v0, Ldx9;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldx9;-><init>(B)V

    new-instance v1, Lsw9;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Luik;-><init>(I)V

    iput-object p1, v1, Lsw9;->c:Lrw9;

    iput p0, v1, Lsw9;->b:I

    const/4 p0, 0x0

    iput-byte p0, v0, Lslm;->a:B

    iput-object v1, v0, Ldx9;->c:Luik;

    return-object v0
.end method

.method public static q(Ldx3;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_18

    const-string v1, "com.google.android.gms"

    const-wide/16 v2, 0x0

    invoke-static {p0, v1, v2, v3}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    if-nez p0, :cond_f

    move p0, v0

    goto :goto_11

    :cond_f
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    :goto_11
    const v1, 0x101b890

    if-lt p0, v1, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    return v0
.end method


# virtual methods
.method public final close()V
    .registers 3

    new-instance v0, Lqg2;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lqg2;-><init>(B)V

    iget-object v1, p0, Lek2;->d:Ljava/util/HashSet;

    invoke-interface {v1, v0}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lek2;->f:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lek2;->h:Ln61;

    iput-object v0, p0, Lek2;->i:Ln61;

    iput-object v0, p0, Lek2;->e:Lsz8;

    return-void
.end method

.method public final h(Lk8e;)V
    .registers 2

    invoke-virtual {p0}, Lek2;->close()V

    return-void
.end method

.method public final k()V
    .registers 8

    iget-boolean v0, p0, Lek2;->f:Z

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lek2;->i:Ln61;

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lek2;->e:Lsz8;

    iget v1, v0, Lsz8;->b:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0xd

    const/4 v4, 0x1

    const/4 v5, 0x5

    if-eq v1, v4, :cond_31

    const/4 v6, 0x2

    if-eq v1, v6, :cond_20

    const/4 p0, 0x3

    if-ne v1, p0, :cond_3c

    iput v5, v0, Lsz8;->b:I

    return-void

    :cond_20
    iget-object p0, p0, Lek2;->a:Lorg/chromium/content_public/browser/RenderFrameHost;

    invoke-virtual {v0, p0}, Lsz8;->b(Lorg/chromium/content_public/browser/RenderFrameHost;)V

    iput v4, v0, Lsz8;->b:I

    iget-object p0, v0, Lsz8;->c:Lek2;

    if-eqz p0, :cond_3c

    invoke-virtual {p0, v3}, Lek2;->s(I)V

    iput-object v2, v0, Lsz8;->c:Lek2;

    return-void

    :cond_31
    iput v5, v0, Lsz8;->b:I

    iget-object p0, v0, Lsz8;->c:Lek2;

    if-eqz p0, :cond_3c

    invoke-virtual {p0, v3}, Lek2;->s(I)V

    iput-object v2, v0, Lsz8;->c:Lek2;

    :cond_3c
    return-void
.end method

.method public final l()Lsz8;
    .registers 4

    new-instance v0, Lsz8;

    new-instance v1, Lbk2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lbk2;-><init>(Lek2;B)V

    invoke-direct {v0, v1}, Lsz8;-><init>(Lbk2;)V

    iget-object p0, p0, Lek2;->d:Ljava/util/HashSet;

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final n(Ln61;)V
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lak2;->b:Lak2;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lek2;->b:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v1}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v1

    invoke-static {v1}, Lek2;->q(Ldx3;)Z

    move-result v2

    sget-object v3, Lak2;->c:Lak2;

    invoke-static {v3, v2}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Lak2;->d:Lak2;

    invoke-static {v3, v2}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez v2, :cond_4c

    sget-object p0, Lak2;->f:Lak2;

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object p0, Lak2;->e:Lak2;

    invoke-static {p0, v1}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-array p0, v1, [Lysn;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lysn;

    invoke-virtual {p1, p0}, Ln61;->k([Lysn;)V

    return-void

    :cond_4c
    new-instance v2, Ldk2;

    invoke-direct {v2, v0, p1}, Ldk2;-><init>(Ljava/util/ArrayList;Ln61;)V

    iget-object p1, p0, Lek2;->c:Ljava/util/ArrayDeque;

    invoke-virtual {p1, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lek2;->l()Lsz8;

    invoke-static {v1, p0}, Lsz8;->h(Ldx3;Lek2;)V

    return-void
.end method

.method public final o(Lcx9;Ln61;)V
    .registers 13

    iget-boolean v0, p0, Lek2;->f:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_e

    invoke-static {v2, v1}, Lek2;->p(ILrw9;)Ldx9;

    move-result-object p0

    invoke-virtual {p2, p0}, Ln61;->d(Ldx9;)V

    return-void

    :cond_e
    iput-object p2, p0, Lek2;->i:Ln61;

    iput-boolean v2, p0, Lek2;->f:Z

    iget-object p2, p0, Lek2;->b:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p2}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v6

    invoke-static {v6}, Lek2;->q(Ldx3;)Z

    move-result p2

    if-eqz p2, :cond_77

    iget-object p2, p1, Lcx9;->c:Lb9h;

    if-eqz p2, :cond_77

    invoke-virtual {p0}, Lek2;->l()Lsz8;

    move-result-object v3

    iput-object v3, p0, Lek2;->e:Lsz8;

    iget-object v5, p1, Lcx9;->c:Lb9h;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x22

    iget-object v9, p0, Lek2;->a:Lorg/chromium/content_public/browser/RenderFrameHost;

    iget-object v7, p0, Lek2;->g:Lorg/chromium/url/Origin;

    if-lt p2, v0, :cond_4b

    invoke-virtual {v6}, Ldx3;->R()Ltz8;

    move-result-object p2

    invoke-virtual {p2}, Ltz8;->R()Landroid/credentials/CredentialManager;

    move-result-object p2

    if-eqz p2, :cond_4b

    iget-object p2, v5, Lb9h;->d:Ljava/lang/String;

    new-instance v2, Lnz8;

    move-object v4, p0

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lnz8;-><init>(Lsz8;Lek2;Lb9h;Ldx3;Lorg/chromium/url/Origin;Lcx9;)V

    invoke-interface {v9, p2, v7, v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->e(Ljava/lang/String;Lorg/chromium/url/Origin;Lorg/chromium/base/Callback;)V

    return-void

    :cond_4b
    move-object v4, p0

    move-object v8, v9

    move-object v9, v7

    move-object v7, v6

    move-object v6, p1

    invoke-virtual {v7}, Ldx3;->R()Ltz8;

    move-result-object p0

    iget-object p1, p0, Ltz8;->a:Landroid/app/Activity;

    if-eqz p1, :cond_62

    iget-object v1, p0, Ltz8;->b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    if-nez v1, :cond_62

    invoke-static {p1}, Lcom/google/android/gms/fido/Fido;->getFido2PrivilegedApiClient(Landroid/app/Activity;)Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    move-result-object v1

    iput-object v1, p0, Ltz8;->b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    :cond_62
    if-nez v1, :cond_6a

    const/16 p0, 0x20

    invoke-virtual {v4, p0}, Lek2;->s(I)V

    return-void

    :cond_6a
    iget-object p0, v5, Lb9h;->d:Ljava/lang/String;

    new-instance v2, Loz8;

    move-object v5, v1

    invoke-direct/range {v2 .. v9}, Loz8;-><init>(Lsz8;Lek2;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;)V

    move-object v7, v9

    invoke-interface {v8, p0, v7, v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->e(Ljava/lang/String;Lorg/chromium/url/Origin;Lorg/chromium/base/Callback;)V

    return-void

    :cond_77
    move-object v4, p0

    const/16 p0, 0xb

    invoke-virtual {v4, p0}, Lek2;->s(I)V

    return-void
.end method

.method public final r(Lx8h;Ln61;)V
    .registers 13

    iget-boolean v0, p0, Lek2;->f:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_a

    invoke-virtual {p2, v2, v1, v1}, Ln61;->b(ILz7d;Lzsn;)V

    return-void

    :cond_a
    iput-object p2, p0, Lek2;->h:Ln61;

    iput-boolean v2, p0, Lek2;->f:Z

    iget-object p2, p0, Lek2;->b:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p2}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v6

    invoke-static {v6}, Lek2;->q(Ldx3;)Z

    move-result p2

    if-nez p2, :cond_20

    const/16 p1, 0xb

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void

    :cond_20
    invoke-virtual {p0}, Lek2;->l()Lsz8;

    move-result-object v3

    iput-object v3, p0, Lek2;->e:Lsz8;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x22

    iget-object v9, p0, Lek2;->a:Lorg/chromium/content_public/browser/RenderFrameHost;

    iget-object v7, p0, Lek2;->g:Lorg/chromium/url/Origin;

    if-lt p2, v0, :cond_4b

    invoke-virtual {v6}, Ldx3;->R()Ltz8;

    move-result-object p2

    invoke-virtual {p2}, Ltz8;->R()Landroid/credentials/CredentialManager;

    move-result-object p2

    if-eqz p2, :cond_4b

    iget-object p2, p1, Lx8h;->b:Lc9h;

    iget-object p2, p2, Lc9h;->b:Ljava/lang/String;

    iget-boolean v0, p1, Lx8h;->s:Z

    new-instance v2, Liz8;

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v2 .. v7}, Liz8;-><init>(Lsz8;Lek2;Lx8h;Ldx3;Lorg/chromium/url/Origin;)V

    invoke-interface {v9, p2, v7, v0, v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->a(Ljava/lang/String;Lorg/chromium/url/Origin;ZLorg/chromium/base/Callback;)V

    return-void

    :cond_4b
    move-object v4, p0

    move-object v5, p1

    invoke-virtual {v6}, Ldx3;->R()Ltz8;

    move-result-object p0

    iget-object p1, p0, Ltz8;->a:Landroid/app/Activity;

    if-eqz p1, :cond_5f

    iget-object v1, p0, Ltz8;->b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    if-nez v1, :cond_5f

    invoke-static {p1}, Lcom/google/android/gms/fido/Fido;->getFido2PrivilegedApiClient(Landroid/app/Activity;)Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    move-result-object v1

    iput-object v1, p0, Ltz8;->b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    :cond_5f
    if-nez v1, :cond_67

    const/16 p0, 0x20

    invoke-virtual {v4, p0}, Lek2;->s(I)V

    return-void

    :cond_67
    iget-object p0, v5, Lx8h;->b:Lc9h;

    iget-object p0, p0, Lc9h;->b:Ljava/lang/String;

    iget-boolean p1, v5, Lx8h;->s:Z

    new-instance v2, Lnz8;

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v1

    invoke-direct/range {v2 .. v8}, Lnz8;-><init>(Lsz8;Lek2;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lx8h;Ldx3;Lorg/chromium/url/Origin;)V

    move-object v7, v8

    invoke-interface {v9, p0, v7, p1, v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->a(Ljava/lang/String;Lorg/chromium/url/Origin;ZLorg/chromium/base/Callback;)V

    return-void
.end method

.method public final s(I)V
    .registers 4

    iget-boolean v0, p0, Lek2;->f:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lek2;->h:Ln61;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    invoke-virtual {v0, p1, v1, v1}, Ln61;->b(ILz7d;Lzsn;)V

    goto :goto_19

    :cond_e
    iget-object v0, p0, Lek2;->i:Ln61;

    if-eqz v0, :cond_19

    invoke-static {p1, v1}, Lek2;->p(ILrw9;)Ldx9;

    move-result-object p1

    invoke-virtual {v0, p1}, Ln61;->d(Ldx9;)V

    :cond_19
    :goto_19
    const/4 p1, 0x0

    iput-boolean p1, p0, Lek2;->f:Z

    iput-object v1, p0, Lek2;->h:Ln61;

    iput-object v1, p0, Lek2;->i:Ln61;

    iput-object v1, p0, Lek2;->e:Lsz8;

    return-void
.end method

.method public final t(Lrw9;)V
    .registers 4

    iget-boolean v0, p0, Lek2;->f:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lek2;->i:Ln61;

    const/4 v1, 0x0

    invoke-static {v1, p1}, Lek2;->p(ILrw9;)Ldx9;

    move-result-object p1

    invoke-virtual {v0, p1}, Ln61;->d(Ldx9;)V

    iput-boolean v1, p0, Lek2;->f:Z

    const/4 p1, 0x0

    iput-object p1, p0, Lek2;->h:Ln61;

    iput-object p1, p0, Lek2;->i:Ln61;

    iput-object p1, p0, Lek2;->e:Lsz8;

    return-void
.end method
