.class public final Lcj3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Lvx;

.field public final c:Lf9d;

.field public final d:Ljze;

.field public final e:Lkze;

.field public final f:Lqie;

.field public g:Ljava/util/Set;

.field public h:Ljava/util/Set;

.field public final i:Ljava/util/LinkedHashSet;

.field public j:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ltcl;Lh42;Lh42;Lvx;Lf9d;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcj3;->a:Ltcl;

    iput-object p4, p0, Lcj3;->b:Lvx;

    iput-object p5, p0, Lcj3;->c:Lf9d;

    new-instance p1, Ljze;

    sget-object p4, Lv08;->a:Lv08;

    invoke-direct {p1, p4}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcj3;->d:Ljze;

    new-instance p5, Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p5, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p5, p0, Lcj3;->e:Lkze;

    new-instance p5, Lqie;

    const/16 v0, 0x13

    invoke-direct {p5, v0}, Lqie;-><init>(B)V

    iput-object p5, p0, Lcj3;->f:Lqie;

    iput-object p4, p0, Lcj3;->g:Ljava/util/Set;

    iput-object p4, p0, Lcj3;->h:Ljava/util/Set;

    new-instance p5, Ljava/util/LinkedHashSet;

    invoke-direct {p5}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p5, p0, Lcj3;->i:Ljava/util/LinkedHashSet;

    iput-object p4, p0, Lcj3;->j:Ljava/util/Set;

    new-instance p4, Lpqh;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p2

    new-instance p5, Laj3;

    invoke-direct {p5, p4, p0}, Laj3;-><init>(Lpqh;Lcj3;)V

    new-instance v0, Lug;

    const/16 v1, 0xb

    invoke-direct {v0, p5, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p5, p1, Ljze;->l:Lh42;

    invoke-virtual {p5, p2, v0}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p2, Laj3;

    invoke-direct {p2, p0, p4}, Laj3;-><init>(Lcj3;Lpqh;)V

    new-instance p0, Lug;

    invoke-direct {p0, p2, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p3, p0}, Ljze;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;)V
    .registers 11

    if-eqz p1, :cond_d0

    iget-object v0, p0, Lcj3;->h:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d0

    iget-object v0, p0, Lcj3;->h:Ljava/util/Set;

    iget-object v1, p0, Lcj3;->i:Ljava/util/LinkedHashSet;

    invoke-static {v0, v1}, Lb5j;->d(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    sget-object v2, Lv08;->a:Lv08;

    iput-object v2, p0, Lcj3;->h:Ljava/util/Set;

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwj3;

    iget-object v4, v3, Lwj3;->b:Ljava/lang/String;

    new-instance v5, Lc8a;

    invoke-direct {v5, v4}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    if-eqz v4, :cond_40

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_40
    iget-object v4, v3, Lwj3;->b:Ljava/lang/String;

    new-instance v5, Lc8a;

    invoke-direct {v5, v4}, Lc8a;-><init>(Ljava/lang/String;)V

    filled-new-array {v3}, [Lwj3;

    move-result-object v3

    invoke-static {v3}, La5j;->b([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    :cond_53
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5b
    :goto_5b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc8a;

    iget-object v3, v3, Lc8a;->a:Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    move-object v4, v2

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v1, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v4, p0, Lcj3;->b:Lvx;

    invoke-virtual {v4}, Lvx;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llj3;

    new-instance v5, Lwx;

    const/16 v6, 0xf

    invoke-direct {v5, p0, v2, v6}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lwx;

    iget-object v6, p0, Lcj3;->c:Lf9d;

    invoke-direct {v2, v3, v5, v6}, Lwx;-><init>(Ljava/lang/String;Lwx;Lf9d;)V

    iget-object v5, v4, Llj3;->e:Ljava/util/ArrayList;

    iget-object v6, v4, Llj3;->b:Ltm5;

    iget-object v7, v6, Ltm5;->c:Lrle;

    if-nez v7, :cond_9f

    invoke-static {}, Lsle;->d()Z

    move-result v7

    iput-boolean v7, v6, Ltm5;->a:Z

    :cond_9f
    iget-boolean v7, v6, Ltm5;->a:Z

    if-eqz v7, :cond_a7

    invoke-virtual {v4, p1, v3, v2}, Llj3;->a(Landroid/net/Uri;Ljava/lang/String;Lwx;)V

    goto :goto_5b

    :cond_a7
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    new-instance v8, Ljj3;

    invoke-direct {v8, p1, v3, v2}, Ljj3;-><init>(Landroid/net/Uri;Ljava/lang/String;Lwx;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v7, :cond_5b

    new-instance v2, Lkj3;

    invoke-direct {v2, v4}, Lkj3;-><init>(Llj3;)V

    iget-object v3, v6, Ltm5;->d:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v2, v6, Ltm5;->c:Lrle;

    if-nez v2, :cond_5b

    invoke-static {v6}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object v2

    iput-object v2, v6, Ltm5;->c:Lrle;

    invoke-static {}, Lsle;->d()Z

    move-result v2

    iput-boolean v2, v6, Ltm5;->a:Z

    goto :goto_5b

    :cond_d0
    return-void
.end method
