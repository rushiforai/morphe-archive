.class Lcom/immomo/momomediaext/MMLiveEngine$n$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$n;->k(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/immomo/momomediaext/MMLiveEngine$n;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$n;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->c:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->c:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->c:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->a:I

    .line 20
    .line 21
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$i;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0}, Ll/enw;->y(II)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
