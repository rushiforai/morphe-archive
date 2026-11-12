.class public final Laue;
.super Lxte;
.source "SourceFile"


# instance fields
.field public final b:Luqe;

.field public final synthetic c:Lbue;


# direct methods
.method public constructor <init>(Lbue;Luqe;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laue;->c:Lbue;

    iput-object p2, p0, Laue;->b:Luqe;

    invoke-virtual {p0}, Laue;->d()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lnre;

    iget-object p0, p0, Laue;->c:Lbue;

    iget-object v0, p0, Lbue;->f:Lvzk;

    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lbue;->a:Ljava/lang/String;

    iget-object v1, p1, Lnre;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, p1, Lnre;->c:Ll0c;

    if-eqz v0, :cond_20

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lbue;->b(Ll0c;Z)V

    return-void

    :cond_20
    const/4 v0, 0x0

    iget-object p1, p1, Lnre;->d:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lbue;->c(Ll0c;Ljava/util/List;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Laue;->b:Luqe;

    invoke-virtual {v0, p0}, Luqe;->g(Lq8j;)V

    return-void
.end method
