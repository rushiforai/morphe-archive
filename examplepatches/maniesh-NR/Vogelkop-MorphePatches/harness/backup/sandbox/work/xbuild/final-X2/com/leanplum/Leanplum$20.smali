.class synthetic Lcom/leanplum/Leanplum$20;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/Leanplum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$leanplum$PushProviderType:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lcom/leanplum/PushProviderType;->values()[Lcom/leanplum/PushProviderType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/leanplum/Leanplum$20;->$SwitchMap$com$leanplum$PushProviderType:[I

    :try_start_9
    sget-object v1, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lcom/leanplum/Leanplum$20;->$SwitchMap$com$leanplum$PushProviderType:[I

    sget-object v1, Lcom/leanplum/PushProviderType;->MIPUSH:Lcom/leanplum/PushProviderType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    return-void
.end method
