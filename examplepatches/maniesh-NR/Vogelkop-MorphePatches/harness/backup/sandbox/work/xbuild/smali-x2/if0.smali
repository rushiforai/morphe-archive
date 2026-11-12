.class public final Lif0;
.super Ljava/util/AbstractMap;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:B

.field public final synthetic c:Ljf0;


# direct methods
.method public constructor <init>(Ljf0;ILjava/util/Map;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lif0;->c:Ljf0;

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    iput-byte p2, p0, Lif0;->b:B

    iput-object p3, p0, Lif0;->a:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final entrySet()Ljava/util/Set;
    .registers 4

    new-instance v0, Lgf0;

    iget-object v1, p0, Lif0;->a:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Lif0;->c:Ljf0;

    iget-byte p0, p0, Lif0;->b:B

    invoke-direct {v0, v2, p0, v1}, Lgf0;-><init>(Ljf0;ILjava/util/Set;)V

    return-object v0
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lif0;->a:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lif0;->c:Ljf0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1
.end method
