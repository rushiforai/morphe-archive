.class public Lcom/p1/mobile/putong/core/api/q$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/core/api/q;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/q;Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/q$a;->h:Lcom/p1/mobile/putong/core/api/q;

    .line 2
    .line 3
    new-instance p1, Ll/dji;

    .line 4
    .line 5
    new-instance v0, Ll/vod;

    .line 6
    .line 7
    const-string v1, "nearby_roamed_locations"

    .line 8
    .line 9
    const-string v2, "_1"

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, p2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p2, -0x1

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    invoke-direct {p1, v0, p2, v1}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/cm9;

    .line 21
    .line 22
    invoke-direct {p2}, Ll/cm9;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v0, "NearByRoamedLocations"

    .line 26
    .line 27
    invoke-direct {p0, v0, p1, p2}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic B()Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method
