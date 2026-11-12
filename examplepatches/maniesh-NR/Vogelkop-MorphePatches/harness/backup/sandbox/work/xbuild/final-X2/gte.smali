.class public final Lgte;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lt5j;

.field public final b:Lvr9;

.field private c:Lfte;
    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final synthetic d:Li3j;


# direct methods
.method public constructor <init>(Li3j;Ljava/lang/String;Lt5j;Lvr9;)V
    .registers 10

    iget-object v0, p1, Li3j;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    iget-object v1, p3, Lt5j;->c:Ljava/util/ArrayList;

    iget-object v2, p3, Lt5j;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgte;->d:Li3j;

    iput-object p3, p0, Lgte;->a:Lt5j;

    iput-object p4, p0, Lgte;->b:Lvr9;

    iget-object p3, p1, Li3j;->a:Ljava/lang/Object;

    check-cast p3, Lwv1;

    invoke-virtual {p3}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfqe;

    iget-object v4, v3, Lfqe;->i:Ldqe;

    iput-object p2, v4, Ldqe;->a:Ljava/lang/String;

    const/4 p2, 0x1

    iput-boolean p2, v4, Ldqe;->b:Z

    iget-object v3, v3, Lfqe;->c:Luqe;

    if-eqz v3, :cond_2b

    iget-object v3, v3, Luqe;->i:Lg93;

    invoke-virtual {v3}, Lt7j;->c()V

    :cond_2b
    if-nez v2, :cond_37

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-virtual {p4}, Lvr9;->run()V

    return-void

    :cond_37
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    if-eqz v2, :cond_41

    invoke-static {v2}, Ll0c;->a(Ljava/lang/String;)Ll0c;

    move-result-object v2

    goto :goto_42

    :cond_41
    const/4 v2, 0x0

    :goto_42
    if-eqz v2, :cond_51

    invoke-virtual {p3}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfqe;

    invoke-virtual {v3}, Lfqe;->b()Lp1c;

    move-result-object v3

    invoke-virtual {v3, v2}, Lp1c;->g(Ll0c;)V

    :cond_51
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p4}, Lvr9;->run()V

    return-void

    :cond_5e
    iget-object p1, p1, Li3j;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    const-string v3, "enable_newsfeed"

    invoke-virtual {p1, p2, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, p2, :cond_80

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "<existing>"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_80

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p4}, Lvr9;->run()V

    return-void

    :cond_80
    new-instance p1, Lfte;

    invoke-virtual {p3}, Lwv1;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfqe;

    invoke-direct {p1, p0, v2, p2}, Lfte;-><init>(Lgte;Ll0c;Lfqe;)V

    iput-object p1, p0, Lgte;->c:Lfte;

    return-void
.end method
