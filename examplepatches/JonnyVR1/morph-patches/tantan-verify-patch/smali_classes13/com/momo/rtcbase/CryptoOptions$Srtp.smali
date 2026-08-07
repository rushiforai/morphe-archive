.class public final Lcom/momo/rtcbase/CryptoOptions$Srtp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/CryptoOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Srtp"
.end annotation


# instance fields
.field private final enableAes128Sha1_32CryptoCipher:Z

.field private final enableEncryptedRtpHeaderExtensions:Z

.field private final enableGcmCryptoSuites:Z

.field final synthetic this$0:Lcom/momo/rtcbase/CryptoOptions;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/CryptoOptions;ZZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->this$0:Lcom/momo/rtcbase/CryptoOptions;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableGcmCryptoSuites:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableAes128Sha1_32CryptoCipher:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableEncryptedRtpHeaderExtensions:Z

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/CryptoOptions;ZZZLcom/momo/rtcbase/CryptoOptions$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/rtcbase/CryptoOptions$Srtp;-><init>(Lcom/momo/rtcbase/CryptoOptions;ZZZ)V

    return-void
.end method


# virtual methods
.method public getEnableAes128Sha1_32CryptoCipher()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Srtp"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableAes128Sha1_32CryptoCipher:Z

    .line 2
    .line 3
    return p0
.end method

.method public getEnableEncryptedRtpHeaderExtensions()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Srtp"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableEncryptedRtpHeaderExtensions:Z

    .line 2
    .line 3
    return p0
.end method

.method public getEnableGcmCryptoSuites()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Srtp"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/CryptoOptions$Srtp;->enableGcmCryptoSuites:Z

    .line 2
    .line 3
    return p0
.end method
