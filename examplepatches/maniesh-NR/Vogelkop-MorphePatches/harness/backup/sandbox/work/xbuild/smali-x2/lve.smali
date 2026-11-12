.class public final Llve;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lp12;


# direct methods
.method public constructor <init>(Lp12;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llve;->a:Lp12;

    return-void
.end method


# virtual methods
.method public a(Lvre;)V
    .registers 4
    .param p1    # Lvre;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Llve;->a:Lp12;

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Loqe;

    check-cast v0, Lmsh;

    if-eqz v0, :cond_23

    iget-object v1, p1, Lvre;->a:Lmsh;

    invoke-virtual {v0, v1}, Lmsh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object p1, p1, Lvre;->a:Lmsh;

    iget-object p1, p1, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llsh;

    sget-object v0, Llsh;->i:Llsh;

    if-ne p1, v0, :cond_23

    const/4 p1, 0x0

    iput-object p1, p0, Lp12;->f:Ljava/lang/Object;

    :cond_23
    return-void
.end method
