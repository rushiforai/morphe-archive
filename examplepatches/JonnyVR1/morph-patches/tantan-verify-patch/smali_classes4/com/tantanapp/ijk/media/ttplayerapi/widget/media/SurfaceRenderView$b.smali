.class public final Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/view/SurfaceHolder;

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/r4m;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;)V
    .locals 1
    .param p1    # Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->g:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->f:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->b:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->c:I

    .line 7
    .line 8
    iput p3, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->d:I

    .line 9
    .line 10
    iput p4, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->e:I

    .line 11
    .line 12
    new-instance p1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->f:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 23
    .line 24
    invoke-direct {p1, v0, v1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;Landroid/view/SurfaceHolder;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->g:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/r4m;

    .line 48
    .line 49
    invoke-interface {v0, p1, p2, p3, p4}, Ll/r4m;->b(Ll/s4m;III)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->b:Z

    .line 5
    .line 6
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->c:I

    .line 7
    .line 8
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->d:I

    .line 9
    .line 10
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->e:I

    .line 11
    .line 12
    new-instance v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->f:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;Landroid/view/SurfaceHolder;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->g:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/r4m;

    .line 48
    .line 49
    invoke-interface {v1, v0, p1, p1}, Ll/r4m;->a(Ll/s4m;II)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->b:Z

    .line 6
    .line 7
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->c:I

    .line 8
    .line 9
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->d:I

    .line 10
    .line 11
    iput p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->e:I

    .line 12
    .line 13
    new-instance p1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->f:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->a:Landroid/view/SurfaceHolder;

    .line 24
    .line 25
    invoke-direct {p1, v0, v1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;Landroid/view/SurfaceHolder;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;->g:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/r4m;

    .line 49
    .line 50
    invoke-interface {v0, p1}, Ll/r4m;->c(Ll/s4m;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-void
.end method
