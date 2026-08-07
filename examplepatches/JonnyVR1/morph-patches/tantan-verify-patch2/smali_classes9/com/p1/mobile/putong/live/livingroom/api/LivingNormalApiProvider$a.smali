.class public synthetic Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;->values()[Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$a;->b:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;->NORMAL_TO_CALL:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    const/4 v0, 0x2

    .line 20
    :try_start_1
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$a;->b:[I

    .line 21
    .line 22
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;->CALL_TO_NORMAL:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 29
    .line 30
    :catch_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;->values()[Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    array-length v2, v2

    .line 35
    new-array v2, v2, [I

    .line 36
    .line 37
    sput-object v2, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$a;->a:[I

    .line 38
    .line 39
    :try_start_2
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;->VIDEO_TYPE:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;

    .line 40
    .line 41
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    aput v1, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 46
    .line 47
    :catch_2
    :try_start_3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$a;->a:[I

    .line 48
    .line 49
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;->VOICE_TYPE:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    aput v0, v1, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 56
    .line 57
    :catch_3
    return-void
.end method
