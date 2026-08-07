.class public Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/r3m;


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;

.field public f:Lv/VText;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private d(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->g:Lv/VText;

    .line 28
    .line 29
    invoke-static {p4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p2, Lcom/p1/mobile/putong/core/R$string;->tr:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget p3, Lcom/p1/mobile/putong/core/R$string;->rr:I

    .line 52
    .line 53
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    sget p4, Lcom/p1/mobile/putong/core/R$string;->sr:I

    .line 62
    .line 63
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->g:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v1, Lcom/p1/mobile/putong/core/R$string;->qr:I

    .line 74
    .line 75
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {p1, p2, p3}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    sget p3, Ll/c9c0;->O1:I

    .line 96
    .line 97
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    const/4 p3, 0x3

    .line 102
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-static {v0, p1, p2, p3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->g:Lv/VText;

    .line 114
    .line 115
    const/16 p2, 0x11

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->f:Lv/VText;

    .line 121
    .line 122
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ur:I

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->d:Landroid/widget/ImageView;

    .line 128
    .line 129
    sget p1, Ll/dbc0;->Hm:I

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->f:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->c()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Cl:I

    .line 142
    .line 143
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->g:Lv/VText;

    .line 151
    .line 152
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Bl:I

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->d:Landroid/widget/ImageView;

    .line 158
    .line 159
    sget p1, Ll/dbc0;->Hn:I

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 162
    .line 163
    .line 164
    return-void
.end method


# virtual methods
.method public a(ZLcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StatusesItem;->text:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-direct {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->d(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->d(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fu90;->a(Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public getRenderView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getTitleView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->f:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
