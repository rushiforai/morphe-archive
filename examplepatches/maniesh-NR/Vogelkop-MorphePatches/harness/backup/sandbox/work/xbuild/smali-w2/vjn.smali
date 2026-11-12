.class public final Lvjn;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Z

.field public final d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZ)V
    .registers 5

    const/16 v0, 0x1a

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-boolean p2, p0, Lvjn;->c:Z

    iput-boolean p3, p0, Lvjn;->d:Z

    return-void
.end method


# virtual methods
.method public final P(Ljava/util/List;)Ljava/util/List;
    .registers 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v1, p0, Lvjn;->c:Z

    if-eqz v1, :cond_11

    new-instance v1, Lgkb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_11
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1, v1, v2}, Ln1;->r0(Ljava/util/List;ZZ)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-boolean p0, p0, Lvjn;->d:Z

    if-eqz p0, :cond_26

    new-instance p0, Likb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_26
    return-object v0
.end method
