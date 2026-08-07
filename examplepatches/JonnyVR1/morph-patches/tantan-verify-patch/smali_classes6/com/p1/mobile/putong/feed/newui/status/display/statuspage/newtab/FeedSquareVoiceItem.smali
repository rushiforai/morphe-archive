.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public i:Landroid/widget/Space;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static i0(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/graphics/drawable/GradientDrawable;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    new-array v1, v1, [I

    .line 20
    .line 21
    move v2, v0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ge v2, v3, :cond_1

    .line 27
    .line 28
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    aput v3, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x2

    .line 48
    new-array v1, p0, [I

    .line 49
    .line 50
    const-string p0, "#c9bdff"

    .line 51
    .line 52
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    aput p0, v1, v0

    .line 57
    .line 58
    const-string p0, "#cdecff"

    .line 59
    .line 60
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    const/4 v0, 0x1

    .line 65
    aput p0, v1, v0

    .line 66
    .line 67
    :cond_1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 68
    .line 69
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 70
    .line 71
    invoke-direct {p0, v0, v1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 72
    .line 73
    .line 74
    sget v0, Ll/qa00;->i:I

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 83
    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r1i;->a(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/c2i;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Ll/c2i;->c:Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->h:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->h:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->l0()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->h:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 39
    .line 40
    iget-object v4, p1, Ll/c2i;->c:Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 41
    .line 42
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {v2, v4, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->n0(Ljava/util/List;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->h:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 49
    .line 50
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 60
    .line 61
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->g:Lv/VText;

    .line 68
    .line 69
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 70
    .line 71
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v2}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const/16 v2, 0x3e8

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_2

    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 128
    .line 129
    iget-object v1, p1, Ll/c2i;->c:Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 132
    .line 133
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 134
    .line 135
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->i0(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p1, Ll/c2i;->c:Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Ljava/lang/String;

    .line 153
    .line 154
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

    .line 155
    .line 156
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->setContentColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :catch_0
    move-exception p1

    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

    .line 166
    .line 167
    const-string v0, "#ffffff"

    .line 168
    .line 169
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->setContentColor(I)V

    .line 174
    .line 175
    .line 176
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 177
    .line 178
    .line 179
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
