.class Lcom/bumptech/glide/manager/n$d$a;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/manager/n$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/bumptech/glide/manager/n$d;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/manager/n$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/manager/n$d$a;->a:Lcom/bumptech/glide/manager/n$d;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private b(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/manager/n$d$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/bumptech/glide/manager/n$d$a$a;-><init>(Lcom/bumptech/glide/manager/n$d$a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/ylk0;->v(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ylk0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/bumptech/glide/manager/n$d$a;->a:Lcom/bumptech/glide/manager/n$d;

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/n$d;->a:Z

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/bumptech/glide/manager/n$d;->a:Z

    .line 9
    .line 10
    if-eq v0, p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/bumptech/glide/manager/n$d;->b:Lcom/bumptech/glide/manager/c$a;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Lcom/bumptech/glide/manager/c$a;->a(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onAvailable(Landroid/net/Network;)V
    .locals 0
    .param p1    # Landroid/net/Network;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Lcom/bumptech/glide/manager/n$d$a;->b(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0
    .param p1    # Landroid/net/Network;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/bumptech/glide/manager/n$d$a;->b(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
