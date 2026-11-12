.class public final Lvcc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lidc;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lndc;

.field public final c:Ltwa;

.field public d:Z


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lndc;Ltwa;)V
    .registers 5

    sget-object v0, Lqcc;->a:Lqcc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvcc;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Lvcc;->b:Lndc;

    iput-object p3, p0, Lvcc;->c:Ltwa;

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    check-cast p1, Lqdc;

    iget-object p1, p1, Lqdc;->i:Lqcc;

    sget-object p3, Lqcc;->b:Lqcc;

    invoke-virtual {p1, p3}, Lqcc;->d(Lqcc;)Z

    move-result p1

    if-eqz p1, :cond_22

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    :cond_22
    return-void
.end method


# virtual methods
.method public final E(Lndc;Locc;)V
    .registers 6

    iget-object p1, p0, Lvcc;->b:Lndc;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p2

    check-cast p2, Lqdc;

    iget-object p2, p2, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->a:Lqcc;

    iget-object v1, p0, Lvcc;->c:Ltwa;

    iget-object v2, p0, Lvcc;->a:Ljava/util/ArrayList;

    if-ne p2, v0, :cond_1d

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :cond_1d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    check-cast p1, Lqdc;

    iget-object p1, p1, Lqdc;->i:Lqcc;

    sget-object p2, Lqcc;->d:Lqcc;

    invoke-virtual {p1, p2}, Lqcc;->d(Lqcc;)Z

    move-result p1

    iget-boolean p2, p0, Lvcc;->d:Z

    if-eq p2, p1, :cond_3e

    iput-boolean p1, p0, Lvcc;->d:Z

    if-eqz p2, :cond_39

    if-nez p1, :cond_3e

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_39
    if-eqz p1, :cond_3e

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3e
    return-void
.end method
