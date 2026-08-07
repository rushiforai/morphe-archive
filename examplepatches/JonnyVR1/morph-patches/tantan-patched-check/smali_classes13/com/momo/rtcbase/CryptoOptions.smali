.class public final Lcom/momo/rtcbase/CryptoOptions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/CryptoOptions$Builder;,
        Lcom/momo/rtcbase/CryptoOptions$SFrame;,
        Lcom/momo/rtcbase/CryptoOptions$Srtp;
    }
.end annotation


# instance fields
.field private final sframe:Lcom/momo/rtcbase/CryptoOptions$SFrame;

.field private final srtp:Lcom/momo/rtcbase/CryptoOptions$Srtp;


# direct methods
.method private constructor <init>(ZZZZ)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/CryptoOptions$Srtp;

    .line 5
    .line 6
    const/4 v5, 0x0

    .line 7
    move-object v1, p0

    .line 8
    move v2, p1

    .line 9
    move v3, p2

    .line 10
    move v4, p3

    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/momo/rtcbase/CryptoOptions$Srtp;-><init>(Lcom/momo/rtcbase/CryptoOptions;ZZZLcom/momo/rtcbase/CryptoOptions$1;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, v1, Lcom/momo/rtcbase/CryptoOptions;->srtp:Lcom/momo/rtcbase/CryptoOptions$Srtp;

    .line 15
    .line 16
    new-instance p0, Lcom/momo/rtcbase/CryptoOptions$SFrame;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-direct {p0, v1, p4, p1}, Lcom/momo/rtcbase/CryptoOptions$SFrame;-><init>(Lcom/momo/rtcbase/CryptoOptions;ZLcom/momo/rtcbase/CryptoOptions$1;)V

    .line 20
    .line 21
    .line 22
    iput-object p0, v1, Lcom/momo/rtcbase/CryptoOptions;->sframe:Lcom/momo/rtcbase/CryptoOptions$SFrame;

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(ZZZZLcom/momo/rtcbase/CryptoOptions$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/rtcbase/CryptoOptions;-><init>(ZZZZ)V

    return-void
.end method

.method public static builder()Lcom/momo/rtcbase/CryptoOptions$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/CryptoOptions$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/CryptoOptions$Builder;-><init>(Lcom/momo/rtcbase/CryptoOptions$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public getSFrame()Lcom/momo/rtcbase/CryptoOptions$SFrame;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CryptoOptions;->sframe:Lcom/momo/rtcbase/CryptoOptions$SFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSrtp()Lcom/momo/rtcbase/CryptoOptions$Srtp;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CryptoOptions;->srtp:Lcom/momo/rtcbase/CryptoOptions$Srtp;

    .line 2
    .line 3
    return-object p0
.end method
