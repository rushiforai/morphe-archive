.class public Lio/agora/rtc2/ExtensionContext;
.super Ljava/lang/Object;


# instance fields
.field public extensionName:Ljava/lang/String;

.field public isValid:Z

.field public providerName:Ljava/lang/String;

.field public uid:I


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/ExtensionContext;->isValid:Z

    iput v0, p0, Lio/agora/rtc2/ExtensionContext;->uid:I

    const-string v0, ""

    iput-object v0, p0, Lio/agora/rtc2/ExtensionContext;->providerName:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/ExtensionContext;->extensionName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/ExtensionContext;->isValid:Z

    iput p1, p0, Lio/agora/rtc2/ExtensionContext;->uid:I

    iput-object p2, p0, Lio/agora/rtc2/ExtensionContext;->providerName:Ljava/lang/String;

    iput-object p3, p0, Lio/agora/rtc2/ExtensionContext;->extensionName:Ljava/lang/String;

    return-void
.end method
