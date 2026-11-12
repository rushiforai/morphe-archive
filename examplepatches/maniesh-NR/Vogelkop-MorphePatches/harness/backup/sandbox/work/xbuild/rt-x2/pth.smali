.class public final Lpth;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;


# instance fields
.field public final synthetic a:Lqth;


# direct methods
.method public constructor <init>(Lqth;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpth;->a:Lqth;

    return-void
.end method


# virtual methods
.method public final onConnectionTypeChanged(I)V
    .registers 5

    const/4 v0, 0x6

    if-eq p1, v0, :cond_5

    const/4 p1, 0x1

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    :goto_6
    iget-object p0, p0, Lpth;->a:Lqth;

    iget-object p0, p0, Lqth;->a:Lh7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_3d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loth;

    if-eqz p1, :cond_39

    iget-object v1, p0, Loth;->a:Lmth;

    check-cast v1, Lqth;

    iget-object v2, v1, Lqth;->a:Lh7f;

    invoke-virtual {v2, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Lh7f;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v1, v1, Lqth;->b:Lpth;

    invoke-static {v1}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    :cond_31
    iget-object v1, p0, Loth;->b:Lkt5;

    iget-object p0, p0, Loth;->c:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lkt5;->c(Ljava/lang/String;)V

    goto :goto_f

    :cond_39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_f

    :cond_3d
    return-void
.end method
