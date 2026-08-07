.class public final Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;,
        Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$b;,
        Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u0000 82\u00020\u0001:\u0003!\u001d$B\'\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\rH\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001d\u0010\u0014\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0015\u0010\u0018\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0018\u0010\u0017J\u0015\u0010\u001a\u001a\u00020\u00112\u0006\u0010\u0019\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR\u0016\u0010\u001f\u001a\u00020\u001c8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001eR\u0016\u0010#\u001a\u00020 8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0016\u0010%\u001a\u00020 8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008$\u0010\"R\u001a\u0010)\u001a\u00060&R\u00020\u00008\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u001a\u0010+\u001a\u00060&R\u00020\u00008\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008*\u0010(R\u001c\u0010-\u001a\u0008\u0018\u00010&R\u00020\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008,\u0010(R\u0016\u00100\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008.\u0010/R\u0014\u00103\u001a\u0002018\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u0018\u00102R\u0014\u00104\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010/R\u0016\u00107\u001a\u0002058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u00106\u00a8\u00069"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;",
        "Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "onFinishInflate",
        "()V",
        "Landroid/graphics/Canvas;",
        "canvas",
        "onDraw",
        "(Landroid/graphics/Canvas;)V",
        "",
        "pro",
        "width",
        "k",
        "(FI)F",
        "j",
        "(F)I",
        "h",
        "progress",
        "i",
        "(F)F",
        "Landroid/view/Choreographer;",
        "a",
        "Landroid/view/Choreographer;",
        "choreographer",
        "Landroid/graphics/Paint;",
        "b",
        "Landroid/graphics/Paint;",
        "circlePaint",
        "c",
        "bitmapPaint",
        "Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;",
        "d",
        "Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;",
        "circleDraw1",
        "e",
        "circleDraw2",
        "f",
        "circleDraw3",
        "g",
        "F",
        "interval",
        "",
        "J",
        "frequency",
        "initialRadius",
        "",
        "Z",
        "isNormalMode",
        "Companion",
        "b_core_intlGmsRelease"
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
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Landroid/view/Choreographer;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

.field public e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

.field public f:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public g:F

.field public final h:J

