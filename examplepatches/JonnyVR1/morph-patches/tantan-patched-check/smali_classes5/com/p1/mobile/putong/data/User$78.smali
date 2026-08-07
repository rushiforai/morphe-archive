.class Lcom/p1/mobile/putong/data/User$78;
.super Lcom/tantanapp/common/data/orm/Column;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Column<",
        "Lcom/p1/mobile/putong/data/User;",
        "Lcom/p1/mobile/putong/data/AudioSignature;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/Column;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/AudioSignature;
    .locals 0

    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User$78;->get(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/AudioSignature;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/AudioSignature;)V
    .locals 0

    .line 9
    iput-object p2, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/AudioSignature;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$78;->set(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/AudioSignature;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
