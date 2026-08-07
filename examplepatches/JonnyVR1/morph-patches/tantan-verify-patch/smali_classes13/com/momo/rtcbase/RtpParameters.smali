.class public Lcom/momo/rtcbase/RtpParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/RtpParameters$HeaderExtension;,
        Lcom/momo/rtcbase/RtpParameters$Rtcp;,
        Lcom/momo/rtcbase/RtpParameters$Codec;,
        Lcom/momo/rtcbase/RtpParameters$Encoding;
    }
.end annotation


# instance fields
.field public final codecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Codec;",
            ">;"
        }
    .end annotation
.end field

.field public final encodings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Encoding;",
            ">;"
        }
    .end annotation
.end field

.field private final headerExtensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$HeaderExtension;",
            ">;"
        }
    .end annotation
.end field

.field private final rtcp:Lcom/momo/rtcbase/RtpParameters$Rtcp;

.field public final transactionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/momo/rtcbase/RtpParameters$Rtcp;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/RtpParameters$Rtcp;",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$HeaderExtension;",
            ">;",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Encoding;",
            ">;",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Codec;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/RtpParameters;->transactionId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/RtpParameters;->rtcp:Lcom/momo/rtcbase/RtpParameters$Rtcp;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/RtpParameters;->headerExtensions:Ljava/util/List;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/momo/rtcbase/RtpParameters;->encodings:Ljava/util/List;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/momo/rtcbase/RtpParameters;->codecs:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getCodecs()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Codec;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters;->codecs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEncodings()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$Encoding;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters;->encodings:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeaderExtensions()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/RtpParameters$HeaderExtension;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters;->headerExtensions:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcp()Lcom/momo/rtcbase/RtpParameters$Rtcp;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters;->rtcp:Lcom/momo/rtcbase/RtpParameters$Rtcp;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters;->transactionId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
