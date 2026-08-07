.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0016\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000 ?2\u00020\u0001:\u0001\"Bg\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0004\u0012\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u0012\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u0012\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0015J+\u0010\u001d\u001a\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001a2\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\r\u0010\u001f\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u001f\u0010\u0012J\r\u0010 \u001a\u00020\u000b\u00a2\u0006\u0004\u0008 \u0010\u0012J\u0015\u0010!\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u0004\u00a2\u0006\u0004\u0008!\u0010\u0015R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\"\u0010#R\u0014\u0010\u0006\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008$\u0010#R\u0014\u0010\u0007\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008%\u0010#R\u0014\u0010\u0008\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008&\u0010#R\u0014\u0010\t\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\'\u0010#R\u001a\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008(\u0010)R\u001a\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008*\u0010)R\u001a\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010)R\u001a\u00100\u001a\u00020\u00018\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008,\u0010-\u001a\u0004\u0008.\u0010/R\u0014\u00103\u001a\u0002018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u00102R\u0014\u00106\u001a\u0002048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u00105R\u0018\u00107\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008 \u00105R\u0018\u00108\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u00105R\u0014\u0010;\u001a\u0002098\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010:R\u0016\u0010>\u001a\u00020<8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010=\u00a8\u0006@"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "",
        "showCloseButton",
        "hasAction",
        "showExpandCollapseButton",
        "showPlayPauseButton",
        "showMuteButton",
        "Lkotlin/Function0;",
        "",
        "onCollapse",
        "onClose",
        "onAction",
        "<init>",
        "(Landroid/content/Context;ZZZZZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V",
        "n",
        "()V",
        "playing",
        "p",
        "(Z)V",
        "muted",
        "o",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "mv",
        "Ll/dc60;",
        "session",
        "onReady",
        "j",
        "(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;)V",
        "k",
        "l",
        "m",
        "a",
        "Z",
        "b",
        "c",
        "d",
        "e",
        "f",
        "Lkotlin/jvm/functions/Function0;",
        "g",
        "h",
        "i",
        "Landroid/widget/FrameLayout;",
        "getMediaContainer$clevertap_core_release",
        "()Landroid/widget/FrameLayout;",
        "mediaContainer",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;",
        "controlsOverlay",
        "Landroid/widget/ImageView;",
        "Landroid/widget/ImageView;",
        "closeBtn",
        "playPauseBtn",
        "muteBtn",
        "Landroid/widget/LinearLayout;",
        "Landroid/widget/LinearLayout;",
        "bottomRow",
        "Ll/svm;",
        "Ll/svm;",
        "currentInsets",
        "Companion",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final a:Z

.field private final b:Z

.field private final c:Z

.field private final d:Z

.field private final e:Z

