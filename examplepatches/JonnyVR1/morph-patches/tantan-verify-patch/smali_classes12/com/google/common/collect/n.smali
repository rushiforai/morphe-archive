.class public final synthetic Lcom/google/common/collect/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/util/Comparator;

.field public final synthetic b:Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Comparator;Ljava/util/Comparator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/n;->a:Ljava/util/Comparator;

    iput-object p2, p0, Lcom/google/common/collect/n;->b:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/n;->a:Ljava/util/Comparator;

    iget-object p0, p0, Lcom/google/common/collect/n;->b:Ljava/util/Comparator;

    check-cast p1, Lcom/google/common/collect/r$a;

    check-cast p2, Lcom/google/common/collect/r$a;

    invoke-static {v0, p0, p1, p2}, Lcom/google/common/collect/RegularImmutableTable;->a(Ljava/util/Comparator;Ljava/util/Comparator;Lcom/google/common/collect/r$a;Lcom/google/common/collect/r$a;)I

    move-result p0

    return p0
.end method
