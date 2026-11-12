.class public final Lgf0;
.super Ljava/util/AbstractSet;
.source "SourceFile"

# interfaces
.implements Lj$/util/Collection;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:B

.field public final synthetic c:Ljf0;


# direct methods
.method public constructor <init>(Ljf0;ILjava/util/Set;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lgf0;->c:Ljf0;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    iput-byte p2, p0, Lgf0;->b:B

    iput-object p3, p0, Lgf0;->a:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .registers 4

    new-instance v0, Lff0;

    iget-object v1, p0, Lgf0;->a:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lgf0;->c:Ljf0;

    iget-byte p0, p0, Lgf0;->b:B

    invoke-direct {v0, v2, p0, v1}, Lff0;-><init>(Ljf0;ILjava/util/Iterator;)V

    return-object v0
.end method

.method public final size()I
    .registers 1

    iget-object p0, p0, Lgf0;->a:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0
.end method
