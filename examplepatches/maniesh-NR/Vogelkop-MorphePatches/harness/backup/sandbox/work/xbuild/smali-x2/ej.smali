.class public final Lej;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lej;->a:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;ZLkotlin/jvm/functions/Function2;)V
    .registers 11

    new-instance v0, Lcj;

    new-instance v1, Laj;

    invoke-direct {v1, p0, p2, p1, p3}, Laj;-><init>(Lej;ZLjava/util/ArrayList;Lkotlin/jvm/functions/Function2;)V

    invoke-direct {v0, p1, p2, v1}, Lcj;-><init>(Ljava/util/ArrayList;ZLaj;)V

    iget-object p0, p0, Lej;->a:Ljava/util/LinkedHashSet;

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-boolean p0, v0, Lcj;->a:Z

    if-eqz p0, :cond_14

    return-void

    :cond_14
    const/4 p0, 0x1

    iput-boolean p0, v0, Lcj;->a:Z

    const/4 p0, 0x0

    if-eqz p2, :cond_1e

    const/16 p2, 0x4000

    move v4, p2

    goto :goto_1f

    :cond_1e
    move v4, p0

    :goto_1f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_23
    iget-object p3, v0, Lcj;->d:Lz;

    if-ge p0, p2, :cond_3f

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 p0, p0, 0x1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p3}, Lz;->b()Lyqd;

    move-result-object p3

    new-instance v6, Lbj;

    invoke-direct {v6, v0, p3}, Lbj;-><init>(Lcj;Lyqd;)V

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    goto :goto_23

    :cond_3f
    invoke-virtual {p3}, Lz;->e()V

    return-void
.end method
