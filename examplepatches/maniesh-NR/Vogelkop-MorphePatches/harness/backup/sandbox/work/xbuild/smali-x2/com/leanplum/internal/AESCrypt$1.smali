.class synthetic Lcom/leanplum/internal/AESCrypt$1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/AESCrypt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$leanplum$internal$AESCrypt$EncryptionType:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lcom/leanplum/internal/AESCrypt$EncryptionType;->values()[Lcom/leanplum/internal/AESCrypt$EncryptionType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/leanplum/internal/AESCrypt$1;->$SwitchMap$com$leanplum$internal$AESCrypt$EncryptionType:[I

    :try_start_9
    sget-object v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->LEGACY_TOKEN:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lcom/leanplum/internal/AESCrypt$1;->$SwitchMap$com$leanplum$internal$AESCrypt$EncryptionType:[I

    sget-object v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    return-void
.end method
