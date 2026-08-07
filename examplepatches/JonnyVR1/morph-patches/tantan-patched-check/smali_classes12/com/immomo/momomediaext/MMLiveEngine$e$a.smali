.class Lcom/immomo/momomediaext/MMLiveEngine$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$e;->a(Ljava/lang/Object;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/immomo/momomediaext/MMLiveEngine$e;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$e;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$e;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$e;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->a:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    const/16 v2, 0x13

    .line 21
    .line 22
    if-eq v0, v2, :cond_1

    .line 23
    .line 24
    const/16 v2, 0x19

    .line 25
    .line 26
    if-eq v0, v2, :cond_2

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$e;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Ll/enw;->C(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$e;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$e;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Ll/enw;->D(I)V

    .line 51
    .line 52
    .line 53
    const-string p0, "onMusicPlayError"

    .line 54
    .line 55
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
