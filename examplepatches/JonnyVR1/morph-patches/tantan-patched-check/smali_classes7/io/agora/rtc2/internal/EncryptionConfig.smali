.class public Lio/agora/rtc2/internal/EncryptionConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;
    }
.end annotation


# instance fields
.field public datastreamEncryptionEnabled:Z

.field public final encryptionKdfSalt:[B

.field public encryptionKey:Ljava/lang/String;

.field public encryptionMode:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lio/agora/rtc2/internal/EncryptionConfig;->encryptionKdfSalt:[B

    sget-object v1, Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;->AES_128_GCM2:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    iput-object v1, p0, Lio/agora/rtc2/internal/EncryptionConfig;->encryptionMode:Lio/agora/rtc2/internal/EncryptionConfig$EncryptionMode;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/rtc2/internal/EncryptionConfig;->encryptionKey:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/agora/rtc2/internal/EncryptionConfig;->datastreamEncryptionEnabled:Z

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    return-void
.end method
