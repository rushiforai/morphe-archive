.class public final Lxjn;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 4

    const/16 v0, 0x1a

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-boolean p2, p0, Lxjn;->c:Z

    return-void
.end method


# virtual methods
.method public final G0(Z)V
    .registers 2

    iput-boolean p1, p0, Lxjn;->d:Z

    return-void
.end method

.method public final P(Ljava/util/List;)Ljava/util/List;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v1, p0, Lxjn;->d:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    invoke-static {p1, v2, v2}, Ln1;->r0(Ljava/util/List;ZZ)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0

    :cond_12
    new-instance v1, Lekb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2a

    new-instance p0, Ldkb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    :cond_2a
    invoke-static {p1, v3, v2}, Ln1;->r0(Ljava/util/List;ZZ)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-boolean p0, p0, Lxjn;->c:Z

    if-eqz p0, :cond_3d

    new-instance p0, Llkb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3d
    return-object v0
.end method
