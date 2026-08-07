.class public final Ll/dwn;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J)\u0010\n\u001a\u00020\t2\u0010\u0010\u0006\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ)\u0010\r\u001a\u00020\t2\u0010\u0010\u0006\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u00042\u0006\u0010\u0008\u001a\u00020\u000cH\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000eJ!\u0010\u0010\u001a\u00020\u000f2\u0010\u0010\u0006\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u0004H\u0007\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0015\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J%\u0010\u0019\u001a\u00020\u00122\u000e\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u00042\u0006\u0010\u0018\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/dwn;",
        "",
        "<init>",
        "()V",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
        "coverLabel",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;",
        "itemView",
        "",
        "b",
        "(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;",
        "a",
        "(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;)V",
        "",
        "e",
        "(Ljava/util/List;)Ljava/lang/String;",
        "",
        "linearGradient",
        "Landroid/graphics/drawable/GradientDrawable$Orientation;",
        "d",
        "(I)Landroid/graphics/drawable/GradientDrawable$Orientation;",
        "colorList",
        "position",
        "c",
        "(Ljava/util/List;I)I",
        "external_intlGmsRelease"
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
.field public static final INSTANCE:Ll/dwn;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dwn;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dwn;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/dwn;->INSTANCE:Ll/dwn;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;)V
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
            ">;",
            "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;",
            ")V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    if-eqz p0, :cond_7

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_7

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/4 v1, 0x0

    .line 49
    :goto_1
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    packed-switch v2, :pswitch_data_0

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :pswitch_0
    const-string v2, "E"

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :pswitch_1
    const-string v2, "D"

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :pswitch_2
    const-string v2, "C"

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setCPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :pswitch_3
    const-string v2, "B"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_5

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setBPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :pswitch_4
    const-string v2, "A"

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_6

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setAPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_7
    return-void

    .line 135
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final b(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
            ">;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;",
            ")V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    if-eqz p0, :cond_7

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_7

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/4 v1, 0x0

    .line 49
    :goto_1
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    packed-switch v2, :pswitch_data_0

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :pswitch_0
    const-string v2, "E"

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :pswitch_1
    const-string v2, "D"

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :pswitch_2
    const-string v2, "C"

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setCPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :pswitch_3
    const-string v2, "B"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_5

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setBPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :pswitch_4
    const-string v2, "A"

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_6

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;->setAPlateData(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_7
    return-void

    .line 135
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final e(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    if-eqz p0, :cond_4

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_4

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    const/4 v2, 0x0

    .line 34
    :goto_1
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/16 v4, 0x45

    .line 41
    .line 42
    if-eq v3, v4, :cond_3

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const-string v3, "E"

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "\u7ea2\u5305"

    .line 56
    .line 57
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    const-string p0, "1"

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_4
    :goto_2
    return-object v0
.end method


# virtual methods
.method public final c(Ljava/util/List;I)I
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lt p2, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    :cond_1
    :goto_0
    return p0
.end method

.method public final d(I)Landroid/graphics/drawable/GradientDrawable$Orientation;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->BR_TL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TR_BL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->BL_TR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
