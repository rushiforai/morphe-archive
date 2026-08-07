.class public Ll/f9t$a;
.super Lcom/tantanapp/common/data/ConvertedJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f9t;-><init>(Ll/pcj;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ConvertedJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/ConvertedJsonAdapter;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0

    .line 1
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0

    .line 1
    return-object p1
.end method

.method public bridge synthetic from(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f9t$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic to(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f9t$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
