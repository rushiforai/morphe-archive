.class public final Lnoc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public final a:Ljs6;

.field public final b:Lcan;

.field public final c:Llw7;

.field public final d:Ljava/util/HashMap;

.field public e:Z


# direct methods
.method public constructor <init>(Lndc;Lcom/opera/android/feed/FeedScrollView;Ljs6;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lnoc;->a:Ljs6;

    new-instance p3, Lcan;

    invoke-direct {p3}, Lcan;-><init>()V

    iput-object p3, p0, Lnoc;->b:Lcan;

    new-instance v0, Llw7;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Llw7;-><init>(Ljava/lang/Object;Ltcc;B)V

    iput-object v0, p0, Lnoc;->c:Llw7;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lnoc;->d:Ljava/util/HashMap;

    invoke-virtual {p3, v1}, Lcan;->b(Z)V

    new-instance p1, Lhw7;

    const/4 p3, 0x2

    invoke-direct {p1, p0, p3}, Lhw7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 7

    const/16 p3, 0x63

    if-le p2, p3, :cond_93

    iget-object p0, p0, Lnoc;->d:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luoc;

    if-eqz p0, :cond_93

    iget-object p0, p0, Luoc;->a:Ligi;

    iget-object p1, p0, Ligi;->c:Ljava/lang/Object;

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzmc;

    if-eqz p1, :cond_93

    iget-object p0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Lpkc;

    iget-object p0, p0, Lpkc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    iget-object p2, p0, Ljs6;->j:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashSet;

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object p3

    iget-wide v0, p3, Llmc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_93

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object p3

    iget-object p3, p3, Llmc;->h:Limc;

    if-eqz p3, :cond_50

    iget-object p3, p3, Limc;->b:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_50

    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ltmc;

    goto :goto_51

    :cond_50
    const/4 p3, 0x0

    :goto_51
    if-eqz p3, :cond_93

    iget-object v0, p3, Ltmc;->b:Ljava/lang/String;

    iget-object p3, p3, Ltmc;->a:Ljava/lang/String;

    if-eqz p3, :cond_93

    if-eqz v0, :cond_93

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-wide v1, p1, Llmc;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p0, Lxoc;

    iget-object p0, p0, Lxoc;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_93

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    new-instance v1, Lck0;

    invoke-direct {v1, p1, p2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v1}, Lck0;->e()Lhi0;

    move-result-object p1

    invoke-virtual {p1}, Lhi0;->a()Lvg0;

    move-result-object p1

    new-instance v1, Le5f;

    const/4 v2, 0x1

    invoke-direct {v1, p3, v0, v2}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    const-string p3, "start_page"

    invoke-virtual {p1, p3, v1}, Lvg0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_93
    return-void
.end method

.method public final a()V
    .registers 1

    iget-object p0, p0, Lnoc;->b:Lcan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void
.end method
