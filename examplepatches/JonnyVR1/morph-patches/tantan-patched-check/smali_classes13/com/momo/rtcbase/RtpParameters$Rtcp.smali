.class public Lcom/momo/rtcbase/RtpParameters$Rtcp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rtcp"
.end annotation


# instance fields
.field private final cname:Ljava/lang/String;

.field private final reducedSize:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Rtcp"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/RtpParameters$Rtcp;->cname:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/momo/rtcbase/RtpParameters$Rtcp;->reducedSize:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCname()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Rtcp"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Rtcp;->cname:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReducedSize()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Rtcp"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/RtpParameters$Rtcp;->reducedSize:Z

    .line 2
    .line 3
    return p0
.end method
