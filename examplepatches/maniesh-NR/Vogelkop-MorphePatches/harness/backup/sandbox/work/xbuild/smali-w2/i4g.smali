.class public final Li4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmya;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/ref/WeakReference;

.field public final c:I

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lw4g;Lw3g;ILh4g;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Li4g;->a:I

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Li4g;->b:Ljava/lang/ref/WeakReference;

    iget v0, p2, Lw3g;->a:I

    iput v0, p0, Li4g;->c:I

    iget-object v0, p2, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    iput-object v0, p0, Li4g;->d:Ljava/lang/String;

    iget-object v0, p2, Lw3g;->e:Lorg/chromium/url/GURL;

    if-nez v0, :cond_3f

    new-instance v0, Ls2e;

    const/4 v6, 0x0

    const/16 v7, 0x1a

    const/4 v1, 0x1

    const-class v3, Li4g;

    const-string v4, "maybeIcon"

    const-string v5, "maybeIcon(Lcom/opera/android/siteicons/MaybeSiteIcon;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v1, v0

    iget-object v0, p1, Lw4g;->a:Lvnj;

    invoke-static {p2}, Lw4g;->a(Lw3g;)Lknj;

    move-result-object v3

    invoke-virtual {v0, v3, v1}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    move-result-object v0

    if-nez v0, :cond_3b

    invoke-interface {p4}, Lh4g;->s()V

    return-void

    :cond_3b
    invoke-virtual {p0, p4, v0}, Li4g;->a(Lh4g;Lifd;)V

    return-void

    :cond_3f
    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v2, p3

    move-object v5, p0

    move v1, p3

    invoke-static/range {v0 .. v5}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    return-void
.end method


# virtual methods
.method public final a(Lh4g;Lifd;)V
    .registers 9

    sget-object v0, Lnnj;->a:Lnnj;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {p1}, Lh4g;->s()V

    return-void

    :cond_c
    instance-of p1, p2, Ltnj;

    if-eqz p1, :cond_22

    check-cast p2, Ltnj;

    iget-object p1, p2, Ltnj;->a:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget v1, p0, Li4g;->a:I

    move v2, v1

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    return-void

    :cond_22
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 4

    iget-object p2, p0, Li4g;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lh4g;

    if-eqz p2, :cond_18

    iget v0, p0, Li4g;->c:I

    iget-object p0, p0, Li4g;->d:Ljava/lang/String;

    invoke-interface {p2, v0, p0}, Lh4g;->P(ILjava/lang/String;)Z

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_18

    invoke-interface {p2, p1}, Lh4g;->w(Landroid/graphics/Bitmap;)V

    :cond_18
    return-void
.end method

.method public final u(I)V
    .registers 3

    iget-object p1, p0, Li4g;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh4g;

    if-eqz p1, :cond_18

    iget v0, p0, Li4g;->c:I

    iget-object p0, p0, Li4g;->d:Ljava/lang/String;

    invoke-interface {p1, v0, p0}, Lh4g;->P(ILjava/lang/String;)Z

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_18

    invoke-interface {p1}, Lh4g;->s()V

    :cond_18
    return-void
.end method
