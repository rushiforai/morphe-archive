.class public Lcom/tencent/could/huiyansdk/activitys/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# instance fields
.field public volatile a:Z

.field public b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tencent/could/component/common/ai/utils/TwoTuple<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic H0(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->a(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method private synthetic a(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 4

    .line 125
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->a:Z

    if-nez v0, :cond_0

    .line 126
    invoke-static {}, Ll/ugq0;->a()I

    move-result v0

    invoke-static {p2, v0}, Ll/rgq0;->a(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Ll/dde;->a(Landroid/graphics/Insets;)I

    move-result v0

    .line 127
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .line 128
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    add-int/2addr v2, v0

    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 131
    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    const/4 p1, 0x1

    .line 132
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->a:Z

    :cond_0
    return-object p2
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;)V
    .locals 0

    .line 124
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/manager/a;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/manager/a;->a:Ljava/lang/String;

    .line 20
    .line 21
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    move-object v2, v0

    .line 32
    goto :goto_0

    .line 33
    :catch_0
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 34
    .line 35
    const-string v1, "AuthFragmentManager"

    .line 36
    .line 37
    const-string v3, ""

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    invoke-virtual {v0, v4, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/manager/a;->a(Landroidx/fragment/app/Fragment;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 52
    .line 53
    new-instance v1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 54
    .line 55
    invoke-direct {v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/manager/a;->a(Landroidx/fragment/app/Fragment;)V

    .line 59
    .line 60
    .line 61
    :goto_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 67
    .line 68
    const/16 v1, 0x23

    .line 69
    .line 70
    if-lt v0, v1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const v1, 0x1020002

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    check-cast v0, Landroid/view/ViewGroup;

    .line 92
    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    new-instance v1, Ll/ve2;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/ve2;-><init>(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Ll/chq0;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    if-eqz p0, :cond_3

    .line 117
    .line 118
    const/16 v0, 0x8

    .line 119
    .line 120
    invoke-static {p0, v0, v0}, Ll/dhq0;->a(Landroid/view/WindowInsetsController;II)V

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method public attachBaseContext(Landroid/content/Context;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/c$a;->a:Lcom/tencent/could/huiyansdk/manager/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto/16 :goto_5

    .line 7
    .line 8
    :cond_0
    sget-object v2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 9
    .line 10
    iget-object v3, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 11
    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    sget-object v3, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->AUTO:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLanguageStyle()Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    :goto_0
    sget-object v4, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->AUTO:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    const/4 v6, 0x1

    .line 25
    if-ne v3, v4, :cond_3

    .line 26
    .line 27
    sget-object v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 36
    .line 37
    const-string v1, "LanguageManager"

    .line 38
    .line 39
    const-string v2, "huiyan base api, context is null!"

    .line 40
    .line 41
    invoke-virtual {v0, v6, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1, v5}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-eqz v1, :cond_7

    .line 62
    .line 63
    invoke-virtual {v0, p1, v1}, Lcom/tencent/could/huiyansdk/manager/c;->a(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    goto :goto_5

    .line 68
    :cond_3
    sget-object v4, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->CUSTOMIZE_LANGUAGE:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 69
    .line 70
    if-ne v3, v4, :cond_8

    .line 71
    .line 72
    iget-object v2, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 73
    .line 74
    if-nez v2, :cond_4

    .line 75
    .line 76
    const-string v2, ""

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLanguageCode()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_7

    .line 88
    .line 89
    const-string v3, "_"

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    array-length v4, v3

    .line 96
    const/4 v7, 0x2

    .line 97
    if-ne v4, v7, :cond_5

    .line 98
    .line 99
    new-instance v1, Ljava/util/Locale;

    .line 100
    .line 101
    aget-object v2, v3, v5

    .line 102
    .line 103
    aget-object v3, v3, v6

    .line 104
    .line 105
    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1, v1}, Lcom/tencent/could/huiyansdk/manager/c;->a(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    goto :goto_2

    .line 113
    :cond_5
    const-string v3, "-"

    .line 114
    .line 115
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    array-length v3, v2

    .line 120
    if-eq v3, v7, :cond_6

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_6
    new-instance v1, Ljava/util/Locale;

    .line 124
    .line 125
    aget-object v3, v2, v5

    .line 126
    .line 127
    aget-object v2, v2, v6

    .line 128
    .line 129
    invoke-direct {v1, v3, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p1, v1}, Lcom/tencent/could/huiyansdk/manager/c;->a(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    :goto_2
    if-eqz v1, :cond_7

    .line 137
    .line 138
    goto :goto_5

    .line 139
    :cond_7
    :goto_3
    move-object v1, p1

    .line 140
    goto :goto_5

    .line 141
    :cond_8
    sget-object v1, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->ENGLISH:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 142
    .line 143
    if-ne v3, v1, :cond_9

    .line 144
    .line 145
    const-string v1, "en"

    .line 146
    .line 147
    const-string v2, "US"

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_9
    const-string v1, "zh"

    .line 151
    .line 152
    const-string v2, "CN"

    .line 153
    .line 154
    :goto_4
    sget-object v4, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->TRADITIONAL_CHINESE:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 155
    .line 156
    if-ne v3, v4, :cond_a

    .line 157
    .line 158
    const-string v2, "HK"

    .line 159
    .line 160
    :cond_a
    new-instance v3, Ljava/util/Locale;

    .line 161
    .line 162
    invoke-direct {v3, v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p1, v3}, Lcom/tencent/could/huiyansdk/manager/c;->a(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    :goto_5
    if-eqz v1, :cond_b

    .line 170
    .line 171
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 172
    .line 173
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 174
    .line 175
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    iput-object v0, p1, Lcom/tencent/could/huiyansdk/api/j;->i:Ljava/lang/ref/WeakReference;

    .line 179
    .line 180
    invoke-super {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_b
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public final b()Lcom/tencent/could/component/common/ai/utils/TwoTuple;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tencent/could/component/common/ai/utils/TwoTuple<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "window"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 19
    .line 20
    .line 21
    iget p0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 22
    .line 23
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 24
    .line 25
    new-instance v1, Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {v1, p0, v0}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-object v1
.end method

.method public final c()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 8
    .line 9
    const-string v0, "BaseActivity"

    .line 10
    .line 11
    const-string v1, "context is null"

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/a;->a()Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/CameraHolder;->release()V

    .line 35
    .line 36
    .line 37
    :cond_1
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 43
    .line 44
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 50
    .line 51
    :cond_2
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->deInit()I

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 59
    .line 60
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_do_not_change_fold_statue_error:I

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    new-instance v1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 70
    .line 71
    invoke-direct {v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 72
    .line 73
    .line 74
    const/16 v2, 0xe8

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_ERROR_DIALOG:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 83
    .line 84
    invoke-virtual {v0, p0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const-string p0, "BaseActivity"

    .line 2
    .line 3
    const-string v0, "setChildContentView!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()Z
    .locals 4

    .line 1
    const v0, 0x1010058

    .line 2
    .line 3
    .line 4
    const v1, 0x1010057

    .line 5
    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    :try_start_0
    invoke-virtual {p0, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p0, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 26
    .line 27
    .line 28
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    :cond_0
    move v0, v2

    .line 34
    :cond_1
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    .line 36
    .line 37
    return v0

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 40
    .line 41
    .line 42
    throw v0
.end method

.method public finish()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic getDefaultViewModelCreationExtras()Ll/cvb;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-super {p0}, Landroidx/lifecycle/e;->getDefaultViewModelCreationExtras()Ll/cvb;

    move-result-object p0

    return-object p0
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/a;->a()Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->backPopEvent()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m0()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x1

    .line 30
    if-gt v1, v2, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->X0()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 6
    .param p1    # Landroid/content/res/Configuration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const-string v1, "BaseActivity"

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 12
    .line 13
    const-string p1, "createScreenSize is null do not check change screen size"

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 28
    .line 29
    const-string v2, "sdkConfig is null"

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    invoke-virtual {p1, v3, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b()Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 40
    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v4, "onConfigurationChanged onCreate screenSize: "

    .line 44
    .line 45
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 49
    .line 50
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v4, ","

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 63
    .line 64
    invoke-virtual {v5}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v2, v0, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v5, "onConfigurationChanged screenSize: "

    .line 81
    .line 82
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v2, v0, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 110
    .line 111
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Ljava/lang/Integer;

    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    check-cast v4, Ljava/lang/Integer;

    .line 126
    .line 127
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    sub-int/2addr v3, v4

    .line 132
    if-eqz v3, :cond_5

    .line 133
    .line 134
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Ljava/lang/Integer;

    .line 151
    .line 152
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    sub-int/2addr v3, v4

    .line 157
    if-nez v3, :cond_2

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_2
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 162
    .line 163
    iget-boolean v3, v3, Lcom/tencent/could/huiyansdk/manager/b;->s:Z

    .line 164
    .line 165
    if-eqz v3, :cond_4

    .line 166
    .line 167
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 168
    .line 169
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Ljava/lang/Integer;

    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v4

    .line 183
    check-cast v4, Ljava/lang/Integer;

    .line 184
    .line 185
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    sub-int/2addr v3, v4

    .line 190
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    int-to-float v3, v3

    .line 195
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 196
    .line 197
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getFirst()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    check-cast v4, Ljava/lang/Integer;

    .line 202
    .line 203
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    int-to-float v4, v4

    .line 208
    div-float/2addr v3, v4

    .line 209
    const v4, 0x3e4ccccd    # 0.2f

    .line 210
    .line 211
    .line 212
    cmpl-float v3, v3, v4

    .line 213
    .line 214
    if-lez v3, :cond_3

    .line 215
    .line 216
    const-string p1, "screen width size change!"

    .line 217
    .line 218
    invoke-virtual {v2, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->c()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_3
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 226
    .line 227
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    check-cast v3, Ljava/lang/Integer;

    .line 232
    .line 233
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    check-cast v5, Ljava/lang/Integer;

    .line 242
    .line 243
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    sub-int/2addr v3, v5

    .line 248
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    int-to-float v3, v3

    .line 253
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 254
    .line 255
    invoke-virtual {v5}, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->getSecond()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    check-cast v5, Ljava/lang/Integer;

    .line 260
    .line 261
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    int-to-float v5, v5

    .line 266
    div-float/2addr v3, v5

    .line 267
    cmpl-float v3, v3, v4

    .line 268
    .line 269
    if-lez v3, :cond_4

    .line 270
    .line 271
    const-string p1, "screen height size change!"

    .line 272
    .line 273
    invoke-virtual {v2, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->c()V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_4
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 281
    .line 282
    return-void

    .line 283
    :cond_5
    :goto_0
    const-string v3, "screen size is same, just rotation, do not check change screen size"

    .line 284
    .line 285
    invoke-virtual {v2, v0, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 289
    .line 290
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/app/Activity;->requestWindowFeature(I)Z

    .line 3
    .line 4
    .line 5
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getMainActivityThemeId()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eq v3, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getMainActivityThemeId()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 v3, 0x0

    .line 26
    const/16 v4, 0x2000

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isUseDeepColorStatusBarIcon()Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v5, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v5, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    if-nez v1, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-nez v5, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getStatusBarColor()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eq v5, v2, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getStatusBarColor()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-virtual {v2, v5}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/high16 v2, 0x8000000

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/high16 v2, 0x4000000

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_1
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDisableSystemRecordScreen()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_5

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 131
    .line 132
    .line 133
    :cond_5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const/high16 v2, 0x1000000

    .line 138
    .line 139
    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 140
    .line 141
    .line 142
    const-string v1, "BaseActivity"

    .line 143
    .line 144
    const-string v2, "open hardware accelerated!"

    .line 145
    .line 146
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->d()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    new-instance v0, Landroid/os/Handler;

    .line 160
    .line 161
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 162
    .line 163
    .line 164
    new-instance v1, Lcom/tencent/could/huiyansdk/activitys/BaseActivity$a;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity$a;-><init>(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;)V

    .line 167
    .line 168
    .line 169
    if-eqz p1, :cond_6

    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getDelayTimeMsOfLoadFragment()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    int-to-long v2, p1

    .line 176
    goto :goto_2

    .line 177
    :cond_6
    const-wide/16 v2, 0x1

    .line 178
    .line 179
    :goto_2
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b()Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->b:Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 187
    .line 188
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 21
    .line 22
    :cond_1
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 26
    .line 27
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 34
    .line 35
    :cond_2
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 40
    .line 41
    :cond_3
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-direct {p0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 47
    .line 48
    invoke-direct {p0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/tencent/could/huiyansdk/permission/c$a;->a:Lcom/tencent/could/huiyansdk/permission/c;

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x77

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    move v0, p1

    .line 17
    move v1, v0

    .line 18
    :goto_0
    array-length v2, p3

    .line 19
    const/4 v3, 0x1

    .line 20
    if-ge v0, v2, :cond_2

    .line 21
    .line 22
    aget v2, p3, v0

    .line 23
    .line 24
    const/4 v4, -0x1

    .line 25
    if-ne v2, v4, :cond_1

    .line 26
    .line 27
    move v1, v3

    .line 28
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    if-eqz v1, :cond_6

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-nez p3, :cond_5

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    iget-object p3, p2, Lcom/tencent/could/huiyansdk/permission/c;->a:Landroid/app/Dialog;

    .line 50
    .line 51
    if-nez p3, :cond_4

    .line 52
    .line 53
    new-instance p3, Landroidx/appcompat/app/a$a;

    .line 54
    .line 55
    invoke-direct {p3, p0}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txy_permission_info_log:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p3, v0}, Landroidx/appcompat/app/a$a;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/a$a;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txy_ok:I

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Lcom/tencent/could/huiyansdk/permission/b;

    .line 75
    .line 76
    invoke-direct {v1, p2}, Lcom/tencent/could/huiyansdk/permission/b;-><init>(Lcom/tencent/could/huiyansdk/permission/c;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3, v0, v1}, Landroidx/appcompat/app/a$a;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/a$a;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-virtual {p3, v3}, Landroidx/appcompat/app/a$a;->setCancelable(Z)Landroidx/appcompat/app/a$a;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p2, Lcom/tencent/could/huiyansdk/permission/c;->c:Ljava/lang/ref/WeakReference;

    .line 93
    .line 94
    invoke-virtual {p3}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, p2, Lcom/tencent/could/huiyansdk/permission/c;->a:Landroid/app/Dialog;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 101
    .line 102
    .line 103
    :cond_4
    iget-object p0, p2, Lcom/tencent/could/huiyansdk/permission/c;->a:Landroid/app/Dialog;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    :goto_1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 110
    .line 111
    const-string p1, "PermissionUtils"

    .line 112
    .line 113
    const-string p3, "activity is not running, skip dialog"

    .line 114
    .line 115
    const/4 v0, 0x2

    .line 116
    invoke-virtual {p0, v0, p1, p3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p2, Lcom/tencent/could/huiyansdk/permission/c;->b:Lcom/tencent/could/huiyansdk/permission/a;

    .line 120
    .line 121
    if-eqz p0, :cond_7

    .line 122
    .line 123
    check-cast p0, Lcom/tencent/could/huiyansdk/fragments/a;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/a;->a()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/permission/c;->b()V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    iget-object p0, p2, Lcom/tencent/could/huiyansdk/permission/c;->b:Lcom/tencent/could/huiyansdk/permission/a;

    .line 133
    .line 134
    if-eqz p0, :cond_7

    .line 135
    .line 136
    check-cast p0, Lcom/tencent/could/huiyansdk/fragments/a;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/a;->b()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/permission/c;->a()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/permission/c;->b()V

    .line 145
    .line 146
    .line 147
    :cond_7
    :goto_2
    return-void
.end method
