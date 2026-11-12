.class public final Lwd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final a:Lzy;

.field public final b:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lzy;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwd3;->a:Lzy;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwd3;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 2

    iget-object p0, p0, Lwd3;->a:Lzy;

    invoke-interface {p0, p1}, Lzy;->a(Lyz;)Z

    move-result p0

    return p0
.end method

.method public final b(Lyz;)V
    .registers 2

    iget-object p0, p0, Lwd3;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object p0, p0, Lwd3;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_a

    return-void

    :cond_a
    new-instance v0, Lq92;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lq92;-><init>(B)V

    new-instance v1, Lvd3;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lvd3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, p0}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1d
    if-ge v2, v0, :cond_2b

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lyz;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1d

    :cond_2b
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lwd3;->a:Lzy;

    invoke-interface {p0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void
.end method
