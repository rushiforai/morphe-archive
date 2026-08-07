.class public Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->c(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
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

    return-object p0
.end method

.method public b()Lcom/p1/mobile/android/app/Act;
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

.method public final synthetic c(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->b()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "chat_gift_id"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "other_user_id"

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "e_chat_gift_message"

    .line 58
    .line 59
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->b()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    instance-of p2, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    if-eqz p2, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->b()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Ll/clz;->I2(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->b()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    instance-of p2, p2, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 91
    .line 92
    if-eqz p2, :cond_3

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-interface {p2, p1}, Ll/r97;->K2(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_3

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->b()Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 119
    .line 120
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->isOpened:Z

    .line 121
    .line 122
    if-eqz p2, :cond_2

    .line 123
    .line 124
    const-string p2, "\u5bf9\u65b9\u5df2\u62c6\u5f00"

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    const-string p2, "\u5f85\u5bf9\u65b9\u62c6\u5f00"

    .line 128
    .line 129
    :goto_0
    invoke-virtual {v0, p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->o2(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/Message;Landroid/widget/TextView;Lv/VDraweeView;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_5

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "chat_gift"

    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "\u9001\u4f60\u4e00\u4e2a "

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object p4

    .line 47
    const v1, 0x43878000    # 271.0f

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 55
    .line 56
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 57
    .line 58
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 59
    .line 60
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->id:Ljava/lang/String;

    .line 61
    .line 62
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 65
    .line 66
    invoke-virtual {v1, p4}, Ll/lu8;->R3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 71
    .line 72
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    if-eqz p4, :cond_3

    .line 77
    .line 78
    new-instance p4, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-string v3, "moment_gift"

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 114
    .line 115
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 124
    .line 125
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->id:Ljava/lang/String;

    .line 126
    .line 127
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 130
    .line 131
    invoke-virtual {v3, v1}, Ll/lu8;->R3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 136
    .line 137
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 142
    .line 143
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->momentID:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Yn(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    if-eqz v3, :cond_2

    .line 156
    .line 157
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 158
    .line 159
    .line 160
    move-result-object p4

    .line 161
    const/high16 v2, 0x43660000    # 230.0f

    .line 162
    .line 163
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    iput v2, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 168
    .line 169
    iget-object p4, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p4

    .line 175
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result p4

    .line 179
    if-eqz p4, :cond_1

    .line 180
    .line 181
    const-string p4, "\u7ed9\u4f60\u7684\u52a8\u6001\u9001\u4e86\u4e00\u4e2a\u793c\u7269"

    .line 182
    .line 183
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v2, "\u7ed9\u4f60\u7684\u52a8\u6001\u300c"

    .line 190
    .line 191
    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, "\u300d\u9001\u4e86\u4e00\u4e2a\u793c\u7269"

    .line 204
    .line 205
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p4

    .line 212
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_2
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 217
    .line 218
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result p4

    .line 222
    if-eqz p4, :cond_3

    .line 223
    .line 224
    new-instance p4, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 230
    .line 231
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p4

    .line 240
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    :cond_3
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 244
    .line 245
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-eqz p2, :cond_5

    .line 250
    .line 251
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 252
    .line 253
    iget-wide v1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 254
    .line 255
    const-wide/16 v3, 0x0

    .line 256
    .line 257
    cmpl-double p2, v1, v3

    .line 258
    .line 259
    if-lez p2, :cond_4

    .line 260
    .line 261
    double-to-int p2, v1

    .line 262
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object p2

    .line 266
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    const-string p4, "\u4ef7\u503c\uff1a%s\u63a2\u63a2\u5e01"

    .line 271
    .line 272
    invoke-static {p4, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-virtual {p5, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    goto :goto_1

    .line 280
    :cond_4
    invoke-virtual {p5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    :goto_1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 284
    .line 285
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 286
    .line 287
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {p2, p3, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    new-instance p2, Ll/s5q;

    .line 293
    .line 294
    invoke-direct {p2, p0, p1}, Ll/s5q;-><init>(Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    .line 299
    .line 300
    :cond_5
    return-void
.end method

.method public final e(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x6

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->codePointCount(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->offsetByCodePoints(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "..."

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    return-object p1
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method
