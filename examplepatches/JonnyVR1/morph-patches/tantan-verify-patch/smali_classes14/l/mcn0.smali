.class public Ll/mcn0;
.super Ll/jbt;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/x20;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/xec0;->j2:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, p1, v0}, Ll/jbt;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Ll/mcn0;->i:Ll/x20;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/mcn0;->A()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jbt;->u()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/mcn0;->z(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/mcn0;->f:Landroid/widget/TextView;

    .line 9
    .line 10
    new-instance v1, Ll/kcn0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/kcn0;-><init>(Ll/mcn0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/mcn0;->g:Landroid/widget/TextView;

    .line 19
    .line 20
    new-instance v1, Ll/lcn0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/lcn0;-><init>(Ll/mcn0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x3

    .line 29
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/mcn0;->d:Landroid/widget/TextView;

    .line 36
    .line 37
    const-string v1, "\u7fa4\u4e3b\u987b\u77e5"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/mcn0;->e:Landroid/widget/TextView;

    .line 43
    .line 44
    const-string v0, "1\u3001\u7fa4\u4e3b\u5e94\u5f53\u5c65\u884c\u5bf9\u7fa4\u91cc\u7684\u76d1\u7763\u7ba1\u7406\u804c\u8d23\uff0c\u4e25\u683c\u4f9d\u636e\u76f8\u5173\u6cd5\u5f8b\u6cd5\u89c4\u3001\u5b9e\u65f6\u7fa4\u804a\u793e\u533a\u89c4\u8303\u7b49\u76f8\u5173\u89c4\u5b9a\u95fa\u623f\u7fa4\u804a\u6210\u5458\u7684\u884c\u4e3a\u548c\u4fe1\u606f\u53d1\u5e03\uff1b\n2\u3001\u7fa4\u4e3b\u5e94\u5f53\u79ef\u6781\u7ef4\u62a4\u7fa4\u5185\u7684\u804a\u5929\u53ea\u9700\uff0c\u8425\u9020\u826f\u597d\u7684\u4ea4\u6d41\u6c1b\u56f4\uff0c\u63d0\u4f9b\u79ef\u6781\u5065\u5eb7\u7684\u804a\u5929\u8bdd\u9898\uff0c\u5e76\u4e14\u53ca\u65f6\u5904\u7406\u7fa4\u6210\u5458\u4e4b\u95f4\u7684\u77db\u76fe\uff0c\u7ef4\u62a4\u7fa4\u804a\u7684\u5b89\u5168\u3001\u5065\u5eb7\uff0c\u4fdd\u8bc1\u7fa4\u6210\u5458\u7684\u4f7f\u7528\u4f53\u9a8c\u3002"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/mcn0;->i:Ll/x20;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 6
    .line 7
    iget-object v0, p0, Ll/mcn0;->h:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, v1}, Ll/j6t;->b(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic D(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    const v0, 0x186b3

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ll/hyn0;->b(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "EnterRoomChecker"

    .line 9
    .line 10
    const-string v2, "isInterceptStartVoiceLives"

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "allow"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v0, Ll/mcn0;

    .line 25
    .line 26
    invoke-direct {v0, p0, p2}, Ll/mcn0;-><init>(Landroid/content/Context;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    iput-object p0, v0, Ll/mcn0;->h:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/mcn0;->E(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic w(Ll/mcn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mcn0;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/mcn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mcn0;->D(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic y(Ll/mcn0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mcn0;->h:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method


# virtual methods
.method public final E(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "#"

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    array-length v1, p1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-lez v1, :cond_0

    .line 21
    .line 22
    aget-object v1, p1, v2

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    .line 27
    :cond_0
    array-length v1, p1

    .line 28
    const/4 v3, 0x2

    .line 29
    if-le v1, v3, :cond_1

    .line 30
    .line 31
    aget-object v1, p1, v3

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/mcn0$a;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/mcn0$a;-><init>(Ll/mcn0;[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    aget-object v4, p1, v2

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    aget-object v5, p1, v2

    .line 48
    .line 49
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    aget-object v3, p1, v3

    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    add-int/2addr v5, v3

    .line 60
    const/16 v3, 0x21

    .line 61
    .line 62
    invoke-virtual {v0, v1, v4, v5, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 63
    .line 64
    .line 65
    :cond_1
    array-length v1, p1

    .line 66
    const/4 v3, 0x3

    .line 67
    if-le v1, v3, :cond_2

    .line 68
    .line 69
    aget-object p1, p1, v3

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object p1, p0, Ll/mcn0;->e:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/mcn0;->e:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/mcn0;->e:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/jbt;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ncn0;->a(Ll/mcn0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
