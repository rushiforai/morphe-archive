.class public final Ltr8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lur8;

.field public final c:Lcom/opera/android/bookmarks/h;

.field public final d:Lode;

.field public final e:Lwnm;


# direct methods
.method public constructor <init>(Lumi;Lur8;Lcom/opera/android/bookmarks/h;Lmdh;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltr8;->a:Lumi;

    iput-object p2, p0, Ltr8;->b:Lur8;

    iput-object p3, p0, Ltr8;->c:Lcom/opera/android/bookmarks/h;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Ltr8;->d:Lode;

    sget-object v0, Lv08;->a:Lv08;

    iget-object p2, p2, Lur8;->a:Ly5i;

    iget-object p2, p2, Ly5i;->f:Lpjb;

    if-nez p2, :cond_19

    const/4 p2, 0x0

    :cond_19
    const-string v1, "add_favorite_removed_suggestion"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ld58;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Ld58;-><init>(B)V

    const/4 v3, 0x0

    invoke-virtual {p2, v1, v3, v2}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    move-result-object p2

    iget-object p4, p4, Lmdh;->h:Lh42;

    new-instance v1, Lr31;

    const/4 v7, 0x0

    const/4 v8, 0x3

    const/4 v2, 0x3

    const-class v4, Ltr8;

    const-string v5, "calculateState"

    const-string v6, "calculateState(Ljava/util/List;Ljava/util/Set;Ljava/util/List;)Ljava/util/Set;"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lr31;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v0, p2, p1, p4, v1}, Lxf8;->X(Ljava/lang/Object;Lekc;Lekc;Lekc;Lcr9;)Lwnm;

    move-result-object p0

    iput-object p0, v3, Ltr8;->e:Lwnm;

    invoke-virtual {v3}, Ltr8;->a()V

    new-instance p0, Ldl3;

    const/4 p1, 0x4

    invoke-direct {p0, v3, p1}, Ldl3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p0}, Lcom/opera/android/bookmarks/h;->a(Lql3;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    new-instance v0, Lp4j;

    invoke-direct {v0}, Lp4j;-><init>()V

    iget-object v1, p0, Ltr8;->c:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    if-nez v1, :cond_10

    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    goto :goto_19

    :cond_10
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2, v1}, Lcom/opera/android/bookmarks/h;->k(Ljava/util/HashSet;Lml3;)V

    move-object v1, v2

    :goto_19
    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lp4j;->add(Ljava/lang/Object;)Z

    invoke-static {v2}, Lz7h;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_36
    invoke-static {v0}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v0

    iget-object p0, p0, Ltr8;->d:Lode;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
