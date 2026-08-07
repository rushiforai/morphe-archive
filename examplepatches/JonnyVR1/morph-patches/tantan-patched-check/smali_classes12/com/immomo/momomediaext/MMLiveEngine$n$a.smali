.class Lcom/immomo/momomediaext/MMLiveEngine$n$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$n;->f(JILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/immomo/momomediaext/MMLiveEngine$n;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$n;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$a;->a:I

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$n;

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
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$a;->a:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;->MMLiveAcrossRoomStateConnected:Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/enw;->a(Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;->MMLiveAcrossRoomStateFailed:Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/enw;->a(Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method
