.class public final Lcom/p1/mobile/putong/live/base/vap/mix/Src;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/vap/mix/Src$a;,
        Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;,
        Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;,
        Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;,
        Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0018\u0000 O2\u00020\u0001:\u0005\tPQRSB\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rR\"\u0010\u0012\u001a\u00020\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\t\u0010\u000e\u001a\u0004\u0008\u000f\u0010\r\"\u0004\u0008\u0010\u0010\u0011R\"\u0010\u001a\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\"\u0010\u001e\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001b\u0010\u0015\u001a\u0004\u0008\u001c\u0010\u0017\"\u0004\u0008\u001d\u0010\u0019R\"\u0010\"\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001f\u0010\u0015\u001a\u0004\u0008 \u0010\u0017\"\u0004\u0008!\u0010\u0019R\"\u0010$\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008 \u0010\u0015\u001a\u0004\u0008\u001f\u0010\u0017\"\u0004\u0008#\u0010\u0019R\"\u0010,\u001a\u00020%8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008&\u0010\'\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+R\"\u00102\u001a\u00020-8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010.\u001a\u0004\u0008\u001e\u0010/\"\u0004\u00080\u00101R\"\u00105\u001a\u00020\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u000e\u001a\u0004\u00083\u0010\r\"\u0004\u00084\u0010\u0011R\"\u00108\u001a\u00020\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u000e\u001a\u0004\u00086\u0010\r\"\u0004\u00087\u0010\u0011R\"\u0010?\u001a\u0002098\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00083\u0010:\u001a\u0004\u0008;\u0010<\"\u0004\u0008=\u0010>R\"\u0010B\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008@\u0010\u0015\u001a\u0004\u0008\u001b\u0010\u0017\"\u0004\u0008A\u0010\u0019R\"\u0010H\u001a\u00020C8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008(\u0010D\u001a\u0004\u0008&\u0010E\"\u0004\u0008F\u0010GR\"\u0010J\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008;\u0010\u0015\u001a\u0004\u0008@\u0010\u0017\"\u0004\u0008I\u0010\u0019R.\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010K\u001a\u0004\u0018\u00010\u00068\u0006@FX\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00086\u0010L\u001a\u0004\u0008\u0014\u0010M\"\u0004\u0008N\u0010\n\u00a8\u0006T"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src;",
        "",
        "Lorg/json/JSONObject;",
        "json",
        "<init>",
        "(Lorg/json/JSONObject;)V",
        "Landroid/graphics/Bitmap;",
        "bitmap",
        "",
        "a",
        "(Landroid/graphics/Bitmap;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "Ljava/lang/String;",
        "i",
        "setSrcId",
        "(Ljava/lang/String;)V",
        "srcId",
        "",
        "b",
        "I",
        "o",
        "()I",
        "setW",
        "(I)V",
        "w",
        "c",
        "g",
        "setH",
        "h",
        "d",
        "e",
        "setDrawWidth",
        "drawWidth",
        "setDrawHeight",
        "drawHeight",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;",
        "f",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;",
        "l",
        "()Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;",
        "setSrcType",
        "(Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;)V",
        "srcType",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;",
        "()Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;",
        "setLoadType",
        "(Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;)V",
        "loadType",
        "j",
        "setSrcTag",
        "srcTag",
        "n",
        "r",
        "txt",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;",
        "m",
        "()Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;",
        "setStyle",
        "(Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;)V",
        "style",
        "k",
        "setColor",
        "color",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;",
        "Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;",
        "()Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;",
        "setFitType",
        "(Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;)V",
        "fitType",
        "q",
        "srcTextureId",
        "value",
        "Landroid/graphics/Bitmap;",
        "()Landroid/graphics/Bitmap;",
        "p",
        "Companion",
        "SrcType",
        "LoadType",
        "FitType",
        "Style",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/live/base/vap/mix/Src$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public h:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public i:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public k:I

.field public l:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public m:I

