.class public final Ly9e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwkn;


# static fields
.field public static final c:Ljava/util/Set;


# instance fields
.field public final a:Lz7f;

.field public final b:Lh42;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const-string v6, "NETWORK_545"

    const-string v7, "NETWORK_15"

    const-string v0, "NETWORK_10"

    const-string v1, "NETWORK_17"

    const-string v2, "NETWORK_16"

    const-string v3, "NETWORK_13"

    const-string v4, "NETWORK_50"

    const-string v5, "NETWORK_544"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ly9e;->c:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lz7f;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly9e;->a:Lz7f;

    new-instance v0, Lpo7;

    invoke-direct {v0, p1}, Lpo7;-><init>(Lno7;)V

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    new-instance v1, Lx9e;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p0, v2}, Lx9e;-><init>(Lh42;Ljava/lang/Object;B)V

    new-instance v2, Liwa;

    const/16 v3, 0xb

    invoke-direct {v2, v1, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    iput-object p1, p0, Ly9e;->b:Lh42;

    return-void
.end method

.method public static b(Ly7f;)Ljava/util/Set;
    .registers 3

    instance-of v0, p0, Lv7f;

    sget-object v1, Ly9e;->c:Ljava/util/Set;

    if-eqz v0, :cond_38

    check-cast p0, Lv7f;

    iget-object p0, p0, Lv7f;->g:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_44

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_21
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu7f;

    iget-object v1, v1, Lu7f;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_33
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    :cond_38
    instance-of v0, p0, Lw7f;

    if-nez v0, :cond_4a

    sget-object v0, Lx7f;->a:Lx7f;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_45

    :cond_44
    return-object v1

    :cond_45
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_4a
    return-object v1
.end method


# virtual methods
.method public final a()Lekc;
    .registers 1

    iget-object p0, p0, Ly9e;->b:Lh42;

    return-object p0
.end method
