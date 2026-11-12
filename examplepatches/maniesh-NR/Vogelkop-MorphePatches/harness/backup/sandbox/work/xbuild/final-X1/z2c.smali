.class public final Lz2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly2c;


# instance fields
.field public final a:Ltx7;

.field public final b:B

.field public final c:Ljava/util/LinkedHashMap;


# direct methods
.method public constructor <init>(ILtx7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lz2c;->a:Ltx7;

    iput-byte p1, p0, Lz2c;->b:B

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lz2c;->c:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)Lx2c;
    .registers 10

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getLayoutPosition()I

    move-result v0

    const/4 v1, 0x0

    iget-object v2, p0, Lz2c;->c:Ljava/util/LinkedHashMap;

    const/4 v3, -0x1

    if-eq v0, v3, :cond_11

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx2c;

    goto :goto_12

    :cond_11
    move-object v0, v1

    :goto_12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v4

    if-ne v4, v3, :cond_19

    return-object v1

    :cond_19
    iget-object v1, p0, Lz2c;->a:Ltx7;

    iget-byte p0, p0, Lz2c;->b:B

    invoke-virtual {v1, v4, p0}, Ltx7;->e(II)I

    move-result v1

    const/4 v3, 0x1

    sub-int/2addr p0, v3

    const/4 v4, 0x0

    if-nez v1, :cond_28

    move v5, v3

    goto :goto_29

    :cond_28
    move v5, v4

    :goto_29
    if-ne v1, p0, :cond_2d

    move v6, v3

    goto :goto_2e

    :cond_2d
    move v6, v4

    :goto_2e
    if-lez v1, :cond_32

    move v7, v3

    goto :goto_33

    :cond_32
    move v7, v4

    :goto_33
    if-lt v1, p0, :cond_36

    move v3, v4

    :cond_36
    if-eqz v0, :cond_49

    iget-boolean p0, v0, Lx2c;->a:Z

    if-ne v5, p0, :cond_49

    iget-boolean p0, v0, Lx2c;->b:Z

    if-ne v6, p0, :cond_49

    iget-boolean p0, v0, Lx2c;->d:Z

    if-ne v7, p0, :cond_49

    iget-boolean p0, v0, Lx2c;->c:Z

    if-ne v3, p0, :cond_49

    return-object v0

    :cond_49
    new-instance p0, Lx2c;

    invoke-direct {p0, v5, v6, v3, v7}, Lx2c;-><init>(ZZZZ)V

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final invalidate()V
    .registers 1

    iget-object p0, p0, Lz2c;->a:Ltx7;

    invoke-virtual {p0}, Ltx7;->h()V

    invoke-virtual {p0}, Ltx7;->g()V

    return-void
.end method
