.class public Ll/cm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/cm0;->a:Ljava/lang/String;

    .line 23
    iput-object v0, p0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/cm0;->a:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 17
    .line 18
    iput-object p1, p0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 19
    .line 20
    return-void
.end method

.method public static a()Ll/cm0;
    .locals 1

    .line 1
    new-instance v0, Ll/cm0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cm0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
