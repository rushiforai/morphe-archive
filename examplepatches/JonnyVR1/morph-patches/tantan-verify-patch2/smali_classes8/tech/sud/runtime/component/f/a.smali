.class public final Ltech/sud/runtime/component/f/a;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/f/a$a;
    }
.end annotation


# instance fields
.field private a:Landroid/widget/TextView;

.field private b:Landroid/webkit/WebView;

.field private c:Z

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private e:Z

.field private f:I

.field private g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ltech/sud/runtime/component/f/a;->c:Z

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ltech/sud/runtime/component/f/a;->d:Ljava/util/List;

    .line 18
    .line 19
    iput-boolean v0, p0, Ltech/sud/runtime/component/f/a;->e:Z

    .line 20
    .line 21
    iput v0, p0, Ltech/sud/runtime/component/f/a;->f:I

    .line 22
    .line 23
    iput v0, p0, Ltech/sud/runtime/component/f/a;->g:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Ltech/sud/runtime/component/f/a;->c:Z

    .line 27
    .line 28
    const-string v2, "file:////android_asset/JSConsole/index.html"

    .line 29
    .line 30
    invoke-static {p1, v2}, Ltech/sud/runtime/component/h/a;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    iput-boolean v1, p0, Ltech/sud/runtime/component/f/a;->e:Z

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    new-instance v4, Landroid/webkit/WebView;

    .line 48
    .line 49
    invoke-direct {v4, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    iput-object v4, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 53
    .line 54
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    const/4 v6, -0x1

    .line 57
    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 64
    .line 65
    invoke-direct {v4, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, p0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 72
    .line 73
    invoke-virtual {p2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 93
    .line 94
    new-instance v0, Landroid/webkit/WebChromeClient;

    .line 95
    .line 96
    invoke-direct {v0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 103
    .line 104
    new-instance v0, Ltech/sud/runtime/component/f/a$1;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/f/a$1;-><init>(Ltech/sud/runtime/component/f/a;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 110
    .line 111
    .line 112
    new-instance p2, Ltech/sud/runtime/component/f/a$a;

    .line 113
    .line 114
    invoke-direct {p2, p0, p1}, Ltech/sud/runtime/component/f/a$a;-><init>(Ltech/sud/runtime/component/f/a;Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    iput-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 118
    .line 119
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 120
    .line 121
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 122
    .line 123
    .line 124
    const p2, -0xff954e

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 128
    .line 129
    .line 130
    iget p2, v3, Landroid/util/DisplayMetrics;->density:F

    .line 131
    .line 132
    const/high16 v0, 0x41700000    # 15.0f

    .line 133
    .line 134
    mul-float/2addr p2, v0

    .line 135
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 136
    .line 137
    .line 138
    const/high16 p2, -0x1000000

    .line 139
    .line 140
    invoke-virtual {p1, v1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 144
    .line 145
    const/16 v1, 0x1e

    .line 146
    .line 147
    const/4 v3, 0x7

    .line 148
    invoke-virtual {p2, v1, v3, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 149
    .line 150
    .line 151
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 152
    .line 153
    const-string v1, "JSConsole"

    .line 154
    .line 155
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 161
    .line 162
    .line 163
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 164
    .line 165
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 169
    .line 170
    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    .line 172
    .line 173
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 174
    .line 175
    const/4 p2, -0x2

    .line 176
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 177
    .line 178
    .line 179
    iget-object p2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 180
    .line 181
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    .line 183
    .line 184
    new-instance p1, Ltech/sud/runtime/component/f/a$2;

    .line 185
    .line 186
    invoke-direct {p1, p0}, Ltech/sud/runtime/component/f/a$2;-><init>(Ltech/sud/runtime/component/f/a;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 193
    .line 194
    new-instance p2, Ltech/sud/runtime/component/f/a$3;

    .line 195
    .line 196
    invoke-direct {p2, p0}, Ltech/sud/runtime/component/f/a$3;-><init>(Ltech/sud/runtime/component/f/a;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 203
    .line 204
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method private a(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    iget v1, p0, Ltech/sud/runtime/component/f/a;->g:I

    .line 13
    .line 14
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 15
    .line 16
    add-int/2addr v2, v1

    .line 17
    const/4 v3, 0x1

    .line 18
    if-le v2, p1, :cond_1

    .line 19
    .line 20
    sub-int/2addr p1, v1

    .line 21
    add-int/lit8 p1, p1, -0x32

    .line 22
    .line 23
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 24
    .line 25
    move p1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    :goto_0
    iget v1, p0, Ltech/sud/runtime/component/f/a;->f:I

    .line 29
    .line 30
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 31
    .line 32
    add-int/2addr v2, v1

    .line 33
    if-le v2, p2, :cond_2

    .line 34
    .line 35
    sub-int/2addr p2, v1

    .line 36
    add-int/lit8 p2, p2, -0x1e

    .line 37
    .line 38
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    move v3, p1

    .line 42
    :goto_1
    if-eqz v3, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    :goto_2
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/f/a;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ltech/sud/runtime/component/f/a;->e()V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/f/a;II)V
    .locals 0

    .line 50
    invoke-direct {p0, p1, p2}, Ltech/sud/runtime/component/f/a;->a(II)V

    return-void
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ltech/sud/runtime/component/f/a;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ltech/sud/runtime/component/f/a;->d()V

    return-void
.end method

.method private c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "javascript:addLog(\'"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ltech/sud/runtime/component/f/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, "\')"

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic c(Ltech/sud/runtime/component/f/a;)Z
    .locals 0

    .line 38
    iget-boolean p0, p0, Ltech/sud/runtime/component/f/a;->c:Z

    return p0
.end method

.method private d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Ltech/sud/runtime/component/f/a;->g:I

    .line 16
    .line 17
    iget-object v2, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iput v2, p0, Ltech/sud/runtime/component/f/a;->f:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    sub-int/2addr v3, v1

    .line 30
    add-int/lit8 v3, v3, -0x32

    .line 31
    .line 32
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    sub-int/2addr v1, v2

    .line 39
    add-int/lit8 v1, v1, -0x1e

    .line 40
    .line 41
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 42
    .line 43
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->a:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltech/sud/runtime/component/f/a;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p0, v1}, Ltech/sud/runtime/component/f/a;->c(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ltech/sud/runtime/component/f/a;->d:Ljava/util/List;

    .line 40
    .line 41
    :cond_1
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Ltech/sud/runtime/component/f/a;->c:Z

    .line 52
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    .line 55
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    return-void

    .line 56
    :cond_0
    iget-boolean v0, p0, Ltech/sud/runtime/component/f/a;->e:Z

    if-nez v0, :cond_1

    .line 57
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->d:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 58
    :cond_1
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/f/a;->c(Ljava/lang/String;)V

    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ltech/sud/runtime/component/f/a;->c:Z

    .line 3
    .line 4
    iget-object p0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 33
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    const/16 v1, 0x8

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 36
    iget-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Ltech/sud/runtime/component/f/a;->b:Landroid/webkit/WebView;

    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sub-int/2addr p4, p2

    .line 5
    sub-int/2addr p5, p3

    .line 6
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string p2, "%d, %d"

    .line 19
    .line 20
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "JSConsole"

    .line 25
    .line 26
    invoke-static {p2, p1}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ltech/sud/runtime/component/f/a$4;

    .line 30
    .line 31
    invoke-direct {p1, p0, p4, p5}, Ltech/sud/runtime/component/f/a$4;-><init>(Ltech/sud/runtime/component/f/a;II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method
