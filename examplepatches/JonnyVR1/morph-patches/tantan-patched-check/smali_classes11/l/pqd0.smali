.class public final Ll/pqd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/sqd0;

.field public final c:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ll/tqd0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILl/sqd0;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/sqd0;",
            "Ljava/util/List<",
            "Ll/tqd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/pqd0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/pqd0;->b:Ll/sqd0;

    .line 7
    .line 8
    invoke-static {p3}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/pqd0;->c:Lcom/google/common/collect/ImmutableList;

    .line 13
    .line 14
    return-void
.end method
