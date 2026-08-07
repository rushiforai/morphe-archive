.class public Ll/tpq$a;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tpq;->d(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/DbObject;

.field public final synthetic b:Ll/tpq;


# direct methods
.method public constructor <init>(Ll/tpq;Lcom/tantanapp/common/data/DbObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tpq$a;->a:Lcom/tantanapp/common/data/DbObject;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/tpq$a;->a:Lcom/tantanapp/common/data/DbObject;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/tpq$a;->a:Lcom/tantanapp/common/data/DbObject;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/tpq$a;->b:Ll/tpq;

    .line 12
    .line 13
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/tpq$a;->a:Lcom/tantanapp/common/data/DbObject;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public bridge synthetic filter(Ljava/lang/Object;)Z
    .locals 0

    .line 28
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-virtual {p0, p1}, Ll/tpq$a;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    move-result p0

    return p0
.end method
