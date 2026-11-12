.class public final Ltm5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lrle;

.field public d:Ljava/util/HashSet;

.field public e:Ljava/util/Set;


# virtual methods
.method public final onConnectionTypeChanged(I)V
    .registers 4

    iget-boolean p1, p0, Ltm5;->a:Z

    invoke-static {}, Lsle;->d()Z

    move-result v0

    iput-boolean v0, p0, Ltm5;->a:Z

    if-eq v0, p1, :cond_27

    new-instance v0, Ljava/util/HashSet;

    iget-object p0, p0, Ltm5;->d:Ljava/util/HashSet;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsm5;

    xor-int/lit8 v1, p1, 0x1

    invoke-interface {v0, v1}, Lsm5;->a(Z)V

    goto :goto_15

    :cond_27
    return-void
.end method
