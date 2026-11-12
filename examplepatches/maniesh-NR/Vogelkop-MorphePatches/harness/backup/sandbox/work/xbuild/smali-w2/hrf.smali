.class public final Lhrf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lirf;


# direct methods
.method public constructor <init>(Lirf;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lhrf;->a:I

    iput-object p1, p0, Lhrf;->b:Lirf;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 6

    iget-object v0, p0, Lhrf;->b:Lirf;

    iget-boolean v1, v0, Lirf;->d:Z

    if-nez v1, :cond_18

    iget v1, v0, Lirf;->e:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v0, Lirf;->e:I

    iput-boolean v2, v0, Lirf;->h:Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lirf;->a(Ld50;)Z

    iget-object v1, v0, Lirf;->a:Loyg;

    iget-object v3, v1, Loyg;->a:Lzy;

    if-nez v3, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    invoke-interface {v3, p1}, Lzy;->b(Lyz;)V

    iget-object v3, v1, Loyg;->b:Landroid/util/SparseArray;

    iget p0, p0, Lhrf;->a:I

    invoke-virtual {v3, p0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Loyg;->a(Lirf;)V

    return v2
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lhrf;->b:Lirf;

    iget p0, p0, Lhrf;->a:I

    invoke-virtual {v0, p0, p1}, Lirf;->b(ILjava/lang/String;)V

    return-void
.end method
