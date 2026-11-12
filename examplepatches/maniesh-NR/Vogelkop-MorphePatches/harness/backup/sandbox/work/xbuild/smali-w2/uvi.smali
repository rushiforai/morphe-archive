.class public final Luvi;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lcan;

.field public final b:Lbt;

.field public final c:Ljava/util/LinkedHashMap;

.field public final d:Lz22;

.field public final e:Lza3;

.field public final f:Lsvi;


# direct methods
.method public constructor <init>(Lbt;)V
    .registers 3

    new-instance v0, Lcan;

    invoke-direct {v0}, Lcan;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Luvi;->a:Lcan;

    iput-object p1, p0, Luvi;->b:Lbt;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Luvi;->c:Ljava/util/LinkedHashMap;

    new-instance p1, Lz22;

    const/16 v0, 0xf

    invoke-direct {p1, p0, v0}, Lz22;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Luvi;->d:Lz22;

    new-instance p1, Lza3;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lza3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Luvi;->e:Lza3;

    new-instance p1, Lsvi;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lsvi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Luvi;->f:Lsvi;

    return-void
.end method


# virtual methods
.method public final R(Lgt;Landroid/widget/LinearLayout;I)V
    .registers 6

    const/4 v0, 0x0

    const/16 v1, 0x64

    invoke-static {p3, v0, v1}, Ldjh;->c(III)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, p1, p3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Luvi;->c:Ljava/util/LinkedHashMap;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Luvi;->a:Lcan;

    iget-object p0, p0, Luvi;->f:Lsvi;

    invoke-virtual {p1, p2, p0}, Lcan;->c(Landroid/view/View;Ly9n;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iget-object p0, p0, Luvi;->a:Lcan;

    invoke-virtual {p0, p1}, Lcan;->b(Z)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    :goto_7
    iget-object p1, p0, Luvi;->c:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    iget-object v1, p0, Luvi;->a:Lcan;

    if-nez v0, :cond_24

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lcan;->a(Landroid/view/View;)V

    goto :goto_7

    :cond_24
    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lcan;->b(Z)V

    return-void
.end method
