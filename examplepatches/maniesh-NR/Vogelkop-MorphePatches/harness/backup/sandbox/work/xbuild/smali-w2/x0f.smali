.class public final Lx0f;
.super Le43;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lqie;

.field public final d:Ljava/util/LinkedHashMap;

.field public final e:Lode;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx0f;->a:Landroid/content/Context;

    iput-object p2, p0, Lx0f;->b:Lumi;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lx0f;->c:Lqie;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lx0f;->d:Ljava/util/LinkedHashMap;

    new-instance p1, Lode;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lx0f;->e:Lode;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lode;
    .registers 6

    iget-object v0, p0, Lx0f;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_14

    new-instance v1, Lode;

    invoke-direct {v1}, Lekc;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v2

    goto :goto_15

    :cond_14
    move v0, v3

    :goto_15
    check-cast v1, Lode;

    if-eqz v0, :cond_36

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    new-instance v0, Lu0f;

    invoke-direct {v0, p0, v3}, Lu0f;-><init>(Lx0f;B)V

    iget-object v3, p0, Lx0f;->b:Lumi;

    invoke-virtual {v3, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v3, Lu0f;

    invoke-direct {v3, p0, v2}, Lu0f;-><init>(Lx0f;B)V

    invoke-virtual {v0, v3}, Lnml;->c(Ln5o;)Loml;

    move-result-object v0

    iget-object p0, p0, Lx0f;->c:Lqie;

    invoke-virtual {p0, v0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_36
    return-object v1
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    iget-object p1, p0, Lx0f;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    new-instance v0, Lu0f;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lu0f;-><init>(Lx0f;B)V

    iget-object v1, p0, Lx0f;->b:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lu0f;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lu0f;-><init>(Lx0f;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object v0

    iget-object p0, p0, Lx0f;->c:Lqie;

    invoke-virtual {p0, v0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method
