.class public final Lqdh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lii;

.field public final b:Lghf;

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lii;Lghf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqdh;->a:Lii;

    iput-object p2, p0, Lqdh;->b:Lghf;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lqdh;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Ltqi;Lidh;)V
    .registers 13

    iget-object p1, p1, Ltqi;->h:Ljava/util/ArrayList;

    new-instance v0, Ld82;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lrmg;

    const/16 v1, 0xa

    invoke-direct {p1, p2, v1}, Lrmg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p1

    new-instance p2, Lu4h;

    const/4 v0, 0x7

    invoke-direct {p2, v0}, Lu4h;-><init>(B)V

    new-instance v0, Lbli;

    invoke-direct {v0, v1}, Lbli;-><init>(B)V

    new-instance v1, Lr79;

    invoke-direct {v1, p1, p2, v0}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    new-instance v2, Lldh;

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v3, 0x1

    const-class v5, Lqdh;

    const-string v6, "createNetworkRequestCall"

    const-string v7, "createNetworkRequestCall(Ljava/lang/String;)Lokhttp3/Call;"

    move-object v4, p0

    invoke-direct/range {v2 .. v9}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-interface {v1}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_36
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p2, v4, Lqdh;->b:Lghf;

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p2, p1, v0}, Lghf;->L(Ljava/lang/String;Lp6l;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Lldh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lv84;

    new-instance p2, Lj06;

    const/16 v0, 0x1a

    invoke-direct {p2, v0}, Lj06;-><init>(B)V

    invoke-interface {p1, p2}, Lv84;->enqueue(Lf94;)V

    goto :goto_36

    :cond_5b
    return-void
.end method

.method public final b(Ltqi;)V
    .registers 4

    iget-object v0, p0, Lqdh;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    sget-object v1, Lidh;->b:Lidh;

    invoke-virtual {p0, p1, v1}, Lqdh;->a(Ltqi;Lidh;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
