.class synthetic Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$LayoutMode:[I

.field static final synthetic $SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$RenderMode:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;->values()[Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;

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
    sput-object v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$RenderMode:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;->SURFACE_VIEW:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;

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
    sget-object v2, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$RenderMode:[I

    .line 21
    .line 22
    sget-object v3, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;->TEXTURE_VIEW:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;

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
    invoke-static {}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;->values()[Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;

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
    sput-object v2, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$LayoutMode:[I

    .line 38
    .line 39
    :try_start_2
    sget-object v3, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;->ALIGN_BOTTOM:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;

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
    sget-object v1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$LayoutMode:[I

    .line 48
    .line 49
    sget-object v2, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;->FIXED_SIZE:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;

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
    :try_start_4
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$LayoutMode:[I

    .line 58
    .line 59
    sget-object v1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;->CENTER_CROP:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v2, 0x3

    .line 66
    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 67
    .line 68
    :catch_4
    return-void
.end method
