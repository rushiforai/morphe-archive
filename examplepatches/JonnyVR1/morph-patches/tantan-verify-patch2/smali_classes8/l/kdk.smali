.class public Ll/kdk;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

.field public e:Landroid/widget/ListView;

.field public f:Z

.field public g:Ll/hgm;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/widget/ListView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kdk;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/kdk;->f:Z

    .line 13
    .line 14
    new-instance v0, Ll/hgm;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/hgm;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/kdk;->g:Ll/hgm;

    .line 20
    .line 21
    iput-object p1, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 22
    .line 23
    iput-object p2, p0, Ll/kdk;->e:Landroid/widget/ListView;

    .line 24
    .line 25
    return-void
.end method

.method private t(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kdk;->w(Lcom/p1/mobile/putong/core/data/Message;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private w(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 2
    .line 3
    const/16 p2, 0x13

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return p2

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 15
    .line 16
    const-string v0, "local_meet_reply"

    .line 17
    .line 18
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/16 p0, 0xf

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 28
    .line 29
    const-string v0, "local_greeting_reply"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/16 p0, 0xc

    .line 38
    .line 39
    return p0

    .line 40
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 41
    .line 42
    const-string v0, "local_send_agreematch_notice"

    .line 43
    .line 44
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const/16 p0, 0xd

    .line 51
    .line 52
    return p0

    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 54
    .line 55
    const-string v0, "local_greeting_agree_match"

    .line 56
    .line 57
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const/16 p0, 0xe

    .line 64
    .line 65
    return p0

    .line 66
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 67
    .line 68
    const-string v0, "local_greet_send_notice"

    .line 69
    .line 70
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_5

    .line 75
    .line 76
    const/16 p0, 0x10

    .line 77
    .line 78
    return p0

    .line 79
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 80
    .line 81
    const-string v0, "local_greet_receive_match_tip"

    .line 82
    .line 83
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    const/16 p0, 0x11

    .line 90
    .line 91
    return p0

    .line 92
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v0, "local_break_ice"

    .line 97
    .line 98
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_7

    .line 103
    .line 104
    return p2

    .line 105
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 106
    .line 107
    const-string p2, "local_dynamic_greeting_agree_match"

    .line 108
    .line 109
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_8

    .line 114
    .line 115
    const/16 p0, 0x14

    .line 116
    .line 117
    return p0

    .line 118
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    const-string p2, "state_like"

    .line 123
    .line 124
    const-string v0, "chat_gift"

    .line 125
    .line 126
    if-eqz p0, :cond_c

    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 129
    .line 130
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_a

    .line 135
    .line 136
    invoke-static {p1}, Ll/ggm;->c(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-interface {p1}, Ll/r97;->k0()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_9

    .line 153
    .line 154
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_9

    .line 159
    .line 160
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->needOpen:Z

    .line 161
    .line 162
    if-eqz p0, :cond_9

    .line 163
    .line 164
    const/4 p0, 0x2

    .line 165
    return p0

    .line 166
    :cond_9
    const/4 p0, 0x1

    .line 167
    return p0

    .line 168
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 169
    .line 170
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-eqz p0, :cond_b

    .line 175
    .line 176
    const/4 p0, 0x3

    .line 177
    return p0

    .line 178
    :cond_b
    const/4 p0, 0x0

    .line 179
    return p0

    .line 180
    :cond_c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    if-eqz p0, :cond_e

    .line 189
    .line 190
    invoke-static {p1}, Ll/ggm;->c(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-interface {p1}, Ll/r97;->k0()Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-eqz p1, :cond_d

    .line 207
    .line 208
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_d

    .line 213
    .line 214
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->needOpen:Z

    .line 215
    .line 216
    if-eqz p0, :cond_d

    .line 217
    .line 218
    const/16 p0, 0x8

    .line 219
    .line 220
    return p0

    .line 221
    :cond_d
    const/4 p0, 0x7

    .line 222
    return p0

    .line 223
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 224
    .line 225
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-eqz p0, :cond_f

    .line 230
    .line 231
    const/16 p0, 0x9

    .line 232
    .line 233
    return p0

    .line 234
    :cond_f
    const/4 p0, 0x6

    .line 235
    return p0
.end method

.method private z(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p2, v0, :cond_4

    .line 5
    .line 6
    const/16 v0, 0xd

    .line 7
    .line 8
    if-eq p2, v0, :cond_4

    .line 9
    .line 10
    const/16 v0, 0xf

    .line 11
    .line 12
    if-eq p2, v0, :cond_4

    .line 13
    .line 14
    const/16 v0, 0x10

    .line 15
    .line 16
    if-eq p2, v0, :cond_4

    .line 17
    .line 18
    const/16 v0, 0x11

    .line 19
    .line 20
    if-ne p2, v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 v0, 0xe

    .line 24
    .line 25
    if-ne p2, v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 28
    .line 29
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p1, Ll/qec0;->S:I

    .line 34
    .line 35
    invoke-virtual {p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    const/16 v0, 0x13

    .line 41
    .line 42
    if-ne p2, v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 45
    .line 46
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p2, Ll/qec0;->Z:I

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_2
    const/16 v0, 0x14

    .line 59
    .line 60
    if-ne p2, v0, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 63
    .line 64
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget p1, Ll/qec0;->w:I

    .line 69
    .line 70
    invoke-virtual {p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_3
    invoke-virtual {p0, p1, p2}, Ll/kdk;->y(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 81
    .line 82
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget p1, Ll/qec0;->b0:I

    .line 87
    .line 88
    invoke-virtual {p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kdk;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kdk;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Ll/kdk;->t(Lcom/p1/mobile/putong/core/data/Message;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/16 p0, 0x15

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/kdk;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p1, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget v0, Ll/qec0;->a0:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

    .line 15
    .line 16
    invoke-direct {p0, p1, p2}, Ll/kdk;->z(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    const/4 v1, -0x2

    .line 24
    invoke-direct {p2, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p1, p0, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    return-object p1
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kdk;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

    .line 6
    .line 7
    iget-object v0, p0, Ll/kdk;->g:Ll/hgm;

    .line 8
    .line 9
    invoke-virtual {p1, p2, p4, p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->m(Lcom/p1/mobile/putong/core/data/Message;ILl/pol;Ll/hgm;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->getRealRenderView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/16 v0, 0x13

    .line 17
    .line 18
    if-ne p3, v0, :cond_0

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetRecalled;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetRecalled;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/16 v0, 0xc

    .line 27
    .line 28
    if-eq p3, v0, :cond_6

    .line 29
    .line 30
    const/16 v0, 0xd

    .line 31
    .line 32
    if-eq p3, v0, :cond_6

    .line 33
    .line 34
    const/16 v0, 0xf

    .line 35
    .line 36
    if-eq p3, v0, :cond_6

    .line 37
    .line 38
    const/16 v0, 0x10

    .line 39
    .line 40
    if-eq p3, v0, :cond_6

    .line 41
    .line 42
    const/16 v0, 0x11

    .line 43
    .line 44
    if-ne p3, v0, :cond_1

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    const/16 v0, 0xe

    .line 48
    .line 49
    if-ne p3, v0, :cond_2

    .line 50
    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    const/16 v0, 0x14

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    if-ne p3, v0, :cond_3

    .line 61
    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;

    .line 63
    .line 64
    iget-object p3, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 65
    .line 66
    iget-boolean p4, p0, Ll/kdk;->f:Z

    .line 67
    .line 68
    xor-int/2addr p4, v1

    .line 69
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->z(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Z)V

    .line 70
    .line 71
    .line 72
    iput-boolean v1, p0, Ll/kdk;->f:Z

    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    .line 76
    .line 77
    const/4 p3, 0x0

    .line 78
    if-nez p4, :cond_4

    .line 79
    .line 80
    move-object v0, p3

    .line 81
    goto :goto_0

    .line 82
    :cond_4
    add-int/lit8 v0, p4, -0x1

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0}, Ll/a;->getCount()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    sub-int/2addr v2, v1

    .line 95
    if-ne p4, v2, :cond_5

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_5
    add-int/2addr p4, v1

    .line 99
    invoke-virtual {p0, p4}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    check-cast p3, Lcom/p1/mobile/putong/core/data/Message;

    .line 104
    .line 105
    :goto_1
    invoke-virtual {p1, p0, p2, v0, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_6
    :goto_2
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetingTip;

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetingTip;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 112
    .line 113
    .line 114
    :cond_7
    return-void
.end method

.method public y(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x6

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-lt p2, v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, v2

    .line 9
    :goto_0
    iget-object v3, p0, Ll/kdk;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget v4, Ll/qec0;->i5:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    sget v4, Ll/qec0;->h5:I

    .line 21
    .line 22
    :goto_1
    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 27
    .line 28
    sget v3, Ll/qec0;->L5:I

    .line 29
    .line 30
    if-nez p2, :cond_2

    .line 31
    .line 32
    sget v3, Ll/qec0;->K5:I

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    if-ne p2, v1, :cond_3

    .line 36
    .line 37
    sget v3, Ll/qec0;->y1:I

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    const/4 v1, 0x7

    .line 41
    if-ne p2, v1, :cond_4

    .line 42
    .line 43
    sget v3, Ll/qec0;->z1:I

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_4
    const/4 v1, 0x2

    .line 47
    if-ne p2, v1, :cond_5

    .line 48
    .line 49
    sget v3, Ll/qec0;->A1:I

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_5
    const/16 v1, 0x8

    .line 53
    .line 54
    if-ne p2, v1, :cond_6

    .line 55
    .line 56
    sget v3, Ll/qec0;->B1:I

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_6
    const/4 v1, 0x3

    .line 60
    if-ne p2, v1, :cond_7

    .line 61
    .line 62
    sget v3, Ll/qec0;->W2:I

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_7
    const/16 v1, 0x9

    .line 66
    .line 67
    if-ne p2, v1, :cond_8

    .line 68
    .line 69
    sget v3, Ll/qec0;->X2:I

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_8
    const/4 v1, 0x4

    .line 73
    if-ne p2, v1, :cond_9

    .line 74
    .line 75
    sget v3, Ll/qec0;->U2:I

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_9
    const/16 v1, 0xa

    .line 79
    .line 80
    if-ne p2, v1, :cond_a

    .line 81
    .line 82
    sget v3, Ll/qec0;->V2:I

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_a
    const/4 v1, 0x5

    .line 86
    if-ne p2, v1, :cond_b

    .line 87
    .line 88
    sget v3, Ll/qec0;->f5:I

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_b
    const/16 v1, 0xb

    .line 92
    .line 93
    if-ne p2, v1, :cond_c

    .line 94
    .line 95
    sget v3, Ll/qec0;->g5:I

    .line 96
    .line 97
    :cond_c
    :goto_2
    iget-object p0, p0, Ll/kdk;->e:Landroid/widget/ListView;

    .line 98
    .line 99
    invoke-virtual {p1, v3, p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->U(ILandroid/view/View;IZ)V

    .line 100
    .line 101
    .line 102
    return-object p1
.end method
