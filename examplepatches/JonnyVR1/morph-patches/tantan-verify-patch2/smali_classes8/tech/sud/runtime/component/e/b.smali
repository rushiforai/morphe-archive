.class public Ltech/sud/runtime/component/e/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Landroid/widget/FrameLayout;

.field private b:Ltech/sud/runtime/component/e/a;

.field private c:Ltech/sud/runtime/component/e/a$a;

.field private d:Lorg/json/JSONObject;

.field private final e:Ltech/sud/runtime/core/g;

.field private f:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Ltech/sud/runtime/core/g;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/e/b;->d:Lorg/json/JSONObject;

    .line 6
    .line 7
    iput-object p1, p0, Ltech/sud/runtime/component/e/b;->a:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iput-object p2, p0, Ltech/sud/runtime/component/e/b;->e:Ltech/sud/runtime/core/g;

    .line 10
    .line 11
    iput-object p3, p0, Ltech/sud/runtime/component/e/b;->f:Ljava/lang/Integer;

    .line 12
    .line 13
    return-void
.end method

.method private a(I)V
    .locals 1

    .line 91
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->e:Ltech/sud/runtime/core/g;

    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->b(II)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/b;I)V
    .locals 0

    .line 86
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->a(I)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/b;Ljava/lang/String;)V
    .locals 0

    .line 85
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->g(Ljava/lang/String;)V

    return-void
.end method

.method private b()V
    .locals 1

    const/4 v0, -0x2

    .line 10
    invoke-direct {p0, v0}, Ltech/sud/runtime/component/e/b;->a(I)V

    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/component/e/b;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->e(Ljava/lang/String;)V

    return-void
.end method

.method private c(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Ltech/sud/runtime/component/e/a;->c()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "defaultValue"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string p1, "maxLength"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const-string p1, "multiple"

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    const-string p1, "confirmHold"

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    const-string p1, "confirmType"

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ltech/sud/runtime/component/e/b;->d(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    iget-object v1, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 54
    .line 55
    invoke-virtual/range {v1 .. v6}, Ltech/sud/runtime/component/e/a;->a(Ljava/lang/String;IZZI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    move-object p1, v0

    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Ltech/sud/runtime/component/e/b;->b()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic c(Ltech/sud/runtime/component/e/b;Ljava/lang/String;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->f(Ljava/lang/String;)V

    return-void
.end method

.method private static d(Ljava/lang/String;)I
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x3

    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x1

    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "send"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v5, v1

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "next"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v5, v2

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "go"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v5, v3

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v0, "search"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    move v5, v4

    .line 60
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 61
    .line 62
    .line 63
    return v4

    .line 64
    :pswitch_0
    const/4 p0, 0x4

    .line 65
    return p0

    .line 66
    :pswitch_1
    return v3

    .line 67
    :pswitch_2
    return v1

    .line 68
    :pswitch_3
    return v2

    .line 69
    :sswitch_data_0
    .sparse-switch
        -0x36059a58 -> :sswitch_3
        0xce8 -> :sswitch_2
        0x338af3 -> :sswitch_1
        0x35cf88 -> :sswitch_0
    .end sparse-switch

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private e(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->e:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    const/16 v0, 0x9

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private f(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->e:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private g(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->e:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 87
    iget-object v0, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    if-eqz v0, :cond_0

    .line 88
    iget-object v1, p0, Ltech/sud/runtime/component/e/b;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 89
    iget-object v0, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    invoke-virtual {v0}, Ltech/sud/runtime/component/e/a;->a()V

    const/4 v0, 0x0

    .line 90
    iput-object v0, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/e/b;->d:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ltech/sud/runtime/component/e/b;->d:Lorg/json/JSONObject;

    .line 11
    .line 12
    const-string v1, "errorMsg"

    .line 13
    .line 14
    const-string v2, "ok"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Ltech/sud/runtime/component/e/b;->d:Lorg/json/JSONObject;

    .line 22
    .line 23
    const/4 p1, -0x5

    .line 24
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->a(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :goto_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/b;->c:Ltech/sud/runtime/component/e/a$a;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ltech/sud/runtime/component/e/b$1;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/b$1;-><init>(Ltech/sud/runtime/component/e/b;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ltech/sud/runtime/component/e/b;->c:Ltech/sud/runtime/component/e/a$a;

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/e/b;->a:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    const/4 v1, -0x1

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-direct {p0, v1}, Ltech/sud/runtime/component/e/b;->a(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object v2, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 49
    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    new-instance v2, Ltech/sud/runtime/component/e/a;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-object v4, p0, Ltech/sud/runtime/component/e/b;->c:Ltech/sud/runtime/component/e/a$a;

    .line 59
    .line 60
    iget-object v5, p0, Ltech/sud/runtime/component/e/b;->f:Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-direct {v2, v3, v4, v5}, Ltech/sud/runtime/component/e/a;-><init>(Landroid/content/Context;Ltech/sud/runtime/component/e/a$a;Ljava/lang/Integer;)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 66
    .line 67
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 68
    .line 69
    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 70
    .line 71
    .line 72
    const/16 v1, 0x50

    .line 73
    .line 74
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 75
    .line 76
    iget-object v1, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/b;->c(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/b;->b:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/e/a;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
