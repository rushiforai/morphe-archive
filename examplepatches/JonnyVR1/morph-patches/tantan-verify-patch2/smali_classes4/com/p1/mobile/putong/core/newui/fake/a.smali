.class public Lcom/p1/mobile/putong/core/newui/fake/a;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VText;

.field public g:Landroid/widget/TextView;

.field public h:Ll/l4g0;

.field public i:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/a;->v(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/fake/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/a;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/fake/a;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/fake/a;->x(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/fake/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/a;->y(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/newui/fake/a;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method private v(Landroid/content/Context;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/fake/a;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/fake/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "button_type_fake"

    .line 5
    .line 6
    const-string p1, "close"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_fake_togood_upload_button"

    .line 17
    .line 18
    const-string v0, "p_fake_togood_upload"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 10

    .line 1
    const-string p1, "button_type_fake"

    .line 2
    .line 3
    const-string v0, "open"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_fake_togood_upload_button"

    .line 14
    .line 15
    const-string v1, "p_fake_togood_upload"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 31
    .line 32
    const/4 v8, 0x1

    .line 33
    iget-object v9, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x1

    .line 39
    const-string v5, "fakeView"

    .line 40
    .line 41
    const/4 v7, 0x0

    .line 42
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    new-instance v2, Ll/xyf;

    .line 53
    .line 54
    invoke-direct {v2, p0}, Ll/xyf;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/newui/fake/b;->D(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->h:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public show()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const v1, 0x1020002

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/adc0;->q2:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/FrameLayout;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->Up:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->f:Lv/VText;

    .line 35
    .line 36
    const-string v1, "10"

    .line 37
    .line 38
    filled-new-array {v1}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "#FE7E1D"

    .line 47
    .line 48
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/4 v3, 0x2

    .line 53
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v4, "\u4e0a\u4f20\u771f\u5b9e\u5934\u50cf\uff0c\n\u83b7\u5f97\u6700\u9ad810\u500d\u66dd\u5149\uff01"

    .line 58
    .line 59
    invoke-static {v4, v1, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    const-class v0, Ll/jl80;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "p_fake_togood_upload"

    .line 73
    .line 74
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->h:Ll/l4g0;

    .line 79
    .line 80
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 84
    .line 85
    const/4 v1, 0x1

    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v2, "https://auto.tancdn.com/v1/raw/69ed17b0-409a-4fe3-a99a-059ff307359c14.pdf"

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->downloadOnly()V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v2, "https://auto.tancdn.com/v1/raw/b1d2a9e0-ce15-47b3-a0da-b25dafbb830514.pdf"

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v2, Lcom/p1/mobile/putong/core/newui/fake/a$a;

    .line 125
    .line 126
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/fake/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->i:Lcom/p1/mobile/android/app/Act;

    .line 139
    .line 140
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const-string v1, "https://auto.tancdn.com/v1/raw/72878acd-75ab-4f88-857d-eaaa2ce9a48714.pdf"

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Lcom/p1/mobile/putong/core/newui/fake/a$b;

    .line 159
    .line 160
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/fake/a$b;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->b:Landroid/widget/ImageView;

    .line 173
    .line 174
    new-instance v1, Ll/vyf;

    .line 175
    .line 176
    invoke-direct {v1, p0}, Ll/vyf;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->g:Landroid/widget/TextView;

    .line 183
    .line 184
    new-instance v1, Ll/wyf;

    .line 185
    .line 186
    invoke-direct {v1, p0}, Ll/wyf;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yyf;->b(Lcom/p1/mobile/putong/core/newui/fake/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic x(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/fake/a;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
