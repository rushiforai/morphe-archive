.class Lcom/immomo/momomediaext/MMLiveEngine$z$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$z;->OnReceiveH264Sei([BJLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:J

.field final synthetic c:Lcom/immomo/momomediaext/MMLiveEngine$z;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$z;[BJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$z;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->a:[B

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->b:J

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$z;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$z;->a:Lcom/immomo/momomediaext/MMLiveEngine;

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
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$z;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$z;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->a:[B

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 24
    .line 25
    .line 26
    iget-wide v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->b:J

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$z$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$z;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$z;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, p0}, Ll/enw;->Q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method
