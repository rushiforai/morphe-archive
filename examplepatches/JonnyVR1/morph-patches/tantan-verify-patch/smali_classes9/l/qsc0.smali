.class public Ll/qsc0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/app/PutongAct;

.field public d:Ll/ztc0;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/data/RedPacket;

.field public g:Z

.field public h:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/ztc0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacket;->new_()Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/qsc0;->f:Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/qsc0;->g:Z

    .line 19
    .line 20
    iput-object p1, p0, Ll/qsc0;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    iput-object p2, p0, Ll/qsc0;->d:Ll/ztc0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qsc0;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ReceiveRecords;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qsc0;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p2, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->n4:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p2, Ll/qec0;->p4:I

    .line 23
    .line 24
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ReceiveRecords;II)V
    .locals 9

    .line 1
    const/4 v2, 0x1

    .line 2
    if-ne p3, v2, :cond_0

    .line 3
    .line 4
    move-object v0, p1

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;

    .line 6
    .line 7
    iget-object v2, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/qsc0;->g:Z

    .line 16
    .line 17
    iget-object v3, p0, Ll/qsc0;->f:Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 18
    .line 19
    iget-object v5, p0, Ll/qsc0;->d:Ll/ztc0;

    .line 20
    .line 21
    move-object v6, v5

    .line 22
    iget-object v5, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 23
    .line 24
    iget-wide v7, p0, Ll/qsc0;->h:J

    .line 25
    .line 26
    move-object v4, v6

    .line 27
    move-object v6, p0

    .line 28
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->f(Lcom/p1/mobile/putong/core/data/ReceiveRecords;ZLcom/p1/mobile/putong/core/data/RedPacket;Ll/ztc0;Ljava/util/List;Ll/qsc0;J)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 v2, 0x2

    .line 33
    if-ne p3, v2, :cond_1

    .line 34
    .line 35
    move-object v0, p1

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;

    .line 37
    .line 38
    iget-object v2, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 45
    .line 46
    iget-boolean v2, p0, Ll/qsc0;->g:Z

    .line 47
    .line 48
    iget-object v3, p0, Ll/qsc0;->f:Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 49
    .line 50
    iget-wide v5, p0, Ll/qsc0;->h:J

    .line 51
    .line 52
    move-object v4, p0

    .line 53
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->e(Lcom/p1/mobile/putong/core/data/ReceiveRecords;ZLcom/p1/mobile/putong/core/data/RedPacket;Ll/qsc0;J)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/data/ReceiveRecords;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;Lcom/p1/mobile/putong/core/data/RedPacket;ZJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/RedPacket;",
            "ZJ)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qsc0;->e:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qsc0;->f:Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/qsc0;->g:Z

    .line 6
    .line 7
    iput-wide p4, p0, Ll/qsc0;->h:J

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qsc0;->F(I)Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x2

    .line 6
    return p0
.end method
