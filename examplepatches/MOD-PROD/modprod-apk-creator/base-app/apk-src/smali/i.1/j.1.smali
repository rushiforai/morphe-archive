.class public final Li/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Li/h;

.field public final synthetic b:Li/l;


# direct methods
.method public constructor <init>(Li/l;Li/h;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li/j;->b:Li/l;

    iput-object p2, p0, Li/j;->a:Li/h;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Li/j;->b:Li/l;

    iget-object v1, v0, Li/l;->c:Lh/n;

    if-eqz v1, :cond_0

    iget-object v2, v1, Lh/n;->e:Lh/l;

    if-eqz v2, :cond_0

    invoke-interface {v2, v1}, Lh/l;->g(Lh/n;)V

    :cond_0
    iget-object v1, v0, Li/l;->h:Lh/B;

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Li/j;->a:Li/h;

    invoke-virtual {v1}, Lh/x;->b()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, v1, Lh/x;->e:Landroid/view/View;

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2, v2}, Lh/x;->d(IIZZ)V

    :goto_0
    iput-object v1, v0, Li/l;->s:Li/h;

    :cond_3
    :goto_1
    const/4 v1, 0x0

    iput-object v1, v0, Li/l;->u:Li/j;

    return-void
.end method
