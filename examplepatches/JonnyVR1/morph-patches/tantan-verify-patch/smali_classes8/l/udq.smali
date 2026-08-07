.class public Ll/udq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

.field public j:Ljava/lang/String;

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:Landroid/graphics/drawable/Drawable;

.field public m:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/udq;->m:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "scheme_message_no_handler_found"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->failRemind:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/udq;->t(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->x5:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "scheme_message_no_handler_found"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->cancelRemind:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic h(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/udq;->s(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa067

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic j(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "OK"

    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveSchema;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 78
    .line 79
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    :goto_0
    return-void
.end method

.method public static p(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "setting_event"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static q(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "picture_text_style"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    const/high16 v0, 0x43800000    # 256.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :try_start_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/udq;->z(Lcom/p1/mobile/putong/core/data/MessageView;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/udq;->y(Lcom/p1/mobile/putong/core/data/MessageView;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 22
    .line 23
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/MessageView;->isTextOnly:Z

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    const v3, 0x7fffffff

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Ll/udq;->d:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/udq;->d:Lv/VText;

    .line 37
    .line 38
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 39
    .line 40
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v3}, Ll/udq;->m(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/udq;->e:Lv/VText;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageView;->button:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 70
    .line 71
    iget-object v2, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catch_0
    move-exception v1

    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :cond_0
    iget-object v1, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 81
    .line 82
    const/4 v4, 0x1

    .line 83
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/udq;->d:Lv/VText;

    .line 87
    .line 88
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 89
    .line 90
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p0, v5}, Ll/udq;->m(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Ll/udq;->e:Lv/VText;

    .line 100
    .line 101
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 102
    .line 103
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MessageView;->button:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 109
    .line 110
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    if-nez v1, :cond_1

    .line 115
    .line 116
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 117
    .line 118
    invoke-direct {v1, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 119
    .line 120
    .line 121
    :cond_1
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 122
    .line 123
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MessageView;->imageSize:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    const/4 v6, 0x3

    .line 130
    if-nez v5, :cond_6

    .line 131
    .line 132
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 133
    .line 134
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MessageView;->imageSize:Ljava/lang/String;

    .line 135
    .line 136
    const-string v7, "x"

    .line 137
    .line 138
    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    array-length v7, v5

    .line 143
    const/4 v8, 0x2

    .line 144
    if-ne v7, v8, :cond_7

    .line 145
    .line 146
    aget-object v2, v5, v2

    .line 147
    .line 148
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    int-to-float v2, v2

    .line 153
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    aget-object v4, v5, v4

    .line 158
    .line 159
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    int-to-float v4, v4

    .line 164
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-ne v2, v4, :cond_2

    .line 169
    .line 170
    iget-object v2, p0, Ll/udq;->d:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 173
    .line 174
    .line 175
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 176
    .line 177
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_2
    if-lez v2, :cond_7

    .line 181
    .line 182
    if-lez v4, :cond_7

    .line 183
    .line 184
    int-to-float v2, v2

    .line 185
    int-to-float v4, v4

    .line 186
    const/4 v5, 0x0

    .line 187
    add-float/2addr v4, v5

    .line 188
    div-float/2addr v2, v4

    .line 189
    int-to-float v4, v0

    .line 190
    div-float/2addr v4, v2

    .line 191
    float-to-int v2, v4

    .line 192
    const/high16 v4, 0x425c0000    # 55.0f

    .line 193
    .line 194
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    if-ge v2, v5, :cond_3

    .line 199
    .line 200
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    goto :goto_0

    .line 205
    :cond_3
    if-le v2, v0, :cond_4

    .line 206
    .line 207
    move v2, v0

    .line 208
    :cond_4
    :goto_0
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    if-eqz v4, :cond_5

    .line 215
    .line 216
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 217
    .line 218
    const-string v5, "monetization"

    .line 219
    .line 220
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    if-eqz v4, :cond_5

    .line 225
    .line 226
    iget-object v4, p0, Ll/udq;->d:Lv/VText;

    .line 227
    .line 228
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 229
    .line 230
    .line 231
    goto :goto_1

    .line 232
    :cond_5
    iget-object v4, p0, Ll/udq;->d:Lv/VText;

    .line 233
    .line 234
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 235
    .line 236
    .line 237
    :goto_1
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 238
    .line 239
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_6
    iget-object v2, p0, Ll/udq;->d:Lv/VText;

    .line 243
    .line 244
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 245
    .line 246
    .line 247
    :cond_7
    :goto_2
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 248
    .line 249
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/MessageView;->ignoreHeightLimit:Z

    .line 250
    .line 251
    if-eqz v2, :cond_8

    .line 252
    .line 253
    iget-object v2, p0, Ll/udq;->d:Lv/VText;

    .line 254
    .line 255
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 256
    .line 257
    .line 258
    :cond_8
    iget-object v2, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 259
    .line 260
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    .line 262
    .line 263
    iget-object v1, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 264
    .line 265
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    check-cast v1, Ll/wlj;

    .line 270
    .line 271
    sget-object v2, Ll/h1e0;->a:Ll/h1e0;

    .line 272
    .line 273
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    .line 275
    .line 276
    goto :goto_4

    .line 277
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 278
    .line 279
    .line 280
    :goto_4
    iget-object v1, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 281
    .line 282
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 287
    .line 288
    iget-object v0, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    .line 292
    .line 293
    iget-object p0, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 294
    .line 295
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 296
    .line 297
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->image:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    :cond_9
    return-void
.end method

.method public final B(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance v0, Ll/qdq;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/qdq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->wp(Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p2, Ll/rdq;

    .line 27
    .line 28
    invoke-direct {p2, p0, v0}, Ll/rdq;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/sdq;

    .line 36
    .line 37
    invoke-direct {p2, v0, p0}, Ll/sdq;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p2, Ll/tdq;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Ll/tdq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/kdq;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/kdq;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final C()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/udq;->f:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 27
    .line 28
    iget-object v3, p0, Ll/udq;->k:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 34
    .line 35
    new-array v3, v2, [Landroid/view/View;

    .line 36
    .line 37
    aput-object v0, v3, v1

    .line 38
    .line 39
    const/4 v0, -0x2

    .line 40
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 44
    .line 45
    const v1, 0x7fffffff

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 52
    .line 53
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 61
    .line 62
    const/high16 v1, 0x41400000    # 12.0f

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 72
    .line 73
    const/high16 v1, 0x41800000    # 16.0f

    .line 74
    .line 75
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 83
    .line 84
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 92
    .line 93
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 101
    .line 102
    const/high16 v2, 0x42280000    # 42.0f

    .line 103
    .line 104
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 112
    .line 113
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 121
    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 130
    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 139
    .line 140
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 148
    .line 149
    const-string v1, "#FE7E1D"

    .line 150
    .line 151
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 159
    .line 160
    iget-object p0, p0, Ll/udq;->l:Landroid/graphics/drawable/Drawable;

    .line 161
    .line 162
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/jdq;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/jdq;-><init>(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/udq;->f:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/ldq;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/ldq;-><init>(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final E(Landroid/text/SpannableStringBuilder;Landroid/text/style/URLSpan;Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string p0, " "

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->getSpanFlags(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "Letv"

    .line 16
    .line 17
    const-string v3, "LeEco"

    .line 18
    .line 19
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :try_start_0
    invoke-virtual {p2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v4
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    const-string v5, ""

    .line 32
    .line 33
    if-nez v4, :cond_0

    .line 34
    .line 35
    :try_start_1
    invoke-virtual {v3, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {v3, p0, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    :cond_0
    new-instance p0, Ljava/net/URI;

    .line 46
    .line 47
    invoke-direct {p0, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    const/4 p2, 0x1

    .line 66
    invoke-static {p0, p2}, Ll/ajq;->h(Ljava/net/URI;Z)V

    .line 67
    .line 68
    .line 69
    const-string v2, "p_chat_view"

    .line 70
    .line 71
    invoke-static {p0, p2, v5, v2}, Ll/bjq;->a(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0, p3, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catch_0
    move-exception p0

    .line 80
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final F(Landroid/view/View;IF)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Ll/rsf0;->c(F)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    int-to-float p2, p2

    .line 17
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "tantan"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_e

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/udq;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "businessType"

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v2, "vip"

    .line 37
    .line 38
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const-string v3, "renew"

    .line 43
    .line 44
    if-eqz v2, :cond_8

    .line 45
    .line 46
    const-string v0, "/diamond"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    const-string p1, "expired_oDiamond"

    .line 61
    .line 62
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 63
    .line 64
    goto/16 :goto_1

    .line 65
    .line 66
    :cond_0
    const-string p1, "normal_oDiamond"

    .line 67
    .line 68
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_1
    const-string v0, "/vip/buy"

    .line 73
    .line 74
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_6

    .line 79
    .line 80
    const-string v0, "/vip"

    .line 81
    .line 82
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    const-string p1, "/quickchat"

    .line 90
    .line 91
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    const-string p1, "quickchat"

    .line 98
    .line 99
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 100
    .line 101
    goto/16 :goto_1

    .line 102
    .line 103
    :cond_3
    const-string p1, "/see"

    .line 104
    .line 105
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_4

    .line 110
    .line 111
    const-string p1, "call2buysee"

    .line 112
    .line 113
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 114
    .line 115
    goto/16 :goto_1

    .line 116
    .line 117
    :cond_4
    const-string p1, "/partner"

    .line 118
    .line 119
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_5

    .line 124
    .line 125
    const-string p1, "supremePartner"

    .line 126
    .line 127
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_5
    const-string p1, "/femaleVip"

    .line 131
    .line 132
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_d

    .line 137
    .line 138
    const-string p1, "femalevip"

    .line 139
    .line 140
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_6
    :goto_0
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_7

    .line 148
    .line 149
    const-string p1, "expired_vip"

    .line 150
    .line 151
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_7
    const-string p1, "normal_vip"

    .line 155
    .line 156
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_8
    const-string v2, "svip"

    .line 160
    .line 161
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-eqz v2, :cond_b

    .line 166
    .line 167
    const-string v0, "/svip/buy"

    .line 168
    .line 169
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_9

    .line 174
    .line 175
    const-string v0, "/svip"

    .line 176
    .line 177
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_d

    .line 182
    .line 183
    :cond_9
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_a

    .line 188
    .line 189
    const-string p1, "expired_svip"

    .line 190
    .line 191
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_a
    const-string p1, "normal_svip"

    .line 195
    .line 196
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_b
    const-string p1, "monetization_promotion"

    .line 200
    .line 201
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-eqz p1, :cond_d

    .line 206
    .line 207
    const-string p1, "/svip/trail"

    .line 208
    .line 209
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_c

    .line 214
    .line 215
    const-string p1, "promotion_trial7DSVIP"

    .line 216
    .line 217
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_c
    const-string p1, "/vip/trail"

    .line 221
    .line 222
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-eqz p1, :cond_d

    .line 227
    .line 228
    const-string p1, "viptrial"

    .line 229
    .line 230
    iput-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 231
    .line 232
    :cond_d
    :goto_1
    iget-object p1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 233
    .line 234
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-eqz p1, :cond_e

    .line 239
    .line 240
    const-string p1, "vas_guide_type"

    .line 241
    .line 242
    iget-object p0, p0, Ll/udq;->j:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    filled-new-array {p0}, [Ll/pf60;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    const-string p1, "e_vas_guide_assistant"

    .line 253
    .line 254
    const-string v0, "p_chat_view"

    .line 255
    .line 256
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 257
    .line 258
    .line 259
    :cond_e
    return-void
.end method

.method public final H()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 16
    .line 17
    iget-object v1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "search"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "little-helper-recommend-anchor-live"

    .line 31
    .line 32
    const-string v2, "little-helper-recommend-anchor-voiceLive"

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_1

    .line 70
    .line 71
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Ljava/lang/String;

    .line 76
    .line 77
    iget-object v5, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 78
    .line 79
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const-string p0, "live_enter_source"

    .line 90
    .line 91
    const-string v3, "tantan_assistant"

    .line 92
    .line 93
    invoke-interface {v2, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_2

    .line 101
    .line 102
    const-string p0, "e_live_room_enter"

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const-string p0, "e_live_audio_room_enter"

    .line 106
    .line 107
    :goto_1
    const-string v0, "p_messages_view"

    .line 108
    .line 109
    invoke-static {p0, v0, v2}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :catch_0
    move-exception p0

    .line 114
    instance-of v0, p0, Lorg/json/JSONException;

    .line 115
    .line 116
    if-nez v0, :cond_3

    .line 117
    .line 118
    const/16 v0, 0x32

    .line 119
    .line 120
    invoke-static {p0, v0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method public l(Landroid/view/ViewGroup;Lv/AutoVDraweeView;Lv/AutoVDraweeView;Lv/VText;Lv/VText;Lv/VText;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    iput-object p2, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 6
    .line 7
    iput-object p4, p0, Ll/udq;->d:Lv/VText;

    .line 8
    .line 9
    iput-object p5, p0, Ll/udq;->e:Lv/VText;

    .line 10
    .line 11
    iput-object p6, p0, Ll/udq;->f:Lv/VText;

    .line 12
    .line 13
    iput-object p7, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object p1, p2

    .line 24
    :goto_0
    iput-object p1, p0, Ll/udq;->k:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    if-eqz p5, :cond_1

    .line 27
    .line 28
    invoke-virtual {p5}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :cond_1
    iput-object p2, p0, Ll/udq;->l:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    return-void
.end method

.method public final m(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    invoke-static {p1}, Ll/bjq;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/udq;->d:Lv/VText;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 11
    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "\n"

    .line 22
    .line 23
    const-string v1, "<br/>"

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const-class v2, Landroid/text/style/URLSpan;

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {v1, v3, v0, v2}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, [Landroid/text/style/URLSpan;

    .line 50
    .line 51
    array-length v2, v0

    .line 52
    :goto_0
    if-ge v3, v2, :cond_1

    .line 53
    .line 54
    aget-object v4, v0, v3

    .line 55
    .line 56
    invoke-virtual {p0, v1, v4, p1}, Ll/udq;->E(Landroid/text/SpannableStringBuilder;Landroid/text/style/URLSpan;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-object v1
.end method

.method public n(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    const/high16 v0, 0x43800000    # 256.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/udq;->d:Lv/VText;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/udq;->e:Lv/VText;

    .line 25
    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageView;->button:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/udq;->e:Lv/VText;

    .line 34
    .line 35
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    new-array v3, v2, [Landroid/view/View;

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    aput-object v1, v3, v4

    .line 47
    .line 48
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 52
    .line 53
    new-array v3, v2, [Landroid/view/View;

    .line 54
    .line 55
    aput-object v1, v3, v4

    .line 56
    .line 57
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/udq;->g:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    new-array v3, v2, [Landroid/view/View;

    .line 63
    .line 64
    aput-object v1, v3, v4

    .line 65
    .line 66
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 70
    .line 71
    const/high16 v1, 0x43340000    # 180.0f

    .line 72
    .line 73
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/udq;->b:Lv/AutoVDraweeView;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageView;->image:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 90
    .line 91
    sget v1, Ll/qa00;->j:I

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/udq;->d:Lv/VText;

    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 122
    .line 123
    sget v1, Ll/ibc0;->p:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 126
    .line 127
    .line 128
    iget-boolean v0, p0, Ll/udq;->m:Z

    .line 129
    .line 130
    if-nez v0, :cond_1

    .line 131
    .line 132
    iput-boolean v2, p0, Ll/udq;->m:Z

    .line 133
    .line 134
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eId:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->kId:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->event:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    filled-new-array {v1}, [Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const-string v3, "p_chat_view"

    .line 149
    .line 150
    invoke-static {v0, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 151
    .line 152
    .line 153
    :cond_1
    iget-object v0, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 154
    .line 155
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_2

    .line 160
    .line 161
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageView;->image2:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_2

    .line 170
    .line 171
    iget-object v0, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 172
    .line 173
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p0, Ll/udq;->c:Lv/AutoVDraweeView;

    .line 177
    .line 178
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 179
    .line 180
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->image2:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_2
    :goto_0
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/udq;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "-11001"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 51
    .line 52
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const-string v1, "e_live_assistant"

    .line 61
    .line 62
    const-string v2, "p_messages_view"

    .line 63
    .line 64
    invoke-static {v1, v2, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_1
    iget-object v0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Ll/l6p;->c(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_3

    .line 93
    .line 94
    new-instance v0, Ljava/util/HashMap;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_2

    .line 116
    .line 117
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    check-cast v2, Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 126
    .line 127
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    iget-object v1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eId:Ljava/lang/String;

    .line 138
    .line 139
    const-string v2, "p_chat_view"

    .line 140
    .line 141
    invoke-static {v1, v2, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 142
    .line 143
    .line 144
    :cond_3
    :goto_2
    invoke-virtual {p0}, Ll/udq;->H()V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-static {v0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    if-eqz v0, :cond_4

    .line 156
    .line 157
    iget-object p0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 158
    .line 159
    if-eqz p0, :cond_4

    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v0, p0}, Ll/l6p;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_4
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p2, p0, Ll/udq;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "-11001"

    .line 4
    .line 5
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const-string v0, "p_chat_view"

    .line 10
    .line 11
    const-string v1, "p_messages_view"

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    new-instance p2, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/String;

    .line 47
    .line 48
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 49
    .line 50
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {p2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-string v2, "e_live_assistant"

    .line 59
    .line 60
    invoke-static {v2, v1, p2}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 67
    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eId:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_3

    .line 77
    .line 78
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p2}, Ll/l6p;->c(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-nez p2, :cond_3

    .line 85
    .line 86
    new-instance p2, Ljava/util/HashMap;

    .line 87
    .line 88
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 89
    .line 90
    .line 91
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 92
    .line 93
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_2

    .line 106
    .line 107
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Ljava/lang/String;

    .line 112
    .line 113
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 114
    .line 115
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-interface {p2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_2
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eId:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v2, v0, p2}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 126
    .line 127
    .line 128
    :cond_3
    :goto_2
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-nez p2, :cond_6

    .line 135
    .line 136
    iget-object p2, p0, Ll/udq;->j:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-nez p2, :cond_4

    .line 143
    .line 144
    const-string p2, "vas_guide_type"

    .line 145
    .line 146
    iget-object v1, p0, Ll/udq;->j:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    filled-new-array {p2}, [Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    const-string v1, "e_vas_guide_assistant"

    .line 157
    .line 158
    invoke-static {v1, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 159
    .line 160
    .line 161
    :cond_4
    iget-object p2, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-static {p2}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    if-eqz p2, :cond_5

    .line 170
    .line 171
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p2, v0}, Ll/l6p;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_5
    iget-object p0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 177
    .line 178
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    new-instance v0, Ll/ndq;

    .line 189
    .line 190
    invoke-direct {v0, p1}, Ll/ndq;-><init>(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 191
    .line 192
    .line 193
    invoke-static {p0, p2, v0}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->action:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-nez p2, :cond_7

    .line 204
    .line 205
    const-string p2, "personalizedrcmd_recallmsg"

    .line 206
    .line 207
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->action:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p2

    .line 213
    if-eqz p2, :cond_7

    .line 214
    .line 215
    const-string p1, "e_personalized_recommendation_open"

    .line 216
    .line 217
    invoke-static {p1, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Ll/udq;->v()V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :cond_7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 225
    .line 226
    const/4 p2, 0x0

    .line 227
    invoke-virtual {p0, p1, p2}, Ll/udq;->B(Ljava/lang/String;Z)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->cancelSchema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->cancelSchema:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    new-instance v0, Ll/mdq;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/mdq;-><init>(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p2, v0}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 31
    .line 32
    const/4 p2, 0x1

    .line 33
    invoke-virtual {p0, p1, p2}, Ll/udq;->B(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public v()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->personalizeSuggest()Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->x5:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 39
    .line 40
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 44
    .line 45
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 46
    .line 47
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 48
    .line 49
    iget-object v1, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-static {v1}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const/4 v3, 0x1

    .line 64
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1, v0}, Ll/udq;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p2, Ll/odq;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/odq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/pdq;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/pdq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/udq;->j:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v0, p0, Ll/udq;->a:Landroid/view/ViewGroup;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    invoke-static {p1}, Ll/udq;->q(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Ll/udq;->p(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {p1}, Ll/zdq;->R(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Ll/udq;->h:Ljava/lang/String;

    .line 31
    .line 32
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 41
    .line 42
    iput-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-virtual {p0}, Ll/udq;->C()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->source:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "creation"

    .line 55
    .line 56
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget-object v0, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ll/udq;->o(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {p0, v0}, Ll/udq;->A(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/udq;->D(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/udq;->G(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    :goto_1
    return-void

    .line 92
    :catch_0
    move-exception p0

    .line 93
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/core/data/MessageView;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/core/data/MessageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->uiStyle:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/udq;->e:Lv/VText;

    .line 8
    .line 9
    const/high16 v1, 0x41200000    # 10.0f

    .line 10
    .line 11
    const-string v2, "#FE7E1D"

    .line 12
    .line 13
    const-string v3, "#FFFFFF"

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    if-ne p1, v4, :cond_0

    .line 17
    .line 18
    const/high16 p1, 0x42400000    # 48.0f

    .line 19
    .line 20
    :try_start_1
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 28
    .line 29
    const/high16 v0, 0x41400000    # 12.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-static {p1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-static {p1, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-static {p1, v4}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 57
    .line 58
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 66
    .line 67
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 75
    .line 76
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-virtual {p0, p1, v0, v1}, Ll/udq;->F(Landroid/view/View;IF)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    const/high16 p1, 0x42280000    # 42.0f

    .line 85
    .line 86
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 94
    .line 95
    const/high16 v0, 0x41800000    # 16.0f

    .line 96
    .line 97
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-static {p1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 105
    .line 106
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    invoke-static {p1, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 114
    .line 115
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-static {p1, v4}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 123
    .line 124
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 132
    .line 133
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 141
    .line 142
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    invoke-virtual {p0, p1, v0, v1}, Ll/udq;->F(Landroid/view/View;IF)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 147
    .line 148
    .line 149
    :catch_0
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/core/data/MessageView;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/core/data/MessageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageView;->cancelText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/udq;->f:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/udq;->f:Lv/VText;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->cancelText:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :try_start_0
    iget-object p1, p0, Ll/udq;->i:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 30
    .line 31
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->uiStyle:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    iget-object v1, p0, Ll/udq;->f:Lv/VText;

    .line 34
    .line 35
    const/high16 v3, 0x41200000    # 10.0f

    .line 36
    .line 37
    const/high16 v4, 0x41800000    # 16.0f

    .line 38
    .line 39
    if-ne p1, v0, :cond_1

    .line 40
    .line 41
    const/high16 p1, 0x42400000    # 48.0f

    .line 42
    .line 43
    :try_start_1
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-static {v1, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 51
    .line 52
    const/high16 v1, -0x3f800000    # -4.0f

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 62
    .line 63
    const/high16 v1, 0x41500000    # 13.0f

    .line 64
    .line 65
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {p1, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 73
    .line 74
    const/high16 v1, 0x41400000    # 12.0f

    .line 75
    .line 76
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {p1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 84
    .line 85
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-static {p1, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 107
    .line 108
    const-string v0, "#FE7E1D"

    .line 109
    .line 110
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 118
    .line 119
    const-string v0, "#FFFFFF"

    .line 120
    .line 121
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-virtual {p0, p1, v0, v3}, Ll/udq;->F(Landroid/view/View;IF)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_1
    const/high16 p1, 0x42280000    # 42.0f

    .line 130
    .line 131
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    invoke-static {v1, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 139
    .line 140
    const/high16 v0, -0x3ec00000    # -12.0f

    .line 141
    .line 142
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 150
    .line 151
    const/high16 v0, 0x41000000    # 8.0f

    .line 152
    .line 153
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-static {p1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 161
    .line 162
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 170
    .line 171
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 179
    .line 180
    const/high16 v0, 0x41600000    # 14.0f

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 186
    .line 187
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 195
    .line 196
    const-string v0, "#27000000"

    .line 197
    .line 198
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Ll/udq;->f:Lv/VText;

    .line 206
    .line 207
    invoke-virtual {p0, p1, v2, v3}, Ll/udq;->F(Landroid/view/View;IF)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 208
    .line 209
    .line 210
    :catch_0
    return-void
.end method