.field private final f:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final h:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final i:Landroid/widget/FrameLayout;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final k:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private l:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private m:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final n:Landroid/widget/LinearLayout;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private o:Ll/svm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZZZZZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 16
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "ZZZZZ",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual/range {p8 .. p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual/range {p9 .. p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-direct/range {p0 .. p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v2, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->a:Z

    .line 27
    .line 28
    iput-boolean v3, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->b:Z

    .line 29
    .line 30
    iput-boolean v4, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->c:Z

    .line 31
    .line 32
    move/from16 v5, p5

    .line 33
    .line 34
    iput-boolean v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->d:Z

    .line 35
    .line 36
    move/from16 v5, p6

    .line 37
    .line 38
    iput-boolean v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->e:Z

    .line 39
    .line 40
    move-object/from16 v5, p7

    .line 41
    .line 42
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->f:Lkotlin/jvm/functions/Function0;

    .line 43
    .line 44
    move-object/from16 v5, p8

    .line 45
    .line 46
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->g:Lkotlin/jvm/functions/Function0;

    .line 47
    .line 48
    move-object/from16 v5, p9

    .line 49
    .line 50
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->h:Lkotlin/jvm/functions/Function0;

    .line 51
    .line 52
    sget-object v5, Ll/svm;->e:Ll/svm;

    .line 53
    .line 54
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o:Ll/svm;

    .line 58
    .line 59
    const/high16 v5, -0x1000000

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 62
    .line 63
    .line 64
    new-instance v5, Landroid/widget/FrameLayout;

    .line 65
    .line 66
    invoke-direct {v5, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->i:Landroid/widget/FrameLayout;

    .line 70
    .line 71
    new-instance v6, Ll/da60;

    .line 72
    .line 73
    invoke-direct {v6}, Ll/da60;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v5, v6}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 77
    .line 78
    .line 79
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 80
    .line 81
    const/4 v7, -0x1

    .line 82
    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    .line 87
    .line 88
    new-instance v5, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 89
    .line 90
    invoke-direct {v5, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;-><init>(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    iput-object v5, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 94
    .line 95
    const/4 v6, 0x0

    .line 96
    invoke-virtual {v5, v6}, Landroid/view/View;->setAlpha(F)V

    .line 97
    .line 98
    .line 99
    new-instance v6, Ll/ea60;

    .line 100
    .line 101
    invoke-direct {v6, v0}, Ll/ea60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v5, v6}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 105
    .line 106
    .line 107
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 108
    .line 109
    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    .line 114
    .line 115
    const/16 v6, 0x30

    .line 116
    .line 117
    invoke-static {v6, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    invoke-static {v6, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    const/16 v8, 0x8

    .line 126
    .line 127
    invoke-static {v8, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 128
    .line 129
    .line 130
    move-result v9

    .line 131
    const/16 v10, 0xc

    .line 132
    .line 133
    invoke-static {v10, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    invoke-static {v10, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 138
    .line 139
    .line 140
    move-result v10

    .line 141
    new-instance v12, Landroid/widget/ImageView;

    .line 142
    .line 143
    invoke-direct {v12, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    sget v13, Ll/wbc0;->c:I

    .line 147
    .line 148
    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 149
    .line 150
    .line 151
    sget v13, Lcom/clevertap/android/sdk/R$string;->c:I

    .line 152
    .line 153
    invoke-virtual {v1, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v13

    .line 157
    invoke-virtual {v12, v13}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    sget-object v13, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 161
    .line 162
    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 163
    .line 164
    .line 165
    if-eqz v2, :cond_0

    .line 166
    .line 167
    const/4 v2, 0x0

    .line 168
    goto :goto_0

    .line 169
    :cond_0
    move v2, v8

    .line 170
    :goto_0
    invoke-virtual {v12, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 171
    .line 172
    .line 173
    new-instance v2, Ll/fa60;

    .line 174
    .line 175
    invoke-direct {v2, v0}, Ll/fa60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v12, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    iput-object v12, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->k:Landroid/widget/ImageView;

    .line 182
    .line 183
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 184
    .line 185
    const v15, 0x800035

    .line 186
    .line 187
    .line 188
    invoke-direct {v2, v7, v7, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v9, v9, v9, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 192
    .line 193
    .line 194
    sget-object v15, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 195
    .line 196
    invoke-virtual {v5, v12, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    .line 198
    .line 199
    new-instance v2, Landroid/widget/ImageView;

    .line 200
    .line 201
    invoke-direct {v2, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 202
    .line 203
    .line 204
    sget-object v12, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 205
    .line 206
    const/4 v15, 0x1

    .line 207
    invoke-virtual {v12, v15}, Ll/ma60;->d(Z)I

    .line 208
    .line 209
    .line 210
    move-result v14

    .line 211
    invoke-virtual {v2, v14}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v12, v15}, Ll/ma60;->c(Z)I

    .line 215
    .line 216
    .line 217
    move-result v14

    .line 218
    invoke-virtual {v1, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    invoke-virtual {v2, v14}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2, v13}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v2, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 229
    .line 230
    .line 231
    iput-object v2, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 232
    .line 233
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    .line 234
    .line 235
    const/16 v8, 0x11

    .line 236
    .line 237
    invoke-direct {v14, v6, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v5, v2, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    .line 242
    .line 243
    new-instance v2, Landroid/widget/LinearLayout;

    .line 244
    .line 245
    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 246
    .line 247
    .line 248
    const/4 v6, 0x0

    .line 249
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 250
    .line 251
    .line 252
    const/16 v8, 0x10

    .line 253
    .line 254
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 255
    .line 256
    .line 257
    iput-object v2, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->n:Landroid/widget/LinearLayout;

    .line 258
    .line 259
    new-instance v8, Landroid/widget/ImageView;

    .line 260
    .line 261
    invoke-direct {v8, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 262
    .line 263
    .line 264
    sget v14, Ll/wbc0;->e:I

    .line 265
    .line 266
    invoke-virtual {v8, v14}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 267
    .line 268
    .line 269
    sget v14, Lcom/clevertap/android/sdk/R$string;->a:I

    .line 270
    .line 271
    invoke-virtual {v1, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v14

    .line 275
    invoke-virtual {v8, v14}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v8, v13}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 279
    .line 280
    .line 281
    if-eqz v3, :cond_1

    .line 282
    .line 283
    move v3, v6

    .line 284
    goto :goto_1

    .line 285
    :cond_1
    const/16 v3, 0x8

    .line 286
    .line 287
    :goto_1
    invoke-virtual {v8, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 288
    .line 289
    .line 290
    new-instance v3, Ll/ga60;

    .line 291
    .line 292
    invoke-direct {v3, v0}, Ll/ga60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v8, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    .line 297
    .line 298
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 299
    .line 300
    invoke-direct {v3, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v2, v8, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 304
    .line 305
    .line 306
    new-instance v3, Landroid/widget/ImageView;

    .line 307
    .line 308
    invoke-direct {v3, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v12, v15}, Ll/ma60;->b(Z)I

    .line 312
    .line 313
    .line 314
    move-result v8

    .line 315
    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v12, v15}, Ll/ma60;->a(Z)I

    .line 319
    .line 320
    .line 321
    move-result v8

    .line 322
    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v8

    .line 326
    invoke-virtual {v3, v8}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v3, v13}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 330
    .line 331
    .line 332
    const/16 v8, 0x8

    .line 333
    .line 334
    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 335
    .line 336
    .line 337
    iput-object v3, v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 338
    .line 339
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 340
    .line 341
    invoke-direct {v12, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v12, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v2, v3, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 348
    .line 349
    .line 350
    new-instance v3, Landroid/widget/ImageView;

    .line 351
    .line 352
    invoke-direct {v3, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 353
    .line 354
    .line 355
    sget v12, Ll/wbc0;->d:I

    .line 356
    .line 357
    invoke-virtual {v3, v12}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 358
    .line 359
    .line 360
    sget v12, Lcom/clevertap/android/sdk/R$string;->h:I

    .line 361
    .line 362
    invoke-virtual {v1, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    invoke-virtual {v3, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v3, v13}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 370
    .line 371
    .line 372
    if-eqz v4, :cond_2

    .line 373
    .line 374
    move v8, v6

    .line 375
    :cond_2
    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 376
    .line 377
    .line 378
    new-instance v1, Ll/ha60;

    .line 379
    .line 380
    invoke-direct {v1, v0}, Ll/ha60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 384
    .line 385
    .line 386
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 387
    .line 388
    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v1, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v2, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 395
    .line 396
    .line 397
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 398
    .line 399
    const v3, 0x800055

    .line 400
    .line 401
    .line 402
    const/4 v4, -0x2

    .line 403
    invoke-direct {v1, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v1, v11, v11, v9, v11}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v5, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 410
    .line 411
    .line 412
    new-instance v1, Ll/ia60;

    .line 413
    .line 414
    invoke-direct {v1, v0}, Ll/ia60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 415
    .line 416
    .line 417
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 418
    .line 419
    .line 420
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->h:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->t()Lkotlin/Unit;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->m()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->p(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->e()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static c(Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static d(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->g:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static e(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/dgq0;->b:Ll/dgq0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static f(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/dgq0$l;->f()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {}, Ll/dgq0$l;->a()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    or-int/2addr p1, v0

    .line 19
    invoke-virtual {p2, p1}, Ll/dgq0;->f(I)Ll/svm;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o:Ll/svm;

    .line 27
    .line 28
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_0

    .line 33
    .line 34
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o:Ll/svm;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->n()V

    .line 37
    .line 38
    .line 39
    :cond_0
    sget-object p0, Ll/dgq0;->b:Ll/dgq0;

    .line 40
    .line 41
    return-object p0
.end method

.method public static g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {p0, v1, p1, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;ZILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static h(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->f:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static i(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->s()Lkotlin/Unit;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->l()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->e()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private final n()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    const/16 v2, 0xc

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->k:Landroid/widget/ImageView;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o:Ll/svm;

    .line 39
    .line 40
    iget v4, v3, Ll/svm;->b:I

    .line 41
    .line 42
    add-int/2addr v4, v0

    .line 43
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 44
    .line 45
    iget v3, v3, Ll/svm;->c:I

    .line 46
    .line 47
    add-int/2addr v3, v0

    .line 48
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 49
    .line 50
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 51
    .line 52
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->k:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->n:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o:Ll/svm;

    .line 71
    .line 72
    iget v4, v3, Ll/svm;->d:I

    .line 73
    .line 74
    add-int/2addr v4, v1

    .line 75
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 76
    .line 77
    iget v3, v3, Ll/svm;->c:I

    .line 78
    .line 79
    add-int/2addr v3, v0

    .line 80
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 81
    .line 82
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 83
    .line 84
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 85
    .line 86
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->n:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private final o(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/ma60;->b(Z)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/ma60;->a(Z)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method private final p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/ma60;->d(Z)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/ma60;->c(Z)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method


# virtual methods
.method public final getMediaContainer$clevertap_core_release()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;)V
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/dc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
            "Ll/dc60;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->i:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->i:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->i:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->n()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 41
    .line 42
    const/16 v1, 0x8

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    iget-boolean v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->d:Z

    .line 50
    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    move v3, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v3, v1

    .line 56
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    if-eqz p2, :cond_2

    .line 64
    .line 65
    iget-boolean v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->e:Z

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    move v1, v2

    .line 70
    :cond_2
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    :cond_3
    if-eqz p2, :cond_5

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->m()Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->p(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->l()Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->o(Z)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 90
    .line 91
    if-eqz p2, :cond_4

    .line 92
    .line 93
    new-instance v0, Ll/ja60;

    .line 94
    .line 95
    invoke-direct {v0, p1, p0}, Ll/ja60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 102
    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    new-instance v0, Ll/ka60;

    .line 106
    .line 107
    invoke-direct {v0, p1, p0}, Ll/ka60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    :cond_5
    new-instance p1, Ll/la60;

    .line 114
    .line 115
    invoke-direct {p1, p3}, Ll/la60;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m:Landroid/widget/ImageView;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    :cond_3
    return-void
.end method

.method public final m(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->p(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
