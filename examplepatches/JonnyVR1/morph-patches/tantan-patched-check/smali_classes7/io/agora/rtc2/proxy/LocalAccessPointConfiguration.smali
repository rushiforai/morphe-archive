.class public Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;,
        Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$LogUploadServerInfo;
    }
.end annotation


# instance fields
.field public advancedConfig:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;

.field public disableAut:Z

.field public domainList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public ipList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mode:I

.field public verifyDomainName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->ipList:Ljava/util/ArrayList;

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->domainList:Ljava/util/ArrayList;

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->verifyDomainName:Ljava/lang/String;

    const/4 v1, 0x0

    iput v1, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->mode:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->disableAut:Z

    iput-object v0, p0, Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;->advancedConfig:Lio/agora/rtc2/proxy/LocalAccessPointConfiguration$AdvancedConfigInfo;

    return-void
.end method