.field public n:Landroid/graphics/Bitmap;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/live/base/vap/mix/Src$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->Companion:Lcom/p1/mobile/putong/live/base/vap/mix/Src$a;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 9
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->a:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;->UNKNOWN:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->f:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;->UNKNOWN:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 16
    .line 17
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->g:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->h:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->i:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v3, Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;->DEFAULT:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;

    .line 24
    .line 25
    iput-object v3, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->j:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;

    .line 26
    .line 27
    sget-object v4, Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;->FIT_XY:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 28
    .line 29
    iput-object v4, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->l:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 30
    .line 31
    const-string v5, "srcId"

    .line 32
    .line 33
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    iput-object v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->a:Ljava/lang/String;

    .line 41
    .line 42
    const-string v5, "w"

    .line 43
    .line 44
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    iput v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->b:I

    .line 49
    .line 50
    const-string v5, "h"

    .line 51
    .line 52
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    iput v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->c:I

    .line 57
    .line 58
    const-string v5, "color"

    .line 59
    .line 60
    const-string v6, "#000000"

    .line 61
    .line 62
    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-nez v7, :cond_0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    move-object v6, v5

    .line 77
    :goto_0
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    iput v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->k:I

    .line 82
    .line 83
    const-string v5, "srcTag"

    .line 84
    .line 85
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    iput-object v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->h:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v5, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->i:Ljava/lang/String;

    .line 95
    .line 96
    const-string v5, "srcType"

    .line 97
    .line 98
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    sget-object v7, Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;->IMG:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 103
    .line 104
    invoke-virtual {v7}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;->getType()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-static {v5, v8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    if-eqz v8, :cond_1

    .line 113
    .line 114
    :goto_1
    move-object v1, v7

    .line 115
    goto :goto_2

    .line 116
    :cond_1
    sget-object v7, Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;->TXT:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 117
    .line 118
    invoke-virtual {v7}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;->getType()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-static {v5, v8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_2

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    :goto_2
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->f:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 130
    .line 131
    const-string v1, "loadType"

    .line 132
    .line 133
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    sget-object v5, Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;->NET:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 138
    .line 139
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;->getType()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    if-eqz v7, :cond_3

    .line 148
    .line 149
    :goto_3
    move-object v2, v5

    .line 150
    goto :goto_4

    .line 151
    :cond_3
    sget-object v5, Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;->LOCAL:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 152
    .line 153
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;->getType()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_4

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_4
    :goto_4
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->g:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 165
    .line 166
    const-string v1, "fitType"

    .line 167
    .line 168
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    sget-object v2, Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;->CENTER_FULL:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 173
    .line 174
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;->getType()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_5

    .line 183
    .line 184
    move-object v4, v2

    .line 185
    :cond_5
    iput-object v4, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->l:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 186
    .line 187
    const-string v1, "style"

    .line 188
    .line 189
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    sget-object v0, Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;->BOLD:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;->getStyle()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_6

    .line 204
    .line 205
    move-object v3, v0

    .line 206
    :cond_6
    iput-object v3, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->j:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;

    .line 207
    .line 208
    sget-object p1, Ll/z0;->INSTANCE:Ll/z0;

    .line 209
    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p0, " color="

    .line 219
    .line 220
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    const-string v0, "AnimPlayer.Src"

    .line 231
    .line 232
    invoke-virtual {p1, v0, p0}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->b:I

    .line 9
    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->c:I

    .line 18
    .line 19
    :goto_1
    iput v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->d:I

    .line 20
    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->e:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->l:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;->CENTER_FULL:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 26
    .line 27
    if-ne v1, v2, :cond_4

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->b:I

    .line 30
    .line 31
    if-eqz v1, :cond_4

    .line 32
    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->c:I

    .line 34
    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    int-to-float v3, v1

    .line 39
    int-to-float v4, v2

    .line 40
    div-float/2addr v3, v4

    .line 41
    int-to-float v0, v0

    .line 42
    int-to-float p1, p1

    .line 43
    div-float/2addr v0, p1

    .line 44
    cmpl-float p1, v0, v3

    .line 45
    .line 46
    if-ltz p1, :cond_3

    .line 47
    .line 48
    iput v2, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->e:I

    .line 49
    .line 50
    int-to-float p1, v2

    .line 51
    mul-float/2addr p1, v0

    .line 52
    float-to-int p1, p1

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->d:I

    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    iput v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->d:I

    .line 57
    .line 58
    int-to-float p1, v1

    .line 59
    div-float/2addr p1, v0

    .line 60
    float-to-int p1, p1

    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->e:I

    .line 62
    .line 63
    :cond_4
    :goto_2
    return-void
.end method

.method public final b()Landroid/graphics/Bitmap;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->n:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->l:Lcom/p1/mobile/putong/live/base/vap/mix/Src$FitType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->g:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public final l()Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->f:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m()Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->j:Lcom/p1/mobile/putong/live/base/vap/mix/Src$Style;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final o()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final p(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->n:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->a(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->i:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->f:Lcom/p1/mobile/putong/live/base/vap/mix/Src$SrcType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->g:Lcom/p1/mobile/putong/live/base/vap/mix/Src$LoadType;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->h:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->n:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/mix/Src;->i:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v5, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v6, "Src(srcId=\'"

    .line 16
    .line 17
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "\', srcType="

    .line 24
    .line 25
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, ", loadType="

    .line 32
    .line 33
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, ", srcTag=\'"

    .line 40
    .line 41
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, "\', bitmap="

    .line 48
    .line 49
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, ", txt=\'"

    .line 56
    .line 57
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, "\')"

    .line 64
    .line 65
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
