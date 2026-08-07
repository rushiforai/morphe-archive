.class public Lcom/p1/mobile/putong/core/api/z$b;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/core/data/CoreData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/core/api/z;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/z;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/z$b;->h:Lcom/p1/mobile/putong/core/api/z;

    .line 2
    .line 3
    iget-object v0, p1, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    new-instance v1, Ll/dji;

    .line 6
    .line 7
    new-instance v2, Ll/vod;

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "_v"

    .line 12
    .line 13
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget v4, Lcom/p1/mobile/putong/core/data/CoreData;->PA_VERSION:I

    .line 17
    .line 18
    add-int/lit8 v4, v4, 0x43

    .line 19
    .line 20
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object v4, Ll/uqb0;->b0:Ll/sre0;

    .line 28
    .line 29
    iget-object v4, v4, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const-string v5, "stickers_protobuf"

    .line 36
    .line 37
    invoke-direct {v2, v5, v3, v4}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 v3, 0x7

    .line 41
    sget-object v4, Lcom/p1/mobile/putong/core/data/CoreData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-direct {v1, v2, v3, v4}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Lcom/p1/mobile/putong/core/api/z$b$a;

    .line 47
    .line 48
    invoke-direct {v2, p1}, Lcom/p1/mobile/putong/core/api/z$b$a;-><init>(Lcom/p1/mobile/putong/core/api/z;)V

    .line 49
    .line 50
    .line 51
    const-string p1, "stickers"

    .line 52
    .line 53
    invoke-direct {p0, v0, p1, v1, v2}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic B()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/shops/tantan/campaigns/networkShare2014?method=patch"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string v2, "{\"campaignCode\":\"8fd56f5f51790faf9794ab1f4f12e6e9\"}"

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/api/z$b;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/z$b;->D(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic D(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 24
    .line 25
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 26
    .line 27
    const-string v3, "locked"

    .line 28
    .line 29
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const-string v2, "purchased"

    .line 36
    .line 37
    invoke-static {v2}, Lcom/p1/mobile/putong/data/BundleStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BundleStatus;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0, p1}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 48
    .line 49
    return-object p0
.end method

.method public E()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/z$b;->h:Lcom/p1/mobile/putong/core/api/z;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    new-instance v1, Ll/ti20;

    .line 6
    .line 7
    new-instance v2, Ll/i0b;

    .line 8
    .line 9
    invoke-direct {v2}, Ll/i0b;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v2}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/j0b;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/j0b;-><init>(Lcom/p1/mobile/putong/core/api/z$b;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
