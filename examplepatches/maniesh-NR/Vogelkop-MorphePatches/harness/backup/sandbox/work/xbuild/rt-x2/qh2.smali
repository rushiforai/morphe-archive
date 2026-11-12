.class public final synthetic Lqh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioRouting$OnRoutingChangedListener;


# instance fields
.field public final synthetic a:Ls9i;


# direct methods
.method public synthetic constructor <init>(Ls9i;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqh2;->a:Ls9i;

    return-void
.end method


# virtual methods
.method public final onRoutingChanged(Landroid/media/AudioRouting;)V
    .registers 5

    iget-object p0, p0, Lqh2;->a:Ls9i;

    iget-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Lqh2;

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-static {}, Lf03;->p()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lxa;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
