.class public Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->b0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->h(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/typ;->a(Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    return-object p0
.end method

.method public g(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "messageTip"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    :catch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 38
    .line 39
    invoke-virtual {p0, p2, v0, p3}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->j(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ll/n100;)V

    .line 40
    .line 41
    .line 42
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->M0:I

    .line 43
    .line 44
    invoke-static {p3}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ltz v0, :cond_1

    .line 77
    .line 78
    new-instance v2, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;

    .line 79
    .line 80
    invoke-direct {v2, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    add-int/2addr p1, v0

    .line 88
    const/16 p2, 0x21

    .line 89
    .line 90
    invoke-virtual {v1, v2, v0, p1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->c:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->b:Lv/VLinear;

    .line 99
    .line 100
    sget p2, Ll/ibc0;->f1:I

    .line 101
    .line 102
    invoke-static {p2}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->c:Lv/VText;

    .line 110
    .line 111
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    :goto_0
    return-void
.end method

.method public final h(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, p2, v2}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, p0, v0}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/ryp;

    .line 27
    .line 28
    invoke-direct {p1, p2}, Ll/ryp;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Ll/syp;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/syp;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->f()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    :try_start_0
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v2, Lorg/json/JSONObject;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v0, v2}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    :catch_0
    :cond_1
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ll/n100;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->f()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-static {p3, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p3, p0, p1}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    :catch_0
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
