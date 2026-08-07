.class public Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/z4m;


# instance fields
.field public c:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public d:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public L(II)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "\u4e94\u5b98\u6e05\u6670\u7684\u6b63\u9762\u7167"

    .line 3
    .line 4
    const-string v2, "\u4e3b\u5934\u50cf\u4f7f\u7528\u672c\u4eba \u4e94\u5b98\u6e05\u6670\u7684\u6b63\u9762\u7167\uff0c\u9009\u62e9 \u5149\u7ebf\u660e\u4eae \u7684\u573a\u666f\u8fdb\u884c\u9762\u90e8\u91c7\u96c6"

    .line 5
    .line 6
    const-string v3, "#99000000"

    .line 7
    .line 8
    const-string v4, "#000000"

    .line 9
    .line 10
    const-string v5, "\u5149\u7ebf\u660e\u4eae"

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    filled-new-array {v1, v5}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Ll/gra;->z()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    move-object v3, v4

    .line 29
    :cond_0
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 34
    .line 35
    invoke-static {v2, p1, p2, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->e:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const/4 p1, 0x2

    .line 46
    if-ne p2, p1, :cond_3

    .line 47
    .line 48
    const-string p1, "\u8eab\u4efd\u4fe1\u606f\u51c6\u786e"

    .line 49
    .line 50
    filled-new-array {p1, v5}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {}, Ll/gra;->z()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    move-object v3, v4

    .line 65
    :cond_2
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 70
    .line 71
    const-string v1, "\u786e\u8ba4\u8f93\u5165\u7684\u8eab\u4efd\u4fe1\u606f\u51c6\u786e\u65e0\u8bef\uff0c\u9009\u62e9\u5149\u7ebf\u660e\u4eae\u7684\u573a\u666f\u8fdb\u884c\u9762\u90e8\u91c7\u96c6"

    .line 72
    .line 73
    invoke-static {v1, p1, p2, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->e:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    const/4 p1, 0x3

    .line 84
    if-ne p2, p1, :cond_5

    .line 85
    .line 86
    filled-new-array {v1, v5}, [Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {}, Ll/gra;->z()Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_4

    .line 99
    .line 100
    move-object v3, v4

    .line 101
    :cond_4
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 106
    .line 107
    invoke-static {v2, p1, p2, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->e:Lv/VText;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :cond_5
    return-void
.end method

.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e07;->a(Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->c:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 24
    .line 25
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRURkdWNlgzS1o2V01RMlBXWDQ3RVZLUUw1NEw3RjE0IiwidyI6MTU2LCJoIjoxOTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NjE5NTM4MTc4NjM3NzE0NzcxfQ.png"

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->d:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 33
    .line 34
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjMyNTRER05GQTVLQklQM0RGQ0lXRU9aS1FGN09RUjE0IiwidyI6MTU2LCJoIjoxOTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1MDA1MTY2NTUzNjYzOTQ5NDIyfQ.png"

    .line 35
    .line 36
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->c:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 43
    .line 44
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNZRUpXVU9XR0pVVDRQQjVXNE4yNk9ZWkwyNDJQTDE0IiwidyI6MTU2LCJoIjoxOTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTAyMDQ4Nzk1MzA1NzU3MjAzfQ.png"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/result/CoreAvatarVerificationFailLayout;->d:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 52
    .line 53
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFDUEtRNlJZWUZTV0ZFV01OVlhRTENaWkhIVU4zWTE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTE1NzYyMTE3MDIyOTkxNzM2Nn0.png"

    .line 54
    .line 55
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
