.class Ll/n410$k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410$k;->h(Landroid/media/MediaFormat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410$k;


# direct methods
.method public constructor <init>(Ll/n410$k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$k$a;->a:Ll/n410$k;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n410$k$a;->a:Ll/n410$k;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n410$k;->a:Ll/n410;

    .line 4
    .line 5
    invoke-static {v0}, Ll/n410;->t(Ll/n410;)Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/n410$k$a;->a:Ll/n410$k;

    .line 13
    .line 14
    iget-object v0, v0, Ll/n410$k;->a:Ll/n410;

    .line 15
    .line 16
    invoke-static {v0}, Ll/n410;->t(Ll/n410;)Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/view/SurfaceHolder;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/n410$k$a;->a:Ll/n410$k;

    .line 29
    .line 30
    iget-object v1, v1, Ll/n410$k;->a:Ll/n410;

    .line 31
    .line 32
    invoke-static {v1}, Ll/n410;->u(Ll/n410;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object p0, p0, Ll/n410$k$a;->a:Ll/n410$k;

    .line 37
    .line 38
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 39
    .line 40
    invoke-static {p0}, Ll/n410;->v(Ll/n410;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-interface {v0, v1, p0}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method
