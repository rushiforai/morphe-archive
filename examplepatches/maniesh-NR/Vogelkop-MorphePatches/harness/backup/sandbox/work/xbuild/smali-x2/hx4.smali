.class public final Lhx4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:C

.field public final b:Ljava/util/Set;

.field public final c:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(ILjava/util/Set;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-char p1, p0, Lhx4;->a:C

    iput-object p2, p0, Lhx4;->b:Ljava/util/Set;

    check-cast p2, Ljava/lang/Iterable;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object p1

    iput-object p1, p0, Lhx4;->c:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final a()Lix4;
    .registers 3

    new-instance v0, Lix4;

    iget-object v1, p0, Lhx4;->b:Ljava/util/Set;

    iget-object p0, p0, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-direct {v0, p0, v1}, Lix4;-><init>(Ljava/util/LinkedHashSet;Ljava/util/Set;)V

    return-object v0
.end method

.method public final b(I)V
    .registers 3

    iget-char v0, p0, Lhx4;->a:C

    add-int/2addr v0, p1

    iget-object p0, p0, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
