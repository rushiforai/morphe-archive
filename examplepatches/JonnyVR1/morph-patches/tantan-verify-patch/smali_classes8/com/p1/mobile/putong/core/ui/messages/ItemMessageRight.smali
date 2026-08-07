.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static R0:Ll/w30;


# instance fields
.field public E0:Lv/VText;

.field public F0:Landroid/widget/FrameLayout;

.field public G0:Lv/VText;

.field public H0:Lv/VText;

.field public I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public J0:J

.field public K0:D

.field public L:Landroid/widget/ImageView;

.field public L0:Z

.field public M:Landroid/view/View;

.field public M0:Z

.field public N:Lcom/p1/mobile/putong/core/data/Message;

.field public N0:Landroid/animation/AnimatorSet;

.field public O:Landroid/widget/FrameLayout;

.field public O0:Z

.field public P:Lv/VDraweeView;

.field public P0:I

.field public Q:Lv/VImage;

.field public Q0:Ll/x20;

.field public R:Landroid/widget/LinearLayout;

.field public S:Lv/VText;

.field public T:Lv/VText;

.field public U:Lv/VImage;

.field public V:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

.field public W:Landroid/widget/FrameLayout;

.field public k0:Lv/VDraweeView;

.field public p0:Lv/VDraweeView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0xa

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O0:Z

    .line 13
    .line 14
    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 16
    .line 17
    new-instance p1, Ll/abq;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/abq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q0:Ll/x20;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, -0xa

    .line 26
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O0:Z

    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 30
    new-instance p1, Ll/abq;

    invoke-direct {p1, p0}, Ll/abq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q0:Ll/x20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0xa

    .line 32
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O0:Z

    const/4 p1, -0x1

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 36
    new-instance p1, Ll/abq;

    invoke-direct {p1, p0}, Ll/abq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q0:Ll/x20;

    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->e1()V

    return-void
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->c1()V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->b1()V

    return-void
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
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

.method public static synthetic G0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 2

    .line 1
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->g:I

    .line 12
    .line 13
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_7

    .line 22
    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    const-string p3, "default"

    .line 28
    .line 29
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 36
    .line 37
    const-string p3, "unknown_"

    .line 38
    .line 39
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 50
    .line 51
    :cond_1
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 52
    .line 53
    const/4 p3, 0x1

    .line 54
    const/4 p4, 0x0

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "chat_gift"

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    move-object v0, p0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0, p1, p3, p4}, Ll/clz;->L2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    if-eqz p2, :cond_3

    .line 80
    .line 81
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    if-ne v0, v1, :cond_3

    .line 86
    .line 87
    iput-boolean p3, p1, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 88
    .line 89
    :cond_3
    if-eqz p2, :cond_4

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    const-string v0, "moment_comment"

    .line 96
    .line 97
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-eqz p3, :cond_4

    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p2, "comment"

    .line 108
    .line 109
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/MomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 114
    .line 115
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 116
    .line 117
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 118
    .line 119
    const-string p2, "moment"

    .line 120
    .line 121
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 122
    .line 123
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 124
    .line 125
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 128
    .line 129
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance p2, Ll/hbq;

    .line 136
    .line 137
    invoke-direct {p2, p1}, Ll/hbq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 138
    .line 139
    .line 140
    new-instance p1, Ll/ibq;

    .line 141
    .line 142
    invoke-direct {p1}, Ll/ibq;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_4
    if-eqz p2, :cond_5

    .line 154
    .line 155
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 158
    .line 159
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    new-instance p2, Ll/jbq;

    .line 166
    .line 167
    invoke-direct {p2, p1}, Ll/jbq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 168
    .line 169
    .line 170
    new-instance p1, Ll/kbq;

    .line 171
    .line 172
    invoke-direct {p1}, Ll/kbq;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-interface {p2, p0}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-eqz p2, :cond_6

    .line 196
    .line 197
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-interface {p2, p0, p1}, Ll/r97;->e0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 206
    .line 207
    .line 208
    :cond_6
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->R0:Ll/w30;

    .line 209
    .line 210
    if-eqz p0, :cond_9

    .line 211
    .line 212
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_7
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 217
    .line 218
    .line 219
    move-result-object p3

    .line 220
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->d:I

    .line 221
    .line 222
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p3

    .line 226
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    if-eqz p2, :cond_9

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    invoke-interface {p2, p0}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 241
    .line 242
    .line 243
    move-result p0

    .line 244
    if-eqz p0, :cond_8

    .line 245
    .line 246
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 247
    .line 248
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 249
    .line 250
    iget-wide p1, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 251
    .line 252
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/j;->t6(J)Lrx/c;

    .line 253
    .line 254
    .line 255
    goto :goto_1

    .line 256
    :cond_8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 257
    .line 258
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 259
    .line 260
    iget-wide p1, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 261
    .line 262
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->yn(J)Lrx/c;

    .line 263
    .line 264
    .line 265
    :cond_9
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->R0:Ll/w30;

    .line 266
    .line 267
    if-eqz p0, :cond_a

    .line 268
    .line 269
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 270
    .line 271
    .line 272
    :cond_a
    return-void
