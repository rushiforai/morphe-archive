.class public final Lqjn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lxkn;

.field public final b:Lagm;

.field public final c:Lo2c;

.field public final d:Ljava/util/ArrayList;

.field public final e:Ljava/util/ArrayList;

.field public final f:Lpjn;

.field public g:Landroid/graphics/Bitmap;

.field public h:Ldnn;

.field public i:Z

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqjn;->d:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqjn;->e:Ljava/util/ArrayList;

    new-instance v0, Lpjn;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpjn;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lqjn;->f:Lpjn;

    iput-object p2, p0, Lqjn;->a:Lxkn;

    iput-object p1, p0, Lqjn;->b:Lagm;

    iput-object p4, p0, Lqjn;->c:Lo2c;

    invoke-virtual {p0, p3}, Lqjn;->c(Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Context;)Llkn;
    .registers 11

    iget-object v0, p0, Lqjn;->a:Lxkn;

    iget-object v0, v0, Lxkn;->b:Laln;

    invoke-interface {v0}, Laln;->d()Lzkn;

    move-result-object v1

    iget-object v5, p0, Lqjn;->g:Landroid/graphics/Bitmap;

    new-instance v7, Ly1n;

    const/16 v0, 0x14

    invoke-direct {v7, p0, v0}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iget-object v3, p0, Lqjn;->a:Lxkn;

    iget-object v4, p0, Lqjn;->c:Lo2c;

    move v6, p1

    move-object v2, p2

    invoke-interface/range {v1 .. v7}, Lzkn;->d(Landroid/content/Context;Lxkn;Lo2c;Landroid/graphics/Bitmap;ILy1n;)Llkn;

    move-result-object p1

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lqjn;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lqjn;->a:Lxkn;

    iget-object v0, v0, Lxkn;->c:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object p0, p0, Lqjn;->g:Landroid/graphics/Bitmap;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    const/4 p0, 0x1

    return p0
.end method

.method public final c(Lcom/opera/api/Callback;)V
    .registers 7

    iget-object v0, p0, Lqjn;->h:Ldnn;

    instance-of v1, v0, Lcnn;

    if-eqz v1, :cond_a

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_a
    iget-object v0, p0, Lqjn;->a:Lxkn;

    iget-object v1, v0, Lxkn;->c:Ljava/lang/String;

    if-nez v1, :cond_1b

    new-instance v0, Lcnn;

    invoke-direct {v0, p0}, Lcnn;-><init>(Lqjn;)V

    iput-object v0, p0, Lqjn;->h:Ldnn;

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_1b
    iget-object v1, p0, Lqjn;->e:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x1

    if-le p1, v1, :cond_28

    return-void

    :cond_28
    iget-object p1, v0, Lxkn;->c:Ljava/lang/String;

    iget-object v0, p0, Lqjn;->b:Lagm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_40

    const-string v1, "android.resource"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    :cond_40
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_52

    :cond_45
    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lagm;->b:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    :goto_52
    iget-object v1, p0, Lqjn;->c:Lo2c;

    iget-boolean v2, v1, Lo2c;->c:Z

    iget v3, v1, Lo2c;->b:I

    iget v1, v1, Lo2c;->a:I

    iget-object p0, p0, Lqjn;->f:Lpjn;

    if-eqz v2, :cond_84

    sget-object v2, Lyne;->b:Ldeg;

    invoke-virtual {v2, p1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p1

    iget-object v2, p1, Ldwh;->b:Lgvh;

    sget-object v4, Ljkn;->b:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v4}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    invoke-virtual {v2, v1, v3}, Lgvh;->b(II)V

    invoke-virtual {p1}, Ldwh;->a()V

    invoke-virtual {p1}, Ldwh;->j()V

    iget-object v0, v0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lnb9;

    invoke-virtual {v2, v0}, Lgvh;->c(Le2m;)V

    new-instance v0, Lfnn;

    invoke-direct {v0, p0}, Lfnn;-><init>(Lpjn;)V

    invoke-virtual {p1, v0}, Ldwh;->f(Lacl;)V

    return-void

    :cond_84
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    sget-object v2, Lyne;->b:Ldeg;

    new-instance v3, Ltt2;

    const/4 v4, 0x6

    invoke-direct {v3, v0, v1, v4}, Ltt2;-><init>(Ljava/lang/Object;IB)V

    new-instance v0, Lfnn;

    invoke-direct {v0, p0}, Lfnn;-><init>(Lpjn;)V

    sget-object p0, Lfsc;->a:Ljava/util/Set;

    new-instance p0, Lcsc;

    invoke-direct {p0, v2, p1, v3, v0}, Lcsc;-><init>(Ldeg;Landroid/net/Uri;Ltt2;Lfnn;)V

    return-void
.end method

.method public final d()V
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lqjn;->d:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :cond_c
    :goto_c
    if-ge v3, v2, :cond_36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llkn;

    if-nez v5, :cond_22

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_22
    iget-object v4, p0, Lqjn;->g:Landroid/graphics/Bitmap;

    iget-object v6, v5, Llkn;->d:Landroid/graphics/Bitmap;

    if-eq v4, v6, :cond_c

    iput-object v4, v5, Llkn;->d:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    iput-object v4, v5, Llkn;->g:Landroid/graphics/BitmapShader;

    iget-object v6, v5, Llkn;->b:Landroid/graphics/Paint;

    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    goto :goto_c

    :cond_36
    return-void
.end method