.field public final i:F

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$b;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$b;

    .line 8
    .line 9
    sget v0, Ll/dbc0;->tj:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v0, Ll/dbc0;->vj:I

    .line 16
    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget v0, Ll/dbc0;->wj:I

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget v0, Ll/dbc0;->xj:I

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    sget v0, Ll/dbc0;->yj:I

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    sget v0, Ll/dbc0;->zj:I

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    sget v0, Ll/dbc0;->Aj:I

    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    sget v0, Ll/dbc0;->Bj:I

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    sget v0, Ll/dbc0;->Cj:I

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    sget v0, Ll/dbc0;->uj:I

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v10

    .line 69
    filled-new-array/range {v1 .. v10}, [Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->k:Ljava/util/List;

    .line 78
    .line 79
    sget v0, Ll/dbc0;->Dj:I

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget v0, Ll/dbc0;->Fj:I

    .line 86
    .line 87
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v0, Ll/dbc0;->Gj:I

    .line 92
    .line 93
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    sget v0, Ll/dbc0;->Hj:I

    .line 98
    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    sget v0, Ll/dbc0;->Ij:I

    .line 104
    .line 105
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    sget v0, Ll/dbc0;->Jj:I

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    sget v0, Ll/dbc0;->Kj:I

    .line 116
    .line 117
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    sget v0, Ll/dbc0;->Lj:I

    .line 122
    .line 123
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    sget v0, Ll/dbc0;->Mj:I

    .line 128
    .line 129
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v9

    .line 133
    sget v0, Ll/dbc0;->Ej:I

    .line 134
    .line 135
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v10

    .line 139
    filled-new-array/range {v1 .. v10}, [Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    sput-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->l:Ljava/util/List;

    .line 148
    .line 149
    sget v0, Ll/dbc0;->Nj:I

    .line 150
    .line 151
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sget v0, Ll/dbc0;->Pj:I

    .line 156
    .line 157
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    sget v0, Ll/dbc0;->Qj:I

    .line 162
    .line 163
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    sget v0, Ll/dbc0;->Rj:I

    .line 168
    .line 169
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    sget v0, Ll/dbc0;->Sj:I

    .line 174
    .line 175
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    sget v0, Ll/dbc0;->Tj:I

    .line 180
    .line 181
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    sget v0, Ll/dbc0;->Uj:I

    .line 186
    .line 187
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    sget v0, Ll/dbc0;->Vj:I

    .line 192
    .line 193
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v8

    .line 197
    sget v0, Ll/dbc0;->Wj:I

    .line 198
    .line 199
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object v9

    .line 203
    sget v0, Ll/dbc0;->Oj:I

    .line 204
    .line 205
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    filled-new-array/range {v1 .. v10}, [Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    sput-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->m:Ljava/util/List;

    .line 218
    .line 219
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 58
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 57
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    const p1, 0x453b8000    # 3000.0f

    .line 8
    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g:F

    .line 11
    .line 12
    const-wide/16 v0, 0xa

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->h:J

    .line 15
    .line 16
    const/16 p1, 0x46

    .line 17
    .line 18
    invoke-static {p1}, Ll/txq;->c(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    int-to-float p1, p1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->i:F

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    sget-object v0, Ll/khc0;->m0:[I

    .line 33
    .line 34
    invoke-virtual {p3, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    sget p3, Ll/khc0;->n0:I

    .line 42
    .line 43
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 48
    .line 49
    if-nez p1, :cond_0

    .line 50
    .line 51
    const p1, 0x451c4000    # 2500.0f

    .line 52
    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g:F

    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 59
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;J)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p1, "circleDraw1"

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object p1, p2

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->a()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p1, "circleDraw2"

    .line 20
    .line 21
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move-object p2, p1

    .line 26
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->a()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->f:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->a()V

    .line 34
    .line 35
    .line 36
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static final synthetic b(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic c()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->l:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic e()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic f(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic g(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final h(F)I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 2
    .line 3
    const/high16 v1, 0x437f0000    # 255.0f

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sub-float/2addr v2, p1

    .line 10
    :goto_0
    mul-float/2addr v2, v1

    .line 11
    float-to-int p0, v2

    .line 12
    return p0

    .line 13
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g:F

    .line 14
    .line 15
    const/high16 v0, 0x44fa0000    # 2000.0f

    .line 16
    .line 17
    div-float/2addr v0, p0

    .line 18
    const v3, 0x451c4000    # 2500.0f

    .line 19
    .line 20
    .line 21
    div-float/2addr v3, p0

    .line 22
    cmpg-float p0, p1, v0

    .line 23
    .line 24
    if-gez p0, :cond_1

    .line 25
    .line 26
    sub-float p0, v0, p1

    .line 27
    .line 28
    div-float/2addr p0, v0

    .line 29
    sub-float/2addr v2, p0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    cmpg-float p0, p1, v3

    .line 32
    .line 33
    if-gez p0, :cond_2

    .line 34
    .line 35
    sub-float p0, v3, p1

    .line 36
    .line 37
    sub-float/2addr v3, v0

    .line 38
    div-float v2, p0, v3

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 v2, 0x0

    .line 42
    goto :goto_0
.end method

.method public final i(F)F
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    const/high16 v0, 0x44fa0000    # 2000.0f

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g:F

    .line 11
    .line 12
    div-float/2addr v0, p0

    .line 13
    cmpg-float p0, p1, v0

    .line 14
    .line 15
    if-gez p0, :cond_1

    .line 16
    .line 17
    sub-float p0, v0, p1

    .line 18
    .line 19
    div-float/2addr p0, v0

    .line 20
    sub-float/2addr v1, p0

    .line 21
    :cond_1
    const p0, 0x3f333333    # 0.7f

    .line 22
    .line 23
    .line 24
    mul-float/2addr v1, p0

    .line 25
    const p0, 0x3e99999a    # 0.3f

    .line 26
    .line 27
    .line 28
    add-float/2addr v1, p0

    .line 29
    return v1
.end method

.method public final j(F)I
    .locals 8

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const-wide v1, 0x3fe3333333333333L    # 0.6

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    const/high16 v3, 0x437f0000    # 255.0f

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    sub-float/2addr v0, p1

    .line 15
    :goto_0
    mul-float/2addr v0, v3

    .line 16
    float-to-double p0, v0

    .line 17
    :goto_1
    mul-double/2addr p0, v1

    .line 18
    double-to-int p0, p0

    .line 19
    return p0

    .line 20
    :cond_0
    float-to-double v4, p1

    .line 21
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 22
    .line 23
    cmpg-double p0, v4, v6

    .line 24
    .line 25
    const/high16 v4, 0x40000000    # 2.0f

    .line 26
    .line 27
    if-gez p0, :cond_1

    .line 28
    .line 29
    mul-float/2addr p1, v4

    .line 30
    mul-float/2addr p1, v3

    .line 31
    float-to-double p0, p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sub-float/2addr v0, p1

    .line 34
    mul-float/2addr v0, v4

    .line 35
    goto :goto_0
.end method

.method public final k(FI)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->i:F

    .line 2
    .line 3
    div-int/lit8 p2, p2, 0x2

    .line 4
    .line 5
    int-to-float p2, p2

    .line 6
    sub-float/2addr p2, p0

    .line 7
    mul-float/2addr p2, p1

    .line 8
    add-float/2addr p0, p2

    .line 9
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "circleDraw1"

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v0, v1

    .line 18
    :cond_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->b(Landroid/graphics/Canvas;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "circleDraw2"

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    move-object v0, v1

    .line 31
    :cond_1
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->b(Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->f:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;->b(Landroid/graphics/Canvas;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->a:Landroid/view/Choreographer;

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    const-string p1, "choreographer"

    .line 46
    .line 47
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    move-object v1, p1

    .line 52
    :goto_0
    new-instance p1, Ll/qee;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/qee;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;)V

    .line 55
    .line 56
    .line 57
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->h:J

    .line 58
    .line 59
    invoke-virtual {v1, p1, v2, v3}, Landroid/view/Choreographer;->postFrameCallbackDelayed(Landroid/view/Choreographer$FrameCallback;J)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->a:Landroid/view/Choreographer;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    const-string v2, "circlePaint"

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    move-object v0, v3

    .line 35
    :cond_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    move-object v0, v3

    .line 46
    :cond_1
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    move-object v0, v3

    .line 59
    :cond_2
    sget-object v5, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move-object v0, v3

    .line 72
    :cond_3
    sget v6, Ll/qa00;->d:I

    .line 73
    .line 74
    int-to-float v6, v6

    .line 75
    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 89
    .line 90
    const-string v6, "bitmapPaint"

    .line 91
    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    move-object v0, v3

    .line 98
    :cond_4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 102
    .line 103
    if-nez v0, :cond_5

    .line 104
    .line 105
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    move-object v0, v3

    .line 109
    :cond_5
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 113
    .line 114
    if-nez v0, :cond_6

    .line 115
    .line 116
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    move-object v0, v3

    .line 120
    :cond_6
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 126
    .line 127
    if-nez v1, :cond_7

    .line 128
    .line 129
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    move-object v1, v3

    .line 133
    :cond_7
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 134
    .line 135
    if-nez v4, :cond_8

    .line 136
    .line 137
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    move-object v4, v3

    .line 141
    :cond_8
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 142
    .line 143
    if-eqz v5, :cond_9

    .line 144
    .line 145
    const/4 v5, 0x0

    .line 146
    goto :goto_0

    .line 147
    :cond_9
    const v5, 0x3e4ccccd    # 0.2f

    .line 148
    .line 149
    .line 150
    :goto_0
    invoke-direct {v0, p0, v1, v4, v5}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;Landroid/graphics/Paint;Landroid/graphics/Paint;F)V

    .line 151
    .line 152
    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 154
    .line 155
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 158
    .line 159
    if-nez v1, :cond_a

    .line 160
    .line 161
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    move-object v1, v3

    .line 165
    :cond_a
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 166
    .line 167
    if-nez v4, :cond_b

    .line 168
    .line 169
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    move-object v4, v3

    .line 173
    :cond_b
    const/high16 v5, 0x3f000000    # 0.5f

    .line 174
    .line 175
    invoke-direct {v0, p0, v1, v4, v5}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;Landroid/graphics/Paint;Landroid/graphics/Paint;F)V

    .line 176
    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 179
    .line 180
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->j:Z

    .line 181
    .line 182
    if-nez v0, :cond_e

    .line 183
    .line 184
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->b:Landroid/graphics/Paint;

    .line 187
    .line 188
    if-nez v1, :cond_c

    .line 189
    .line 190
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    move-object v1, v3

    .line 194
    :cond_c
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->c:Landroid/graphics/Paint;

    .line 195
    .line 196
    if-nez v2, :cond_d

    .line 197
    .line 198
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_d
    move-object v3, v2

    .line 203
    :goto_1
    const v2, 0x3f4ccccd    # 0.8f

    .line 204
    .line 205
    .line 206
    invoke-direct {v0, p0, v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;Landroid/graphics/Paint;Landroid/graphics/Paint;F)V

    .line 207
    .line 208
    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->f:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$a;

    .line 210
    .line 211
    :cond_e
    return-void
.end method