.end method

.method public static synthetic H0(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/qzz;->B1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->f1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic K0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Z0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->d1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->setReadStateLayoutParams(Z)V

    return-void
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->a1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->i1(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->g1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->h1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
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

.method public static synthetic U0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->j1(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic V0(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->R0:Ll/w30;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static p1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->g:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->d:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v1, Ll/w30$b;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    new-instance v3, Ll/lbq;

    .line 52
    .line 53
    invoke-direct {v3}, Ll/lbq;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v2, Ll/mbq;

    .line 65
    .line 66
    invoke-direct {v2, p0, p1}, Ll/mbq;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sput-object p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->R0:Ll/w30;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private setReadStateLayoutParams(Z)V
    .locals 0

    return-void
.end method


# virtual methods
.method public U(ILandroid/view/View;IZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->U(ILandroid/view/View;IZ)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 p2, 0x40c00000    # 6.0f

    .line 9
    .line 10
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    sub-int/2addr p1, p2

    .line 15
    int-to-float p1, p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotX(F)V

    .line 17
    .line 18
    .line 19
    sget p1, Ll/edc0;->d4:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 26
    .line 27
    sget p1, Ll/edc0;->P0:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 36
    .line 37
    sget p1, Ll/edc0;->u3:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Landroid/widget/FrameLayout;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    sget p1, Ll/edc0;->s3:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p1}, Ll/r97;->D()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->O()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_0

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P:Lv/VDraweeView;

    .line 84
    .line 85
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight$a;

    .line 86
    .line 87
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 88
    .line 89
    .line 90
    new-instance p3, Ll/nbq;

    .line 91
    .line 92
    invoke-direct {p3, p0}, Ll/nbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/b;->r(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P:Lv/VDraweeView;

    .line 99
    .line 100
    new-instance p2, Ll/obq;

    .line 101
    .line 102
    invoke-direct {p2, p0}, Ll/obq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    sget p1, Ll/edc0;->r5:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lv/VImage;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q:Lv/VImage;

    .line 117
    .line 118
    sget p1, Ll/edc0;->C3:I

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Landroid/widget/LinearLayout;

    .line 125
    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->R:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    sget p1, Ll/edc0;->J1:I

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lv/VText;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 137
    .line 138
    sget p1, Ll/edc0;->E3:I

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Lv/VText;

    .line 145
    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 147
    .line 148
    sget p1, Ll/edc0;->D3:I

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lv/VImage;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->U:Lv/VImage;

    .line 157
    .line 158
    sget p1, Ll/edc0;->A1:I

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    .line 165
    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->V:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    .line 167
    .line 168
    sget p1, Ll/edc0;->I1:I

    .line 169
    .line 170
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    check-cast p1, Landroid/widget/FrameLayout;

    .line 175
    .line 176
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 177
    .line 178
    sget p2, Ll/edc0;->i0:I

    .line 179
    .line 180
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, Lv/VDraweeView;

    .line 185
    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->k0:Lv/VDraweeView;

    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 189
    .line 190
    sget p2, Ll/edc0;->j0:I

    .line 191
    .line 192
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Lv/VDraweeView;

    .line 197
    .line 198
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->p0:Lv/VDraweeView;

    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 201
    .line 202
    sget p2, Ll/edc0;->k0:I

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    check-cast p1, Lv/VText;

    .line 209
    .line 210
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->E0:Lv/VText;

    .line 211
    .line 212
    sget p1, Ll/edc0;->H1:I

    .line 213
    .line 214
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    check-cast p1, Landroid/widget/FrameLayout;

    .line 219
    .line 220
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->F0:Landroid/widget/FrameLayout;

    .line 221
    .line 222
    sget p1, Ll/edc0;->y:I

    .line 223
    .line 224
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lv/VText;

    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->H0:Lv/VText;

    .line 231
    .line 232
    sget p1, Ll/edc0;->S0:I

    .line 233
    .line 234
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    check-cast p1, Lv/VText;

    .line 239
    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->G0:Lv/VText;

    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 243
    .line 244
    const/4 p2, 0x0

    .line 245
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    .line 247
    .line 248
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_1

    .line 261
    .line 262
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->G0:Lv/VText;

    .line 263
    .line 264
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    sget p3, Ll/g9c0;->i:I

    .line 269
    .line 270
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 271
    .line 272
    .line 273
    move-result p2

    .line 274
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 275
    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 278
    .line 279
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    sget p3, Ll/g9c0;->i:I

    .line 284
    .line 285
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 286
    .line 287
    .line 288
    move-result p2

    .line 289
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->H0:Lv/VText;

    .line 293
    .line 294
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    sget p3, Ll/g9c0;->i:I

    .line 299
    .line 300
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 301
    .line 302
    .line 303
    move-result p2

    .line 304
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 305
    .line 306
    .line 307
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->E0:Lv/VText;

    .line 308
    .line 309
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    sget p2, Ll/g9c0;->i:I

    .line 314
    .line 315
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 320
    .line 321
    .line 322
    :cond_1
    return-void
.end method

.method public final W0(JJJJ)Z
    .locals 0

    .line 1
    cmp-long p0, p3, p1

    if-lez p0, :cond_1

    cmp-long p0, p7, p5

    if-gez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final X0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "user_id"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "e_kankan_chat_head"

    .line 46
    .line 47
    const-string v2, "p_kankan_chat_popup"

    .line 48
    .line 49
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {v0, p0}, Ll/r97;->G5(Lcom/p1/mobile/android/app/Act;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void

    .line 68
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 87
    .line 88
    const-string v3, "click_user_id"

    .line 89
    .line 90
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string v3, "is_self_avatar"

    .line 115
    .line 116
    invoke-static {v3, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    filled-new-array {v2, p0}, [Ll/sfj0$a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string v2, "e_chat_avatar"

    .line 125
    .line 126
    invoke-static {v2, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ll/clz;->u6()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public Y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 8
    .line 9
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;->d()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->k()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 40
    .line 41
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic Z0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->X0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->X0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 14
    .line 15
    iget-object p0, p0, Ll/clz;->L:Lrx/subjects/a;

    .line 16
    .line 17
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic c1()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->Y2()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/pbq;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/pbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "haveRead"

    .line 38
    .line 39
    invoke-interface {v0, v1, v4, v2, v3}, Ll/r97;->o3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-interface {v0, v1}, Ll/r97;->S4(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 67
    .line 68
    iget-object p0, p0, Ll/clz;->L:Lrx/subjects/a;

    .line 69
    .line 70
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public final synthetic d1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q0:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e1()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-wide v2, v2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->s1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 5
    .line 6
    const-string v0, "p_chat_view"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p3, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 36
    .line 37
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p3, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q:Lv/VImage;

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 54
    .line 55
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 56
    .line 57
    if-eqz p3, :cond_1

    .line 58
    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;->b(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Y0()V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public final synthetic f1(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jek;->k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setShowSVipFrame(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->t0(Lcom/p1/mobile/putong/data/User;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q:Lv/VImage;

    .line 55
    .line 56
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 10

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 5
    .line 6
    const-string v0, "p_chat_view"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-interface {p3}, Ll/r97;->G1()Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/bnl0;->y0()I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    sget v0, Ll/qa00;->h:I

    .line 31
    .line 32
    sub-int/2addr p3, v0

    .line 33
    int-to-float p3, p3

    .line 34
    invoke-virtual {p0, p3}, Landroid/view/View;->setPivotX(F)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Y0()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    const-string v0, "sending"

    .line 45
    .line 46
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    const-string v0, "failed"

    .line 51
    .line 52
    if-eqz p3, :cond_2

    .line 53
    .line 54
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    const-wide/32 v6, 0x3b9aca00

    .line 61
    .line 62
    .line 63
    sub-long/2addr v4, v6

    .line 64
    cmp-long p3, v2, v4

    .line 65
    .line 66
    iget-wide v2, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 67
    .line 68
    if-lez p3, :cond_1

    .line 69
    .line 70
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 71
    .line 72
    new-instance p3, Ll/qbq;

    .line 73
    .line 74
    invoke-direct {p3, p0}, Ll/qbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 75
    .line 76
    .line 77
    const-wide/16 v2, 0x3e8

    .line 78
    .line 79
    invoke-virtual {p0, p3, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->s1()V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    const-wide/16 v2, -0xa

    .line 98
    .line 99
    if-eqz p3, :cond_3

    .line 100
    .line 101
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->v1()V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->J0:J

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->w1()V

    .line 110
    .line 111
    .line 112
    :goto_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 113
    .line 114
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    if-eqz p3, :cond_4

    .line 123
    .line 124
    const-string p3, "ms_vr_ct_tg"

    .line 125
    .line 126
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    if-nez p3, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_4
    const/4 p3, 0x0

    .line 139
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    invoke-interface {p3}, Ll/r97;->E()Z

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    if-eqz p3, :cond_5

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 157
    .line 158
    .line 159
    move-result p3

    .line 160
    if-eqz p3, :cond_5

    .line 161
    .line 162
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 163
    .line 164
    const-string v0, "group"

    .line 165
    .line 166
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    if-eqz p3, :cond_5

    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 179
    .line 180
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {p4, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-interface {p1, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    new-instance p2, Ll/rbq;

    .line 191
    .line 192
    invoke-direct {p2, p0}, Ll/rbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 193
    .line 194
    .line 195
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    .line 206
    move-result-object p3

    .line 207
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 208
    .line 209
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 210
    .line 211
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-interface {p1, p3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object p3

    .line 221
    new-instance v0, Ll/sbq;

    .line 222
    .line 223
    invoke-direct {v0, p0}, Ll/sbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 224
    .line 225
    .line 226
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 231
    .line 232
    .line 233
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 234
    .line 235
    .line 236
    move-result-object p3

    .line 237
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 238
    .line 239
    .line 240
    move-result-object p3

    .line 241
    invoke-interface {p3}, Ll/r97;->B()Z

    .line 242
    .line 243
    .line 244
    move-result p3

    .line 245
    const/4 v0, 0x1

    .line 246
    if-eqz p3, :cond_7

    .line 247
    .line 248
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 249
    .line 250
    .line 251
    move-result-object p3

    .line 252
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 253
    .line 254
    .line 255
    move-result-object p3

    .line 256
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 257
    .line 258
    invoke-interface {p3, v2}, Ll/r97;->Q4(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result p3

    .line 262
    if-eqz p3, :cond_7

    .line 263
    .line 264
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 265
    .line 266
    instance-of p3, p3, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 267
    .line 268
    if-eqz p3, :cond_7

    .line 269
    .line 270
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {p3}, Ll/hcp;->c(Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result p3

    .line 276
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->G0:Lv/VText;

    .line 277
    .line 278
    if-eqz p3, :cond_6

    .line 279
    .line 280
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 281
    .line 282
    .line 283
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 284
    .line 285
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 286
    .line 287
    .line 288
    goto :goto_2

    .line 289
    :cond_6
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 293
    .line 294
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 298
    .line 299
    .line 300
    move-result-object p3

    .line 301
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 302
    .line 303
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 304
    .line 305
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 310
    .line 311
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 312
    .line 313
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {v3, v4}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    new-instance v4, Ll/r9q;

    .line 320
    .line 321
    invoke-direct {v4}, Ll/r9q;-><init>()V

    .line 322
    .line 323
    .line 324
    invoke-static {v2, v3, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    invoke-interface {p1, p3, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 329
    .line 330
    .line 331
    move-result-object p3

    .line 332
    new-instance v2, Ll/tbq;

    .line 333
    .line 334
    invoke-direct {v2, p0}, Ll/tbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 335
    .line 336
    .line 337
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    invoke-virtual {p3, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 342
    .line 343
    .line 344
    goto :goto_2

    .line 345
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->G0:Lv/VText;

    .line 346
    .line 347
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 348
    .line 349
    .line 350
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W:Landroid/widget/FrameLayout;

    .line 351
    .line 352
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 353
    .line 354
    .line 355
    :goto_2
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 356
    .line 357
    .line 358
    move-result-object p3

    .line 359
    invoke-virtual {p3, p2, p4}, Ll/o3z;->n(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 360
    .line 361
    .line 362
    move-result p3

    .line 363
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->F0:Landroid/widget/FrameLayout;

    .line 364
    .line 365
    if-eqz p3, :cond_8

    .line 366
    .line 367
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 371
    .line 372
    .line 373
    move-result-object p3

    .line 374
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->H0:Lv/VText;

    .line 375
    .line 376
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 377
    .line 378
    invoke-static {p3, p4, v2}, Ll/o3z;->l(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    goto :goto_3

    .line 382
    :cond_8
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 383
    .line 384
    .line 385
    :goto_3
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->F0:Landroid/widget/FrameLayout;

    .line 386
    .line 387
    new-instance p4, Ll/bbq;

    .line 388
    .line 389
    invoke-direct {p4, p0, p2}, Ll/bbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 390
    .line 391
    .line 392
    invoke-static {p3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->x0(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 396
    .line 397
    .line 398
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 399
    .line 400
    .line 401
    move-result-object p3

    .line 402
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 403
    .line 404
    .line 405
    move-result-object p3

    .line 406
    invoke-interface {p3}, Ll/r97;->g1()Z

    .line 407
    .line 408
    .line 409
    move-result p3

    .line 410
    if-eqz p3, :cond_9

    .line 411
    .line 412
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 413
    .line 414
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    move-result p3

    .line 418
    if-eqz p3, :cond_9

    .line 419
    .line 420
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 421
    .line 422
    instance-of p4, p3, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 423
    .line 424
    if-eqz p4, :cond_9

    .line 425
    .line 426
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 427
    .line 428
    new-instance p4, Ll/cbq;

    .line 429
    .line 430
    invoke-direct {p4, p0}, Ll/cbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->setAudioViewVisibleCallback(Ll/y20;)V

    .line 434
    .line 435
    .line 436
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 437
    .line 438
    .line 439
    move-result-object p3

    .line 440
    instance-of p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 441
    .line 442
    if-eqz p3, :cond_c

    .line 443
    .line 444
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 445
    .line 446
    .line 447
    move-result-object p3

    .line 448
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 449
    .line 450
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 451
    .line 452
    instance-of p3, p3, Ll/tvz;

    .line 453
    .line 454
    if-eqz p3, :cond_c

    .line 455
    .line 456
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 457
    .line 458
    .line 459
    move-result-object p3

    .line 460
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 461
    .line 462
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 463
    .line 464
    check-cast p3, Ll/tvz;

    .line 465
    .line 466
    invoke-virtual {p3}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 467
    .line 468
    .line 469
    move-result-object p3

    .line 470
    iget p4, p3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 471
    .line 472
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 473
    .line 474
    iget v2, v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 475
    .line 476
    if-le p4, v2, :cond_c

    .line 477
    .line 478
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 479
    .line 480
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result p4

    .line 484
    if-eqz p4, :cond_c

    .line 485
    .line 486
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 487
    .line 488
    instance-of v2, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 489
    .line 490
    if-nez v2, :cond_a

    .line 491
    .line 492
    instance-of v2, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;

    .line 493
    .line 494
    if-nez v2, :cond_a

    .line 495
    .line 496
    instance-of v2, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 497
    .line 498
    if-nez v2, :cond_a

    .line 499
    .line 500
    instance-of v2, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;

    .line 501
    .line 502
    if-eqz v2, :cond_c

    .line 503
    .line 504
    :cond_a
    move-object v3, p4

    .line 505
    check-cast v3, Landroid/view/View;

    .line 506
    .line 507
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    sget v5, Ll/qa00;->i:I

    .line 512
    .line 513
    const/4 v8, 0x0

    .line 514
    const/4 v9, 0x0

    .line 515
    const/4 v6, -0x1

    .line 516
    const/4 v7, 0x0

    .line 517
    invoke-static/range {v3 .. v9}, Ll/zfm;->b(Landroid/view/View;IIIIII)V

    .line 518
    .line 519
    .line 520
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 521
    .line 522
    instance-of v2, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 523
    .line 524
    if-eqz v2, :cond_b

    .line 525
    .line 526
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 527
    .line 528
    iget-object p4, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 529
    .line 530
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->c(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 531
    .line 532
    .line 533
    move-result v2

    .line 534
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 535
    .line 536
    .line 537
    move-result p3

    .line 538
    invoke-virtual {p4, v2, p3}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->i(II)V

    .line 539
    .line 540
    .line 541
    :cond_b
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 542
    .line 543
    instance-of p4, p3, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;

    .line 544
    .line 545
    if-eqz p4, :cond_c

    .line 546
    .line 547
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;

    .line 548
    .line 549
    sget p4, Ll/edc0;->M4:I

    .line 550
    .line 551
    invoke-virtual {p3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 552
    .line 553
    .line 554
    move-result-object p3

    .line 555
    invoke-virtual {p3, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 556
    .line 557
    .line 558
    :cond_c
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 559
    .line 560
    const-string p4, "state_comment"

    .line 561
    .line 562
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 563
    .line 564
    .line 565
    move-result p3

    .line 566
    if-nez p3, :cond_f

    .line 567
    .line 568
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 569
    .line 570
    const-string p4, "state_like"

    .line 571
    .line 572
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 573
    .line 574
    .line 575
    move-result p3

    .line 576
    if-eqz p3, :cond_d

    .line 577
    .line 578
    goto :goto_4

    .line 579
    :cond_d
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 580
    .line 581
    const-string p2, "literature"

    .line 582
    .line 583
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 584
    .line 585
    .line 586
    move-result p1

    .line 587
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O:Landroid/widget/FrameLayout;

    .line 588
    .line 589
    if-eqz p1, :cond_e

    .line 590
    .line 591
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 592
    .line 593
    .line 594
    move-result-object p1

    .line 595
    sget p3, Ll/eac0;->f:I

    .line 596
    .line 597
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 598
    .line 599
    .line 600
    move-result p1

    .line 601
    float-to-int p1, p1

    .line 602
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 603
    .line 604
    .line 605
    goto :goto_6

    .line 606
    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 607
    .line 608
    .line 609
    move-result-object p1

    .line 610
    sget p3, Ll/eac0;->c:I

    .line 611
    .line 612
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 613
    .line 614
    .line 615
    move-result p1

    .line 616
    float-to-int p1, p1

    .line 617
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 618
    .line 619
    .line 620
    goto :goto_6

    .line 621
    :cond_f
    :goto_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 622
    .line 623
    .line 624
    move-result-object p3

    .line 625
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 626
    .line 627
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 628
    .line 629
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 630
    .line 631
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 632
    .line 633
    .line 634
    move-result v1

    .line 635
    if-eqz v1, :cond_10

    .line 636
    .line 637
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 638
    .line 639
    goto :goto_5

    .line 640
    :cond_10
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 641
    .line 642
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 643
    .line 644
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 645
    .line 646
    .line 647
    move-result-object v1

    .line 648
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 649
    .line 650
    :goto_5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 651
    .line 652
    invoke-virtual {p4, v1, p2}, Lcom/p1/mobile/putong/core/api/i;->v3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 653
    .line 654
    .line 655
    move-result-object p2

    .line 656
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 657
    .line 658
    .line 659
    move-result-object p2

    .line 660
    invoke-interface {p1, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 661
    .line 662
    .line 663
    move-result-object p1

    .line 664
    new-instance p2, Ll/dbq;

    .line 665
    .line 666
    invoke-direct {p2, p0}, Ll/dbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 667
    .line 668
    .line 669
    new-instance p3, Ll/ebq;

    .line 670
    .line 671
    invoke-direct {p3}, Ll/ebq;-><init>()V

    .line 672
    .line 673
    .line 674
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 675
    .line 676
    .line 677
    move-result-object p2

    .line 678
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 679
    .line 680
    .line 681
    :goto_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 682
    .line 683
    .line 684
    move-result-object p1

    .line 685
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 686
    .line 687
    .line 688
    move-result-object p1

    .line 689
    invoke-interface {p1}, Ll/r97;->p5()Z

    .line 690
    .line 691
    .line 692
    move-result p1

    .line 693
    if-eqz p1, :cond_11

    .line 694
    .line 695
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 696
    .line 697
    new-instance p2, Ll/fbq;

    .line 698
    .line 699
    invoke-direct {p2, p0}, Ll/fbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;)V

    .line 700
    .line 701
    .line 702
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 703
    .line 704
    .line 705
    :cond_11
    return-void
.end method

.method public final synthetic g1(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->I0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 34
    .line 35
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Q:Lv/VImage;

    .line 39
    .line 40
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic h1(Ll/pf60;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->k0:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->p0:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic i1(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->R2(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic j1(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->W(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/eac0;->d:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    float-to-int p0, p0

    .line 26
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Ll/eac0;->e:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    float-to-int p0, p0

    .line 43
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final k1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N0:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N0:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N0:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public l1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->U:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 22
    .line 23
    const-string v0, "\u9650\u65f6\u5feb\u62cd \u00b7 "

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 34
    .line 35
    const-string v0, "\u9650\u65f6\u5feb\u62cd \u00b7 \u672a\u8bfb"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 42
    .line 43
    if-ne v0, v1, :cond_2

    .line 44
    .line 45
    const-string v0, "\u9650\u65f6\u5feb\u62cd \u00b7 \u5df2\u8bfb"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const-string v0, "\u9650\u65f6\u5feb\u62cd"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public m1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/g900;ZJJ)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 2
    .line 3
    .line 4
    if-eqz p5, :cond_1

    .line 5
    .line 6
    if-eqz p3, :cond_1

    .line 7
    .line 8
    iget-object p5, p3, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 9
    .line 10
    const-string v0, "default"

    .line 11
    .line 12
    invoke-static {p5, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p5

    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    iget-object p5, p3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-nez p5, :cond_0

    .line 25
    .line 26
    iget-object p5, p3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "heartbeatMatch"

    .line 29
    .line 30
    invoke-static {p5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p5

    .line 34
    if-nez p5, :cond_0

    .line 35
    .line 36
    invoke-static {p3}, Ll/br5;->t(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 37
    .line 38
    .line 39
    move-result p5

    .line 40
    if-eqz p5, :cond_1

    .line 41
    .line 42
    :cond_0
    iget-object p5, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "-"

    .line 45
    .line 46
    invoke-virtual {p5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p5

    .line 50
    if-nez p5, :cond_1

    .line 51
    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    iget-object p5, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "fake_id_"

    .line 57
    .line 58
    invoke-virtual {p5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p5

    .line 62
    if-nez p5, :cond_1

    .line 63
    .line 64
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 65
    .line 66
    invoke-static {p5}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 67
    .line 68
    .line 69
    move-result p5

    .line 70
    if-nez p5, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->V:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object p5, p3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, p5}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    move-object v1, p1

    .line 85
    move-object v2, p2

    .line 86
    move-object v3, p3

    .line 87
    move-object v4, p4

    .line 88
    move-wide/from16 v6, p6

    .line 89
    .line 90
    move-wide/from16 v8, p8

    .line 91
    .line 92
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->W(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/g900;Lcom/p1/mobile/putong/data/User;JJ)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->V:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    .line 97
    .line 98
    const/4 p1, 0x0

    .line 99
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public n1(Lcom/p1/mobile/putong/core/data/Message;ZJJ)V
    .locals 9

    .line 1
    const/4 v2, -0x1

    .line 2
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->setReadStateLayoutParams(Z)V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_9

    .line 9
    .line 10
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 11
    .line 12
    const-string v4, "-1"

    .line 13
    .line 14
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-nez v3, :cond_9

    .line 19
    .line 20
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const-string v4, "fake_id_"

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-nez v3, :cond_9

    .line 29
    .line 30
    const-string v3, "-10040"

    .line 31
    .line 32
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_9

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_9

    .line 47
    .line 48
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_9

    .line 55
    .line 56
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v3}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    goto/16 :goto_3

    .line 65
    .line 66
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const-string v4, "normal"

    .line 71
    .line 72
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-nez v3, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-interface {v3}, Ll/r97;->E()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_2

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 115
    .line 116
    invoke-interface {v3, v4}, Ll/r97;->o1(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 127
    .line 128
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->K0:D

    .line 129
    .line 130
    cmpl-double v5, v3, v5

    .line 131
    .line 132
    if-eqz v5, :cond_4

    .line 133
    .line 134
    const/4 v5, 0x1

    .line 135
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L0:Z

    .line 136
    .line 137
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->K0:D

    .line 138
    .line 139
    :cond_4
    :try_start_0
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 142
    .line 143
    .line 144
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    goto :goto_0

    .line 146
    :catch_0
    const-wide v3, 0x7fffffffffffffffL

    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    invoke-virtual {v6}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-interface {v6}, Ll/r97;->h()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 170
    .line 171
    const-string v7, "love_letter"

    .line 172
    .line 173
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    invoke-virtual {v7}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-interface {v7}, Ll/r97;->s4()Z

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    if-nez v7, :cond_5

    .line 190
    .line 191
    if-nez v5, :cond_5

    .line 192
    .line 193
    if-eqz v6, :cond_8

    .line 194
    .line 195
    :cond_5
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 198
    .line 199
    invoke-virtual {v7}, Ll/joa;->K3()Z

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    if-nez v7, :cond_7

    .line 204
    .line 205
    if-nez v5, :cond_7

    .line 206
    .line 207
    if-nez v6, :cond_7

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    invoke-interface {v5}, Ll/r97;->w2()Z

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    if-eqz v5, :cond_6

    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->t1()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->u1()V

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->U:Lv/VImage;

    .line 231
    .line 232
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 233
    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_7
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    .line 237
    .line 238
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 239
    .line 240
    double-to-long v7, v1

    .line 241
    move-object v0, p0

    .line 242
    move-wide v1, p3

    .line 243
    move-wide v5, p5

    .line 244
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->W0(JJJJ)Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->r1(Z)V

    .line 249
    .line 250
    .line 251
    :cond_8
    :goto_2
    return-void

    .line 252
    :cond_9
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public o1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->U:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 22
    .line 23
    const-string v0, "\u4ee5\u56fe\u6362\u56fe \u00b7 "

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 34
    .line 35
    const-string v0, "\u4ee5\u56fe\u6362\u56fe \u00b7 \u672a\u8bfb"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 42
    .line 43
    if-ne v0, v1, :cond_2

    .line 44
    .line 45
    const-string v0, "\u4ee5\u56fe\u6362\u56fe \u00b7 \u5df2\u8bfb"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const-string v0, "\u4ee5\u56fe\u6362\u56fe"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 18
    .line 19
    const-string v0, "default"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->p1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 78
    .line 79
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 80
    .line 81
    const/4 v2, 0x3

    .line 82
    if-eq v1, v2, :cond_3

    .line 83
    .line 84
    const/4 v2, 0x4

    .line 85
    if-eq v1, v2, :cond_3

    .line 86
    .line 87
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 88
    .line 89
    iget-object v1, v1, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 90
    .line 91
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_3

    .line 96
    .line 97
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->mutedByFriend()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_2

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 115
    .line 116
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->p1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/h39;->S()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->q1()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "failed"

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->N:Lcom/p1/mobile/putong/core/data/Message;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "ms_vr_ct_tg"

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final q1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->k1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->S:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->U:Lv/VImage;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->O0:Z

    .line 21
    .line 22
    return-void
.end method

.method public final r1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->q2:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    sget v0, Ll/g9c0;->i:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    sget v0, Ll/g9c0;->I:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->P0:I

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->r2:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Ll/g9c0;->J:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget v0, Ll/g9c0;->j:I

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_3

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->T:Lv/VText;

    .line 121
    .line 122
    const-string p1, "#FE7E1D"

    .line 123
    .line 124
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    :cond_3
    return-void
.end method

.method public final s1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->j()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 14
    .line 15
    check-cast v0, Lv/VProgressBar;

    .line 16
    .line 17
    invoke-virtual {v0}, Lv/VProgressBar;->d()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 21
    .line 22
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureRight;->g()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 36
    .line 37
    check-cast v0, Lv/VProgressBar;

    .line 38
    .line 39
    invoke-virtual {v0}, Lv/VProgressBar;->d()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 43
    .line 44
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->s()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 58
    .line 59
    check-cast v0, Lv/VProgressBar;

    .line 60
    .line 61
    invoke-virtual {v0}, Lv/VProgressBar;->d()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 65
    .line 66
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 71
    .line 72
    check-cast v0, Lv/VProgressBar;

    .line 73
    .line 74
    invoke-virtual {v0}, Lv/VProgressBar;->c()V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 78
    .line 79
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final t1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L0:Z

    .line 7
    .line 8
    const-string p0, "remark_type"

    .line 9
    .line 10
    const-string v0, "message"

    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "e_read_remark"

    .line 21
    .line 22
    const-string v1, "p_chat_view"

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final u1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M0:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 21
    .line 22
    new-instance v1, Ll/gbq;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ll/gbq;-><init>(Ll/clz;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final v1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->i()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 14
    .line 15
    check-cast v0, Lv/VProgressBar;

    .line 16
    .line 17
    invoke-virtual {v0}, Lv/VProgressBar;->d()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 26
    .line 27
    check-cast v0, Lv/VProgressBar;

    .line 28
    .line 29
    invoke-virtual {v0}, Lv/VProgressBar;->d()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->M:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->L:Landroid/widget/ImageView;

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final w1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->Y0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 5
    .line 6
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->i()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
