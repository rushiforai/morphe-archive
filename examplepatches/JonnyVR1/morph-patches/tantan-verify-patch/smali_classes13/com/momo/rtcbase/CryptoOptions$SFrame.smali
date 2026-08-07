.class public final Lcom/momo/rtcbase/CryptoOptions$SFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/CryptoOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SFrame"
.end annotation


# instance fields
.field private final requireFrameEncryption:Z

.field final synthetic this$0:Lcom/momo/rtcbase/CryptoOptions;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/CryptoOptions;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CryptoOptions$SFrame;->this$0:Lcom/momo/rtcbase/CryptoOptions;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/momo/rtcbase/CryptoOptions$SFrame;->requireFrameEncryption:Z

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/CryptoOptions;ZLcom/momo/rtcbase/CryptoOptions$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/CryptoOptions$SFrame;-><init>(Lcom/momo/rtcbase/CryptoOptions;Z)V

    return-void
.end method


# virtual methods
.method public getRequireFrameEncryption()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "SFrame"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/CryptoOptions$SFrame;->requireFrameEncryption:Z

    .line 2
    .line 3
    return p0
.end method
