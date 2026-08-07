.class public Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdvancedConfigInfo"
.end annotation


# instance fields
.field public logUploadServer:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;->logUploadServer:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;

    new-instance v0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;

    invoke-direct {v0}, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;->logUploadServer:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;

    return-void
.end method


# virtual methods
.method public getLogUploadServerInfo()Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AdvancedConfigInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;->logUploadServer:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;

    return-object p0
.end method
