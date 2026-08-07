.class Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$4;
.super Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$4;->this$0:Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$1;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public doFormat(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string p0, "codec_profile_id"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->getInteger(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sparse-switch p0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :sswitch_0
    const-string p0, "High 4:4:4 Intra"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_1
    const-string p0, "High 4:2:2 Intra"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_2
    const-string p0, "High 10 Intra"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_3
    const-string p0, "Constrained Baseline"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :sswitch_4
    const-string p0, "High 4:4:4 Predictive"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :sswitch_5
    const-string p0, "High 4:4:4"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_6
    const-string p0, "High 4:2:2"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :sswitch_7
    const-string p0, "High 10"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_8
    const-string p0, "High"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :sswitch_9
    const-string p0, "Extended"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_a
    const-string p0, "Main"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :sswitch_b
    const-string p0, "Baseline"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :sswitch_c
    const-string p0, "CAVLC 4:4:4"

    .line 49
    .line 50
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, "codec_name"

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    const-string v1, "h264"

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_1

    .line 77
    .line 78
    const-string p0, "codec_level"

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->getInteger(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    const/16 p1, 0xa

    .line 85
    .line 86
    if-ge p0, p1, :cond_0

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_0
    const-string v1, " Profile Level "

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    div-int/lit8 v1, p0, 0xa

    .line 99
    .line 100
    rem-int/2addr v1, p1

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    rem-int/2addr p0, p1

    .line 105
    if-eqz p0, :cond_1

    .line 106
    .line 107
    const-string p1, "."

    .line 108
    .line 109
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    nop

    .line 121
    :sswitch_data_0
    .sparse-switch
        0x2c -> :sswitch_c
        0x42 -> :sswitch_b
        0x4d -> :sswitch_a
        0x58 -> :sswitch_9
        0x64 -> :sswitch_8
        0x6e -> :sswitch_7
        0x7a -> :sswitch_6
        0x90 -> :sswitch_5
        0xf4 -> :sswitch_4
        0x242 -> :sswitch_3
        0x86e -> :sswitch_2
        0x87a -> :sswitch_1
        0x8f4 -> :sswitch_0
    .end sparse-switch
.end method
