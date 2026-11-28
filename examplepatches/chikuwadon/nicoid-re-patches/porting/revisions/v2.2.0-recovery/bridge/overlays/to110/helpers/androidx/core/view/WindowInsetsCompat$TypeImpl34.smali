.class final Landroidx/core/view/WindowInsetsCompat$TypeImpl34;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TypeImpl34"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 2842
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2843
    return-void
.end method

.method static toPlatformType(I)I
    .registers 4
    .param p0, "typeMask"    # I

    .line 2851
    const/4 v0, 0x0

    .line 2852
    .local v0, "result":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x200

    if-gt v1, v2, :cond_1

    .line 2853
    and-int v2, p0, v1

    if-eqz v2, :cond_0

    .line 2854
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 2880
    :sswitch_0
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemOverlays()I

    move-result v2

    or-int/2addr v0, v2

    goto :goto_1

    .line 2877
    :sswitch_1
    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v2

    or-int/2addr v0, v2

    .line 2878
    goto :goto_1

    .line 2874
    :sswitch_2
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    move-result v2

    or-int/2addr v0, v2

    .line 2875
    goto :goto_1

    .line 2871
    :sswitch_3
    invoke-static {}, Landroid/view/WindowInsets$Type;->mandatorySystemGestures()I

    move-result v2

    or-int/2addr v0, v2

    .line 2872
    goto :goto_1

    .line 2868
    :sswitch_4
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    move-result v2

    or-int/2addr v0, v2

    .line 2869
    goto :goto_1

    .line 2865
    :sswitch_5
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    move-result v2

    or-int/2addr v0, v2

    .line 2866
    goto :goto_1

    .line 2862
    :sswitch_6
    invoke-static {}, Landroid/view/WindowInsets$Type;->captionBar()I

    move-result v2

    or-int/2addr v0, v2

    .line 2863
    goto :goto_1

    .line 2859
    :sswitch_7
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v2

    or-int/2addr v0, v2

    .line 2860
    goto :goto_1

    .line 2856
    :sswitch_8
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v2

    or-int/2addr v0, v2

    .line 2857
    nop

    .line 2852
    :cond_0
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2885
    .end local v1    # "i":I
    :cond_1
    return v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_7
        0x4 -> :sswitch_6
        0x8 -> :sswitch_5
        0x10 -> :sswitch_4
        0x20 -> :sswitch_3
        0x40 -> :sswitch_2
        0x80 -> :sswitch_1
        0x200 -> :sswitch_0
    .end sparse-switch
.end method
