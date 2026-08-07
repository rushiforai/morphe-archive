.class public Ll/tvz;
.super Ll/clz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/clz<",
        "Lcom/p1/mobile/putong/data/User;",
        "Ll/yxz;",
        ">;"
    }
.end annotation


# instance fields
.field public I0:Z

.field public J0:Ll/n4z;

.field public K0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/ChatBlockStatus;",
            ">;"
        }
    .end annotation
.end field

.field public L0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public M0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final N0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public O0:Z

.field public volatile P0:Z

.field public Q0:Z

.field public R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

.field public S0:Lcom/p1/mobile/putong/core/data/ChatHeat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public T0:Ll/n100;

.field public U0:Ll/kr5;

.field public V0:Z

.field public W0:Z

.field public X0:I

.field public Y0:Ljava/lang/Runnable;

.field public Z0:Z

.field public a1:Ll/byd0;

.field public b1:Ljava/lang/String;

.field public c1:Z

.field public d1:I

.field public e1:Ll/jxd0;

.field public f1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qbm;",
            ">;"
        }
    .end annotation
.end field

.field public g1:Ljava/lang/Runnable;

.field public h1:Z

.field public i1:Z

.field public j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

.field public k1:Ljava/lang/String;

.field public l1:Ljava/lang/Runnable;

.field public m1:Z

.field public n1:Z

.field public o1:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/clz;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/tvz;->I0:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/tvz;->K0:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/tvz;->L0:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/tvz;->M0:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/tvz;->N0:Lrx/subjects/a;

    .line 30
    .line 31
    iput-boolean p1, p0, Ll/tvz;->O0:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Ll/tvz;->P0:Z

    .line 34
    .line 35
    iput-boolean p1, p0, Ll/tvz;->Q0:Z

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 39
    .line 40
    new-instance v1, Ll/n100;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/n100;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Ll/tvz;->T0:Ll/n100;

    .line 46
    .line 47
    iput-boolean p1, p0, Ll/tvz;->V0:Z

    .line 48
    .line 49
    iput-boolean p1, p0, Ll/tvz;->W0:Z

    .line 50
    .line 51
    iput-object v0, p0, Ll/tvz;->Y0:Ljava/lang/Runnable;

    .line 52
    .line 53
    iput-boolean p1, p0, Ll/tvz;->Z0:Z

    .line 54
    .line 55
    const-string v1, ""

    .line 56
    .line 57
    iput-object v1, p0, Ll/tvz;->b1:Ljava/lang/String;

    .line 58
    .line 59
    iput-boolean p1, p0, Ll/tvz;->c1:Z

    .line 60
    .line 61
    new-instance v1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 67
    .line 68
    new-instance v1, Ll/apz;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/apz;-><init>(Ll/tvz;)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Ll/tvz;->g1:Ljava/lang/Runnable;

    .line 74
    .line 75
    iput-boolean p1, p0, Ll/tvz;->h1:Z

    .line 76
    .line 77
    iput-boolean p1, p0, Ll/tvz;->i1:Z

    .line 78
    .line 79
    iput-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 80
    .line 81
    new-instance v0, Ll/bpz;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/bpz;-><init>(Ll/tvz;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Ll/tvz;->l1:Ljava/lang/Runnable;

    .line 87
    .line 88
    iput-boolean p1, p0, Ll/tvz;->m1:Z

    .line 89
    .line 90
    new-instance p1, Ll/cpz;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Ll/cpz;-><init>(Ll/tvz;)V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Ll/tvz;->o1:Ljava/lang/Runnable;

    .line 96
    .line 97
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_1

    .line 102
    .line 103
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    iput-object p1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 106
    .line 107
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 108
    .line 109
    iput-object p1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 110
    .line 111
    iput-object p2, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 112
    .line 113
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->mj()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_0

    .line 126
    .line 127
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/n46;->o(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    iput-boolean p1, p0, Ll/tvz;->Z0:Z

    .line 138
    .line 139
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p1, p0, Ll/tvz;->b1:Ljava/lang/String;

    .line 142
    .line 143
    :cond_1
    new-instance p1, Ll/byd0;

    .line 144
    .line 145
    new-instance p2, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v0, "chat_assistant_question_message_show_time_"

    .line 148
    .line 149
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v0, "_"

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    const-wide/16 v0, 0x0

    .line 178
    .line 179
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 184
    .line 185
    .line 186
    iput-object p1, p0, Ll/tvz;->a1:Ll/byd0;

    .line 187
    .line 188
    return-void
.end method

.method public static synthetic A7(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic A8(Ll/tvz;ZLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Fe(ZLl/pf60;)V

    return-void
.end method

.method public static synthetic A9(Ll/tvz;Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Pf(Ll/bkj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Aa(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2
    .line 3
    const-string v1, "blocked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    const-string v0, "dismissed"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic Ab(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Oe(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic B7(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic B8(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Wd(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic B9(Ll/tvz;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Yf(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Ba(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Bb(Ll/tvz;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Df(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C7(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ae(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic C8(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic C9()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Ca(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Sd()V

    return-void
.end method

.method public static synthetic Cb(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Wf(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D7(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fqz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fqz;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic D8(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lu8;->I3()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic D9(Ll/tvz;Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Hf(Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V

    return-void
.end method

.method public static synthetic Da(Ll/tvz;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ke(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic Db(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ng(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    return-void
.end method

.method public static synthetic E7(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tvz;->qg(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic E8(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "\u5934\u50cf"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "\u8ba4\u8bc1"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "\u672c\u4eba"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic E9(Ll/tvz;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ze(Ll/jl80;)V

    return-void
.end method

.method public static synthetic Ea(Ll/tvz;Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ce(Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;)V

    return-void
.end method

.method public static synthetic Eb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private Ed(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "initWarmingUpView = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/tvz;->O0:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " level = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Ll/tvz;->O0:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Ll/tvz;->O0:Z

    .line 35
    .line 36
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v0, Ll/yxz;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ll/yxz;->S3(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/d3z;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/d3z;->H0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic F7(Ll/tvz;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ig(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F8(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;
    .locals 2

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 2
    .line 3
    int-to-double v0, p0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->f(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic F9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->og()V

    return-void
.end method

.method public static synthetic Fa(Ll/tvz;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Re(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Fb(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Pe(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic G7(Ll/tvz;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ld(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic G8(Ll/tvz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Sg(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic G9(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic Ga(Ll/tvz;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ae(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Gb(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic H7(Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Message;Lcom/google/common/base/Optional;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H8(Ll/tvz;Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->bg(Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H9(Ll/tvz;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->qe(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic Ha(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Le(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Hb(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->pg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    return-void
.end method

.method public static synthetic I7(Lcom/google/common/base/Optional;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/qbm;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/qbm;->handle()Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic I8(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->te()V

    return-void
.end method

.method public static synthetic Ia(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Ib(Ll/tvz;Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->If(Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V

    return-void
.end method

.method public static synthetic J7(IZLcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput p0, p2, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 2
    .line 3
    iput-boolean p1, p2, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic J8(Ll/tvz;Z[ZLl/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->Ye(Z[ZLl/jl80;)V

    return-void
.end method

.method public static synthetic J9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Ja(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Jb(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "default"

    .line 18
    .line 19
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic K7(Ll/tvz;[Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ue([Ll/jl80;)V

    return-void
.end method

.method public static synthetic K8(Ll/tvz;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ie(Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K9(Ll/tvz;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->dg(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Ka(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->oe(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Kb(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Kd()V

    return-void
.end method

.method public static synthetic L7(Ll/tvz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Cf(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L8(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ie(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    return-void
.end method

.method public static synthetic L9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic La(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "default"

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-static {p0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 40
    .line 41
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public static synthetic Lb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M7(Ll/bkj0;Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ll/pf60;

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ll/pf60;

    .line 16
    .line 17
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    if-eq p0, p1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic M8(Ll/tvz;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Bf()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M9(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Ma(Ljava/util/ArrayList;[Ljava/lang/Object;)Lcom/google/common/base/Optional;
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/zrz;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/zrz;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, ", "

    .line 11
    .line 12
    invoke-static {p1, v0, v1}, Ll/jyb;->o0(Ljava/util/Collection;Ll/qcj;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ge v0, v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ll/qbm;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ll/qbm;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static synthetic Mb(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private Mc()V
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/clz;->T2()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/qu20;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/qu20;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/qsz;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/qsz;-><init>(Ll/tvz;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic N7(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Qd()V

    return-void
.end method

.method public static synthetic N8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Zf()V

    return-void
.end method

.method public static synthetic N9(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Na(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Nb(Ll/tvz;[ZLjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->af([ZLjava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O7(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->le(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic O8(Ll/tvz;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->jg(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O9(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Oa(Ll/tvz;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Kf(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Ob(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic P7(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic P8(Ll/tvz;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->De(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method

.method public static synthetic P9(Ll/tvz;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->rg(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Pa(Ll/tvz;Z[ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->Ze(Z[ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic Pb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q7(Ll/tvz;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->de(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q8(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ud(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Q9(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic Qa(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Qb(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Se(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic R7(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Xf()V

    return-void
.end method

.method public static synthetic R8(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic R9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->kf()V

    return-void
.end method

.method public static synthetic Ra(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->of(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Rb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S7(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Od()V

    return-void
.end method

.method public static synthetic S9(Ll/tvz;ZLl/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Ue(ZLl/jl80;)V

    return-void
.end method

.method public static synthetic Sa(Ll/tvz;[Ll/jl80;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->ve([Ll/jl80;Ll/ovb0;)V

    return-void
.end method

.method public static synthetic Sb(Ll/tvz;Ljava/lang/Integer;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->Qe(Ljava/lang/Integer;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method private Sc()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object v2, p0, Ll/clz;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_3

    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/f49;->D3()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v3, Ll/muz;

    .line 60
    .line 61
    invoke-direct {v3, p0}, Ll/muz;-><init>(Ll/tvz;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    new-instance v3, Ll/xuz;

    .line 76
    .line 77
    invoke-direct {v3, v0, v2}, Ll/xuz;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;Lrx/subjects/a;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v3}, Ll/ar2;->creates(Ll/y20;)V

    .line 81
    .line 82
    .line 83
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 84
    .line 85
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 86
    .line 87
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 88
    .line 89
    const/4 v4, 0x1

    .line 90
    if-eqz v3, :cond_2

    .line 91
    .line 92
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    new-instance v5, Ll/dvz;

    .line 105
    .line 106
    invoke-direct {v5}, Ll/dvz;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    new-instance v5, Ll/quz;

    .line 118
    .line 119
    invoke-direct {v5}, Ll/quz;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v3, v2, v5}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-virtual {v3, v5}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    new-instance v5, Ll/evz;

    .line 143
    .line 144
    invoke-direct {v5, p0, v1}, Ll/evz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V

    .line 145
    .line 146
    .line 147
    new-instance v6, Ll/fvz;

    .line 148
    .line 149
    invoke-direct {v6}, Ll/fvz;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-static {v5, v6}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    invoke-virtual {v3, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 160
    .line 161
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    new-instance v5, Ll/gvz;

    .line 172
    .line 173
    invoke-direct {v5}, Ll/gvz;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v3, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    new-instance v5, Ll/quz;

    .line 185
    .line 186
    invoke-direct {v5}, Ll/quz;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-static {v3, v2, v5}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-virtual {v3, v5}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    new-instance v5, Ll/ivz;

    .line 210
    .line 211
    invoke-direct {v5, p0, v1}, Ll/ivz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V

    .line 212
    .line 213
    .line 214
    new-instance v1, Ll/jvz;

    .line 215
    .line 216
    invoke-direct {v1}, Ll/jvz;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-static {v5, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v3, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 224
    .line 225
    .line 226
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 227
    .line 228
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Jo()Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v1, v4}, Lrx/c;->take(I)Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    new-instance v3, Ll/nuz;

    .line 243
    .line 244
    invoke-direct {v3}, Ll/nuz;-><init>()V

    .line 245
    .line 246
    .line 247
    new-instance v5, Ll/ouz;

    .line 248
    .line 249
    invoke-direct {v5}, Ll/ouz;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-static {v3, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 257
    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :cond_2
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 262
    .line 263
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 264
    .line 265
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v5

    .line 269
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Jg(Ljava/lang/String;)Lrx/c;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    new-instance v5, Ll/puz;

    .line 274
    .line 275
    invoke-direct {v5}, Ll/puz;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v3, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    new-instance v5, Ll/quz;

    .line 287
    .line 288
    invoke-direct {v5}, Ll/quz;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-static {v3, v2, v5}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 300
    .line 301
    .line 302
    move-result-object v5

    .line 303
    invoke-virtual {v3, v5}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    new-instance v5, Ll/ruz;

    .line 312
    .line 313
    invoke-direct {v5, p0, v1}, Ll/ruz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V

    .line 314
    .line 315
    .line 316
    new-instance v6, Ll/suz;

    .line 317
    .line 318
    invoke-direct {v6}, Ll/suz;-><init>()V

    .line 319
    .line 320
    .line 321
    invoke-static {v5, v6}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 322
    .line 323
    .line 324
    move-result-object v5

    .line 325
    invoke-virtual {v3, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 326
    .line 327
    .line 328
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 329
    .line 330
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 331
    .line 332
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Jg(Ljava/lang/String;)Lrx/c;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    new-instance v5, Ll/tuz;

    .line 341
    .line 342
    invoke-direct {v5}, Ll/tuz;-><init>()V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    new-instance v5, Ll/quz;

    .line 354
    .line 355
    invoke-direct {v5}, Ll/quz;-><init>()V

    .line 356
    .line 357
    .line 358
    invoke-static {v3, v2, v5}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    invoke-virtual {v3, v4}, Lrx/c;->take(I)Lrx/c;

    .line 363
    .line 364
    .line 365
    move-result-object v3

    .line 366
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-virtual {v3, v5}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    new-instance v5, Ll/uuz;

    .line 379
    .line 380
    invoke-direct {v5, p0, v1}, Ll/uuz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V

    .line 381
    .line 382
    .line 383
    new-instance v1, Ll/vuz;

    .line 384
    .line 385
    invoke-direct {v1}, Ll/vuz;-><init>()V

    .line 386
    .line 387
    .line 388
    invoke-static {v5, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    invoke-virtual {v3, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 393
    .line 394
    .line 395
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 396
    .line 397
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 398
    .line 399
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 400
    .line 401
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    new-instance v3, Ll/yuz;

    .line 406
    .line 407
    invoke-direct {v3}, Ll/yuz;-><init>()V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v1, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    new-instance v3, Ll/zuz;

    .line 419
    .line 420
    invoke-direct {v3}, Ll/zuz;-><init>()V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v1, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    invoke-virtual {v1, v4}, Lrx/c;->take(I)Lrx/c;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    new-instance v3, Ll/avz;

    .line 432
    .line 433
    invoke-direct {v3}, Ll/avz;-><init>()V

    .line 434
    .line 435
    .line 436
    invoke-static {v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    new-instance v2, Ll/bvz;

    .line 453
    .line 454
    invoke-direct {v2, p0, v0}, Ll/bvz;-><init>(Ll/tvz;Z)V

    .line 455
    .line 456
    .line 457
    new-instance p0, Ll/cvz;

    .line 458
    .line 459
    invoke-direct {p0}, Ll/cvz;-><init>()V

    .line 460
    .line 461
    .line 462
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 467
    .line 468
    .line 469
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic T7(Ll/tvz;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->xf(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T8(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ff(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic T9(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->jf(Ll/pf60;)V

    return-void
.end method

.method public static synthetic Ta(Ll/tvz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->He(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic Tb(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Tf()V

    return-void
.end method

.method public static synthetic U7(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->lf(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic U8(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->me(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic U9(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Rf(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic Ua(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->we()V

    return-void
.end method

.method public static synthetic Ub(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private Uc()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Mf(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/sb8;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/sb8;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/td;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/td;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/ovz;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/ovz;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/pvz;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/pvz;-><init>(Ll/tvz;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance v0, Ll/qvz;

    .line 85
    .line 86
    invoke-direct {v0}, Ll/qvz;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic V7(Ll/tvz;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ne(Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method

.method public static synthetic V8(Ll/qbm;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic V9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Rd()V

    return-void
.end method

.method public static synthetic Va(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Vb(Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->Ra()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic W7(Ll/tvz;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Ee(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method

.method public static synthetic W8(Ljava/lang/Class;Ll/qbm;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic W9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Wa(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->se()V

    return-void
.end method

.method public static synthetic Wb(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "\u5934\u50cf"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 68
    .line 69
    const-string v1, "\u8ba4\u8bc1"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 78
    .line 79
    const-string v0, "\u672c\u4eba"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    :cond_0
    const/4 p0, 0x1

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 p0, 0x0

    .line 90
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method private Wc()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/psz;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/psz;-><init>(Ll/tvz;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic X7(Ll/tvz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Mf(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic X8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Nd()V

    return-void
.end method

.method public static synthetic X9(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Vf(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Xa(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ef(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Xb(Ll/jl80;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v0, v0, Ll/dkb;->d3:Ll/wyd0;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic Y7(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Y8(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->mf(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Y9(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Sf(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic Ya(Ll/tvz;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->mg(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Yb(Ll/tvz;[ZLl/jl80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->Xe([ZLl/jl80;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Z7(Ljava/lang/Throwable;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z8(Ll/tvz;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->je(Ll/ovb0;)V

    return-void
.end method

.method public static synthetic Z9(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic Za(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->re(Ll/pf60;)V

    return-void
.end method

.method public static synthetic Zb(Ll/tvz;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Ce(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method

.method public static synthetic a8(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->pf(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic a9(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->fg(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic aa(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic ab(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Yd(Ll/pf60;)V

    return-void
.end method

.method public static synthetic ac(Ll/tvz;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Je(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b8(Ll/tvz;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Nf(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b9(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic ba(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic bb(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Qf(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic bc(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->zd()V

    return-void
.end method

.method public static synthetic c9(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ke(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic ca(Ll/tvz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->rf(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic cb(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic cc(Ll/tvz;[Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->We([Z)V

    return-void
.end method

.method public static synthetic d8(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d9(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic da(Ll/pf60;Ll/qbm;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-interface {p1, v0, p0}, Ll/qbm;->a(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return-object p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    return-object p0
.end method

.method public static synthetic db(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->yf(Ll/pf60;)V

    return-void
.end method

.method public static synthetic dc(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 4
    .line 5
    const-string v0, "messageDetail"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/QuestionnaireScene;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/QuestionnaireScene;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/icb;->c3(Lcom/p1/mobile/putong/core/data/QuestionnaireScene;Lcom/p1/mobile/putong/core/data/QuestionnaireStrategy;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic e8(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ne(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e9(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->uf(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic ea(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ljava/util/List;

    .line 16
    .line 17
    const/4 v2, 0x5

    .line 18
    invoke-static {p0, v2}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    new-instance v0, Ll/jrz;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/jrz;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_0

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const/4 p0, 0x0

    .line 70
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public static synthetic eb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic ec(Lcom/p1/mobile/putong/core/data/Conversation;Lrx/subjects/a;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, v0, p0, p1}, Ll/f49;->z3(ZLjava/lang/String;Lrx/subjects/a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic f8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->ag()V

    return-void
.end method

.method public static synthetic f9(Ll/tvz;Lcom/p1/mobile/putong/data/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ff(Lcom/p1/mobile/putong/data/Location;)V

    return-void
.end method

.method public static synthetic fa(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->cg(Lcom/p1/mobile/putong/core/data/ChatHeat;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic fb(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic fc(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g8(Ll/tvz;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->vf(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g9(Ll/tvz;Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Gf(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ga(Ll/tvz;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->qf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic gb(Ll/tvz;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ee(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic gc(Ll/tvz;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tvz;->X0:I

    return p0
.end method

.method public static synthetic h8(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ge(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic h9(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->tf(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic ha(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "0"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 50
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static synthetic hb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic hc(Ll/tvz;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tvz;->X0:I

    return-void
.end method

.method public static synthetic i8(Ll/qbm;)Lrx/c;
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/qbm;->b()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/xrz;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/xrz;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic i9(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Zd(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic ia(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic ib(Ll/pf60;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->Be(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic j8(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic j9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic ja(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic jb(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic jc(Ll/tvz;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k8(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/data/ChatHeat;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->e(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object p0, v1

    .line 14
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->e(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    :cond_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    if-ne v1, p0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const/4 p0, 0x0

    .line 35
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic k9(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic ka(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic kb()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->h1:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->h1:Ll/jxd0;

    .line 24
    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object v0, v0, Ll/dkb;->i1:Ll/wyd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic kc(Ll/tvz;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l8(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->sf(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic l9(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Xd(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic la(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->wf(Ll/pf60;)V

    return-void
.end method

.method public static synthetic lb(Ll/tvz;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->xe(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic m8(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic m9(Ll/tvz;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Of(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    return-void
.end method

.method public static synthetic ma(Ll/tvz;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Me(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic mb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n8(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic n9(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic na(Ll/tvz;Ll/jl80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Te(Ll/jl80;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic nb(Ll/tvz;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->ef()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o8(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o9(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->ye(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic oa(Ll/tvz;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Md(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic ob(Ll/tvz;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Be(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method

.method public static synthetic p8(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Vd(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic p9(Ll/tvz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Ge(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic pa(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/bsz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/bsz;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic pb(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->lg()V

    return-void
.end method

.method public static synthetic q8()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Pd()V

    return-void
.end method

.method public static synthetic qa(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->hg(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic qb(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r8(Ll/tvz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->cf(Ll/pf60;)V

    return-void
.end method

.method public static synthetic r9(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/mk8;->l0:I

    .line 7
    .line 8
    iget-object p0, p0, Ll/mk8;->k0:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic ra(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic rb(Ll/tvz;Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Uf(Ll/bkj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s8(Ll/tvz;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Lf(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic s9(Ll/tvz;[ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tvz;->Ve([ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic sa(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ll/pf60;

    .line 24
    .line 25
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p0, Ljava/util/Collection;

    .line 28
    .line 29
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 39
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static synthetic sb(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->be(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic t8(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/kqz;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/kqz;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic t9(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic ta(Ll/tvz;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->eg(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic tb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private td()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/wsz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wsz;-><init>(Ll/tvz;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private tg(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/d3z;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/d3z;->t1(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic u7(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic u8(Ll/tvz;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->fe(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u9(Ll/tvz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->he(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic ua(Ll/tvz;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->bf(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ub(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic v7(Ll/tvz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->pe(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic v8(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Jf()V

    return-void
.end method

.method public static synthetic v9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic va(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 1

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/iwl;->getCountHook()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-interface {v0, p0}, Ll/iwl;->setSelectionHook(I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic vb(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private vd()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/rrz;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/rrz;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/srz;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/srz;-><init>(Ll/tvz;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/trz;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/trz;-><init>(Ll/tvz;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic w7(Ll/tvz;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Jd(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w8(Ll/tvz;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->kg(Z)V

    return-void
.end method

.method public static synthetic w9(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic wa(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 11
    .line 12
    new-instance v1, Ll/msz;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/msz;-><init>(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic wb(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic x7(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/n46;->f(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic x8(Ll/tvz;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->df(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic x9(Ll/tvz;Lcom/p1/mobile/putong/core/data/AnalysisGuide;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->gg(Lcom/p1/mobile/putong/core/data/AnalysisGuide;)V

    return-void
.end method

.method public static synthetic xa(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic xb(Ll/tvz;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->Af(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic y7(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y8(Ll/tvz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->hf(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic y9(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Td()V

    return-void
.end method

.method public static synthetic ya(Ll/tvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->zf(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic yb(Ll/pf60;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Integer;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic z7(Ll/tvz;Lcom/p1/mobile/putong/data/Location;)Lcom/p1/mobile/putong/data/Location;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->gf(Lcom/p1/mobile/putong/data/Location;)Lcom/p1/mobile/putong/data/Location;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z8(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z9(Lcom/p1/mobile/putong/data/Location;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic za(Ll/tvz;Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->nf(Ll/bkj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic zb(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final Ac()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ll/dkb;->La(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v2, Ll/usz;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/usz;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v0, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/vsz;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/vsz;-><init>(Ll/tvz;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final Ad()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "local_ux_questionnaire"

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "local_ux_questionnaire_tip"

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hn()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Tm()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    new-instance v2, Ljava/util/Random;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 66
    .line 67
    .line 68
    if-ne v0, v1, :cond_1

    .line 69
    .line 70
    iput v0, p0, Ll/tvz;->d1:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    if-ge v0, v1, :cond_2

    .line 74
    .line 75
    sub-int/2addr v1, v0

    .line 76
    invoke-virtual {v2, v1}, Ljava/util/Random;->nextInt(I)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    add-int/2addr v1, v0

    .line 81
    iput v1, p0, Ll/tvz;->d1:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    sub-int/2addr v0, v1

    .line 85
    invoke-virtual {v2, v0}, Ljava/util/Random;->nextInt(I)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr v0, v1

    .line 90
    iput v0, p0, Ll/tvz;->d1:I

    .line 91
    .line 92
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 95
    .line 96
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-nez v2, :cond_3

    .line 125
    .line 126
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 129
    .line 130
    iget-object v2, v2, Ll/icb;->X:Ll/byd0;

    .line 131
    .line 132
    invoke-static {}, Ll/pzi0;->o()J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    :cond_3
    new-instance v2, Ll/jxd0;

    .line 144
    .line 145
    new-instance v3, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v4, "ux_questionnaire_showed"

    .line 148
    .line 149
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v4, "/"

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 180
    .line 181
    invoke-direct {v2, v3, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 182
    .line 183
    .line 184
    iput-object v2, p0, Ll/tvz;->e1:Ll/jxd0;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/clz;->e4()Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-nez v2, :cond_4

    .line 191
    .line 192
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-eqz v2, :cond_4

    .line 197
    .line 198
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-nez v2, :cond_4

    .line 203
    .line 204
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-nez v2, :cond_4

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-nez v2, :cond_4

    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    if-nez v2, :cond_4

    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_4

    .line 227
    .line 228
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_4

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-nez v0, :cond_4

    .line 239
    .line 240
    iget-object v0, p0, Ll/tvz;->e1:Ll/jxd0;

    .line 241
    .line 242
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Ljava/lang/Boolean;

    .line 247
    .line 248
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-nez v0, :cond_4

    .line 253
    .line 254
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v1, Ll/hvz;

    .line 263
    .line 264
    invoke-direct {v1, p0}, Ll/hvz;-><init>(Ll/tvz;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    new-instance v1, Ll/svz;

    .line 272
    .line 273
    invoke-direct {v1}, Ll/svz;-><init>()V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const/4 v1, 0x1

    .line 281
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    new-instance v1, Ll/wlz;

    .line 290
    .line 291
    invoke-direct {v1, p0}, Ll/wlz;-><init>(Ll/tvz;)V

    .line 292
    .line 293
    .line 294
    new-instance p0, Ll/hmz;

    .line 295
    .line 296
    invoke-direct {p0}, Ll/hmz;-><init>()V

    .line 297
    .line 298
    .line 299
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 304
    .line 305
    .line 306
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic Ae(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/ibc0;->C0:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "\u529f\u80fd\u5168\u65b0\u5347\u7ea7"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "\u672c\u6b21\u804a\u5929\u9700\u8981\u6d88\u8017\u4e00\u6b21\u95ea\u804a\u6b21\u6570"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p1, v0}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, v0}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "\u540c\u610f\u5e76\u804a\u5929"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "\u4e0d\u540c\u610f"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/vqz;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1}, Ll/vqz;-><init>(Ll/tvz;Ll/jl80;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/wqz;

    .line 61
    .line 62
    invoke-direct {p0, p1}, Ll/wqz;-><init>(Ll/jl80;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p0}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic Af(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/yxz;

    .line 10
    .line 11
    iget-object v0, v0, Ll/yxz;->Q1:Ll/q800;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/yxz;

    .line 22
    .line 23
    iget-object p0, p0, Ll/yxz;->Q1:Ll/q800;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/q800;->t(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final Ag(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ll/vel0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ll/vel0;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-wide v1, v0, Ll/vel0;->b:J

    .line 15
    .line 16
    const-wide/32 v3, 0xea60

    .line 17
    .line 18
    .line 19
    cmp-long p1, v1, v3

    .line 20
    .line 21
    if-lez p1, :cond_0

    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->T4:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 39
    .line 40
    new-instance v1, Lcom/p1/mobile/putong/data/Video;

    .line 41
    .line 42
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object v0, v0, Ll/vel0;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, "raw"

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    const-string v0, "real_shot"

    .line 67
    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 73
    .line 74
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/clz;->S5(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 81
    .line 82
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final Bc()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Lf(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tvz;->k1:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Ll/h39;->I()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/tvz;->s3(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/itz;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/itz;-><init>(Ll/tvz;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/jtz;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/jtz;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public final Bd()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "local_visitor_hide_footprint"

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2, v3}, Ll/enb;->H3(Ljava/lang/String;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    new-instance v3, Ll/xlz;

    .line 66
    .line 67
    invoke-direct {v3}, Ll/xlz;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/ylz;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/ylz;-><init>(Ll/tvz;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/zlz;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/zlz;-><init>(Ll/tvz;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final synthetic Be(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p1, Ll/yxz;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/qzz;->H0()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p0, Ll/yxz;

    .line 55
    .line 56
    const-string p1, "\u540e\u6d88\u5931\uff0c\u5feb\u53bb\u6253\u4e2a\u62db\u547c\u5427"

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public final synthetic Bf()Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Pp()Lrx/c;

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
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final Bg()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/tvz;->Eg()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/kr5;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-direct {v1, v2, v0}, Ll/kr5;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/tvz;->U0:Ll/kr5;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/kr5;->t()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v1, Ll/edc0;->Z:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Landroid/widget/FrameLayout;

    .line 69
    .line 70
    iget-object v1, p0, Ll/tvz;->U0:Ll/kr5;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1, v0, v2}, Ll/kr5;->j(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/User;)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    iget-boolean v0, p0, Ll/tvz;->W0:Z

    .line 86
    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    iget-object v0, p0, Ll/tvz;->U0:Ll/kr5;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, v1}, Ll/kr5;->s(Z)V

    .line 93
    .line 94
    .line 95
    const/4 v0, 0x1

    .line 96
    iput-boolean v0, p0, Ll/tvz;->W0:Z

    .line 97
    .line 98
    :cond_1
    :goto_0
    return-void
.end method

.method public final Cc()V
    .locals 2

    .line 1
    new-instance v0, Ll/mnz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mnz;-><init>(Ll/tvz;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/nnz;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/nnz;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final Cd()V
    .locals 1

    .line 1
    invoke-static {}, Ll/rum0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/yxz;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Ll/yxz;->W3(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic Ce(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p1, Ll/yxz;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/qzz;->H0()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    if-nez p1, :cond_0

    .line 59
    .line 60
    check-cast v0, Ll/yxz;

    .line 61
    .line 62
    const-string p1, "\u5185\u53ef\u4ee5\u56de\u5e94\u4ed6\uff0c\u5373\u53ef\u89e3\u9664\u9650\u65f6"

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    check-cast v0, Ll/yxz;

    .line 69
    .line 70
    const-string p1, "\u5185\u53d1\u9001\u6d88\u606f\u5373\u53ef\u89e3\u9501\u9650\u65f6"

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p1, p0}, Ll/f49;->f4(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public final synthetic Cf(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/mzl;->F()Ll/ruy;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/ruy;->s0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Ll/u1z;->p2(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    if-ne p0, p1, :cond_0

    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->O5:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final Cg()V
    .locals 3

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
    invoke-interface {v0}, Ll/r97;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Ll/nqz;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/nqz;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Ll/pqz;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/pqz;-><init>(Ll/tvz;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/qqz;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/qqz;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/rqz;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/rqz;-><init>(Ll/tvz;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/sqz;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/sqz;-><init>(Ll/tvz;)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Ll/tqz;

    .line 109
    .line 110
    invoke-direct {p0}, Ll/tqz;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    :cond_1
    :goto_0
    return-void
.end method

.method public final Dc()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/joa;->y4()Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final Dd()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tvz;->wg()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/xzm0;->i()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/tvz;->M0:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance v2, Ll/etz;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/etz;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/ptz;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/ptz;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/auz;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/auz;-><init>(Ll/tvz;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/xzm0;->A()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/luz;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/luz;-><init>(Ll/tvz;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/wuz;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/wuz;-><init>(Ll/tvz;)V

    .line 102
    .line 103
    .line 104
    const-wide/16 v2, 0x2bc

    .line 105
    .line 106
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 107
    .line 108
    .line 109
    :cond_0
    return-void
.end method

.method public final synthetic De(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p2, Ll/yxz;

    .line 48
    .line 49
    invoke-virtual {p2}, Ll/qzz;->H0()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p0, Ll/yxz;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    const-string p1, "\u5979"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-string p1, "\u4ed6"

    .line 72
    .line 73
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string p2, "\u672a\u548c%s\u53d1\u9001\u6d88\u606f\uff0c\u5c06\u89e3\u9664\u5339\u914d"

    .line 78
    .line 79
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public final synthetic Df(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ll/u1z;->p2(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->N5:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public Dg()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tvz;->N0:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final Ec()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Cf(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tvz;->k1:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/tvz;->vg()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 30
    .line 31
    const-string v1, "icebreak"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/fg7;->h3(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/spz;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/spz;-><init>(Ll/tvz;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/tsz;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/tsz;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic Ee(Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p1, Ll/yxz;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/qzz;->H0()V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p1, Ll/yxz;

    .line 55
    .line 56
    const-string v0, "\u5185\u5bf9\u65b9\u56de\u590d\u5373\u53ef\u5339\u914d"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Ll/f49;->f4(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public final synthetic Ef(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->l4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p1, p0}, Ll/r97;->N5(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-ne p1, p0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ll/r97;->z2()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final Eg()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tvz;->U0:Ll/kr5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kr5;->r()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/tvz;->U0:Ll/kr5;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final Fc()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/cmz;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/cmz;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/dmz;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/dmz;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/emz;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/emz;-><init>(Ll/tvz;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->n()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Ig(Ljava/lang/String;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    new-instance v4, Ll/fmz;

    .line 98
    .line 99
    invoke-direct {v4}, Ll/fmz;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {v1, v2, v3, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    new-instance v2, Ll/gmz;

    .line 111
    .line 112
    invoke-direct {v2}, Ll/gmz;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/imz;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/imz;-><init>(Ll/tvz;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/jmz;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/jmz;-><init>(Ll/tvz;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/tvz;->L0:Lrx/subjects/a;

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    new-instance v1, Ll/kmz;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Ll/kmz;-><init>(Ll/tvz;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 164
    .line 165
    .line 166
    :cond_0
    return-void
.end method

.method public final Fd()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->o0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "local_wechat_notify_guide"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/g;->wn()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v4, v4, Ll/dkb;->K1:Lrx/subjects/a;

    .line 68
    .line 69
    new-instance v5, Ll/nlz;

    .line 70
    .line 71
    invoke-direct {v5}, Ll/nlz;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1, v3, v4, v5}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/olz;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/olz;-><init>(Ll/tvz;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/plz;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/plz;-><init>(Ll/tvz;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/dj20;

    .line 112
    .line 113
    invoke-direct {v1}, Ll/dj20;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/qlz;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/qlz;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    new-instance v1, Ll/rlz;

    .line 134
    .line 135
    invoke-direct {v1}, Ll/rlz;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 143
    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    new-instance v2, Ll/slz;

    .line 159
    .line 160
    invoke-direct {v2}, Ll/slz;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/tlz;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/tlz;-><init>(Ll/tvz;)V

    .line 174
    .line 175
    .line 176
    new-instance p0, Ll/ulz;

    .line 177
    .line 178
    invoke-direct {p0}, Ll/ulz;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final synthetic Fe(ZLl/pf60;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p2, Ll/yxz;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/qzz;->w0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 25
    .line 26
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p2, p0, p1}, Ll/f49;->A3(Ljava/lang/String;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic Ff(Lcom/p1/mobile/android/app/c;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/yxz;

    .line 4
    .line 5
    iget-object p1, p1, Ll/yxz;->Q1:Ll/q800;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/yxz;

    .line 16
    .line 17
    iget-object p1, p1, Ll/yxz;->Q1:Ll/q800;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/q800;->v()Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p1, Ll/yxz;

    .line 32
    .line 33
    iget-object p1, p1, Ll/yxz;->Q1:Ll/q800;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/q800;->v()Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    const/4 v5, 0x0

    .line 71
    const-string v2, "p_messages,knowbetter"

    .line 72
    .line 73
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 74
    .line 75
    .line 76
    const-string p0, "e_know_him_better_guide"

    .line 77
    .line 78
    const-string p1, "p_messages_view"

    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public final Fg()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->mj()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ll/nvz;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/nvz;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public G6()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->G6()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "local_o_diamond_visitor_guide"

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Gc()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->O2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/n2;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->C()V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/vez;->x0()Lrx/subjects/a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/duz;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/duz;-><init>(Ll/tvz;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_0
    return-void
.end method

.method public Gd()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 36
    .line 37
    const-string v0, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 38
    .line 39
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    :cond_0
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public final synthetic Ge(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->nc()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Gf(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/enb;->G3(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final Gg(Ljava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_8

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/tvz;->m1:Z

    .line 16
    .line 17
    if-nez v0, :cond_8

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/tvz;->m1:Z

    .line 21
    .line 22
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Ll/o3z;->a:Ll/wyd0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_8

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const-string v3, "location"

    .line 65
    .line 66
    const-string v4, "video"

    .line 67
    .line 68
    const-string v5, "audio"

    .line 69
    .line 70
    const-string v6, "text"

    .line 71
    .line 72
    const-string v7, "voice_call_invitation"

    .line 73
    .line 74
    const-string v8, "picture"

    .line 75
    .line 76
    const-string v9, "tickle"

    .line 77
    .line 78
    const-string v10, "question"

    .line 79
    .line 80
    const/4 v11, -0x1

    .line 81
    sparse-switch v2, :sswitch_data_0

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :sswitch_0
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_0

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_0
    const/4 v11, 0x7

    .line 93
    goto :goto_1

    .line 94
    :sswitch_1
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    const/4 v11, 0x6

    .line 102
    goto :goto_1

    .line 103
    :sswitch_2
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    const/4 v11, 0x5

    .line 111
    goto :goto_1

    .line 112
    :sswitch_3
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_3
    const/4 v11, 0x4

    .line 120
    goto :goto_1

    .line 121
    :sswitch_4
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_4
    const/4 v11, 0x3

    .line 129
    goto :goto_1

    .line 130
    :sswitch_5
    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_5

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    const/4 v11, 0x2

    .line 138
    goto :goto_1

    .line 139
    :sswitch_6
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_6

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    move v11, v0

    .line 147
    goto :goto_1

    .line 148
    :sswitch_7
    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-nez v1, :cond_7

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_7
    const/4 v11, 0x0

    .line 156
    :goto_1
    packed-switch v11, :pswitch_data_0

    .line 157
    .line 158
    .line 159
    const-string v3, ""

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :pswitch_0
    move-object v3, v4

    .line 163
    goto :goto_2

    .line 164
    :pswitch_1
    move-object v3, v5

    .line 165
    goto :goto_2

    .line 166
    :pswitch_2
    move-object v3, v6

    .line 167
    goto :goto_2

    .line 168
    :pswitch_3
    move-object v3, v7

    .line 169
    goto :goto_2

    .line 170
    :pswitch_4
    move-object v3, v8

    .line 171
    goto :goto_2

    .line 172
    :pswitch_5
    move-object v3, v9

    .line 173
    goto :goto_2

    .line 174
    :pswitch_6
    move-object v3, v10

    .line 175
    :goto_2
    :pswitch_7
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string v2, "other_user_id"

    .line 180
    .line 181
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    const-string v4, "message_type"

    .line 190
    .line 191
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    const-string v3, "e_secret_message"

    .line 200
    .line 201
    invoke-static {v3, v1, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 202
    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_8
    return-void

    .line 207
    :sswitch_data_0
    .sparse-switch
        -0x457dc41a -> :sswitch_7
        -0x3417942a -> :sswitch_6
        -0x226fa302 -> :sswitch_5
        -0x1fa6a0f3 -> :sswitch_4
        0x36452d -> :sswitch_3
        0x58d9bd6 -> :sswitch_2
        0x6b0147b -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
    .end sparse-switch

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method

.method public H6()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->H6()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "local_platinum_pin_guide"

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Hc()V
    .locals 6

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
    invoke-interface {v0}, Ll/r97;->U3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_1
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/npz;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/npz;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/opz;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/opz;-><init>(Ll/tvz;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/ppz;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/ppz;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/qpz;

    .line 110
    .line 111
    invoke-direct {v1}, Ll/qpz;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/tpz;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/tpz;-><init>(Ll/tvz;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 145
    .line 146
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/upz;

    .line 157
    .line 158
    invoke-direct {v1}, Ll/upz;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 168
    .line 169
    iget-object v2, p0, Ll/clz;->b:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 176
    .line 177
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 178
    .line 179
    iget-object v3, p0, Ll/clz;->b:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 186
    .line 187
    iget-object v3, v3, Ll/il8;->c:Ll/t600;

    .line 188
    .line 189
    iget-object v4, p0, Ll/clz;->b:Ljava/lang/String;

    .line 190
    .line 191
    const-string v5, "chat_gift"

    .line 192
    .line 193
    invoke-virtual {v3, v4, v5}, Ll/t600;->r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3}, Ll/wzh0$a;->m()Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    new-instance v4, Ll/vpz;

    .line 202
    .line 203
    invoke-direct {v4}, Ll/vpz;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-static {v0, v1, v2, v3, v4}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    new-instance v1, Ll/wpz;

    .line 223
    .line 224
    invoke-direct {v1, p0}, Ll/wpz;-><init>(Ll/tvz;)V

    .line 225
    .line 226
    .line 227
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v0}, Ll/vez;->x0()Lrx/subjects/a;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    new-instance v1, Ll/xpz;

    .line 251
    .line 252
    invoke-direct {v1, p0}, Ll/xpz;-><init>(Ll/tvz;)V

    .line 253
    .line 254
    .line 255
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 260
    .line 261
    .line 262
    :cond_2
    :goto_0
    return-void
.end method

.method public final Hd()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final synthetic He(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/yxz;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/qzz;->w0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    new-instance p1, Ll/th0$a;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "\u5bf9\u65b9\u5df2\u79bb\u5f00\uff0c\u662f\u5426\u8981\u5220\u9664\u914d\u5bf9\uff1f"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "\u662f"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/mrz;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/mrz;-><init>(Ll/tvz;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "\u5426"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final synthetic Hf(Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/yxz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/qzz;->t1:Ll/rdz;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/yxz;

    .line 24
    .line 25
    iget-object p0, p0, Ll/qzz;->t1:Ll/rdz;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/rdz;->d()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 44
    .line 45
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "%s\n%s"

    .line 50
    .line 51
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCount:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTime:Ljava/lang/String;

    .line 58
    .line 59
    filled-new-array {v2, p1}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v2, "#4c000000"

    .line 68
    .line 69
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const-string v3, "sans-serif"

    .line 74
    .line 75
    invoke-static {v3, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v1, p1, v2, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method

.method public final Hg()Z
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->o0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->opened:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 22
    .line 23
    if-eq v0, v2, :cond_6

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jvp0;->g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_4

    .line 38
    .line 39
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    iget-object v0, v0, Ll/dkb;->K1:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v2, 0x1

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    iget-object v0, v0, Ll/dkb;->K1:Lrx/subjects/a;

    .line 57
    .line 58
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/google/common/base/Optional;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    iget-object v0, v0, Ll/dkb;->K1:Lrx/subjects/a;

    .line 75
    .line 76
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/google/common/base/Optional;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->wechatLaunch:Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    move v0, v2

    .line 93
    goto :goto_0

    .line 94
    :cond_2
    move v0, v1

    .line 95
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-interface {v3}, Ll/r97;->X3()Lcom/p1/mobile/putong/core/data/WechatNotifyConfig;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    sget-object v4, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->wechatNotifyGuideShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 108
    .line 109
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v4, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-lez p0, :cond_3

    .line 116
    .line 117
    move p0, v2

    .line 118
    goto :goto_1

    .line 119
    :cond_3
    move p0, v1

    .line 120
    :goto_1
    if-eqz v3, :cond_4

    .line 121
    .line 122
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 125
    .line 126
    iget-object v4, v4, Ll/dkb;->n5:Ll/byd0;

    .line 127
    .line 128
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    check-cast v4, Ljava/lang/Long;

    .line 133
    .line 134
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 135
    .line 136
    .line 137
    move-result-wide v4

    .line 138
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    if-eqz v4, :cond_4

    .line 143
    .line 144
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 147
    .line 148
    iget-object v4, v4, Ll/dkb;->p5:Ll/vxd0;

    .line 149
    .line 150
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    check-cast v4, Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    iget v5, v3, Lcom/p1/mobile/putong/core/data/WechatNotifyConfig;->message_daily_count:I

    .line 161
    .line 162
    if-lt v4, v5, :cond_4

    .line 163
    .line 164
    move v4, v2

    .line 165
    goto :goto_2

    .line 166
    :cond_4
    move v4, v1

    .line 167
    :goto_2
    if-eqz v3, :cond_5

    .line 168
    .line 169
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 170
    .line 171
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 172
    .line 173
    iget-object v5, v5, Ll/dkb;->o5:Ll/vxd0;

    .line 174
    .line 175
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, Ljava/lang/Integer;

    .line 180
    .line 181
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    iget v3, v3, Lcom/p1/mobile/putong/core/data/WechatNotifyConfig;->message_total_count:I

    .line 186
    .line 187
    if-lt v5, v3, :cond_5

    .line 188
    .line 189
    move v3, v2

    .line 190
    goto :goto_3

    .line 191
    :cond_5
    move v3, v1

    .line 192
    :goto_3
    if-eqz v0, :cond_6

    .line 193
    .line 194
    if-nez p0, :cond_6

    .line 195
    .line 196
    if-nez v4, :cond_6

    .line 197
    .line 198
    if-nez v3, :cond_6

    .line 199
    .line 200
    return v2

    .line 201
    :cond_6
    :goto_4
    return v1
.end method

.method public I2(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/clz;->H:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/clz;->H:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/isz;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/isz;-><init>(Ll/tvz;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public I6()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->I6()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "local_visitor_hide_footprint"

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Ic()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->kb()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/clz;->b4()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/k05;->i()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/lmz;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/lmz;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/mmz;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/mmz;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/nmz;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/nmz;-><init>(Ll/tvz;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->We(Ljava/lang/String;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/omz;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/omz;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const/4 v1, 0x1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/pmz;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/pmz;-><init>(Ll/tvz;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final Id()I
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "ai_chat_advice_guide"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x3

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "keyboardHangThreshold"

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    return p0

    .line 33
    :catch_0
    :cond_1
    return v1
.end method

.method public final synthetic Ie(Ll/pf60;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/yqz;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/yqz;-><init>(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    new-instance p1, Ll/arz;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/arz;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v0, " ,"

    .line 24
    .line 25
    invoke-static {p0, p1, v0}, Ll/jyb;->o0(Ljava/util/Collection;Ll/qcj;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/brz;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/brz;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/crz;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/crz;-><init>(Ljava/util/ArrayList;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public final synthetic If(Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "local_o_diamond_visitor_guide"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCount:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTime:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance v0, Ll/esz;

    .line 46
    .line 47
    invoke-direct {v0, p0, p1}, Ll/esz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public final Ig()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "guide_type_answer"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ug(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ll/cv6;->r3(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final Jc()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/r97;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/td;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/td;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/qu20;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/qu20;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/cuz;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/cuz;-><init>(Ll/tvz;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final synthetic Jd(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object p0, p0, Ll/tvz;->b1:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 22
    .line 23
    const-string v0, "default"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_0

    .line 62
    .line 63
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_0

    .line 72
    .line 73
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_0

    .line 82
    .line 83
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_0

    .line 92
    .line 93
    const/4 p0, 0x1

    .line 94
    goto :goto_0

    .line 95
    :cond_0
    const/4 p0, 0x0

    .line 96
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method public final synthetic Je(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic Jf()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yxz;->o5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final Jg()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/cv6;->v3(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/rsz;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/rsz;-><init>(Ll/tvz;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/ssz;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/ssz;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public K6(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tvz;->J0:Ll/n4z;

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
    iget-object p0, p0, Ll/tvz;->J0:Ll/n4z;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/n4z;->D0(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final Kc()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Bg()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/tvz;->V0:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/tvz;->V0:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/ltz;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/ltz;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/mtz;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/mtz;-><init>(Ll/tvz;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/ntz;

    .line 30
    .line 31
    invoke-direct {v3}, Ll/ntz;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/joa;->y3()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/otz;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/otz;-><init>(Ll/tvz;)V

    .line 60
    .line 61
    .line 62
    new-instance v3, Ll/qtz;

    .line 63
    .line 64
    invoke-direct {v3}, Ll/qtz;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/clz;->T2()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/rtz;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/rtz;-><init>(Ll/tvz;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/stz;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/stz;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    :cond_0
    return-void
.end method

.method public final synthetic Kd()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yxz;->Z3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/clz;->G:Ll/zqe0;

    .line 12
    .line 13
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/zqe0;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic Ke(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    iget-wide v0, p1, Ll/mk8;->m0:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p1, Ll/mk8;->l0:I

    .line 19
    .line 20
    iget-object p1, p1, Ll/mk8;->k0:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 28
    .line 29
    iget-object p1, p1, Ll/mk8;->k0:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 44
    .line 45
    iget-object p1, p1, Ll/mk8;->k0:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 57
    .line 58
    iget p1, p0, Ll/mk8;->l0:I

    .line 59
    .line 60
    add-int/lit8 p1, p1, 0x1

    .line 61
    .line 62
    iput p1, p0, Ll/mk8;->l0:I

    .line 63
    .line 64
    invoke-static {}, Ll/pzi0;->o()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    iput-wide v0, p0, Ll/mk8;->m0:J

    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public final synthetic Kf(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/eqz;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/eqz;-><init>(Ll/tvz;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0x258

    .line 15
    .line 16
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Kg()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/tvz;->Z0:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, "hello\uff0c\u5728\u5e72\u561b\u5462\uff1f"

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const-string v1, "hi \uff0c\u5728\u5e72\u561b\u5462\uff1f"

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, ""

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3, v0}, Ll/dkb;->j7(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/nsz;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/nsz;-><init>(Ll/tvz;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/osz;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/osz;-><init>(Ll/tvz;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final Lc()V
    .locals 2

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Oa(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/ttz;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/ttz;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/utz;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/utz;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic Ld(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Le(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nvm;->n()Ll/nvm;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, v0, v1, p0}, Ll/nvm;->k(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic Lf(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qzz;->t1:Ll/rdz;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/rdz;->k()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final Lg(Z)V
    .locals 4

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
    invoke-interface {v0}, Ll/r97;->P0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    new-instance v3, Ll/grz;

    .line 30
    .line 31
    invoke-direct {v3, p0, p1}, Ll/grz;-><init>(Ll/tvz;Z)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/hrz;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ll/hrz;-><init>(Ll/tvz;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0, v1, v2, v3, p1}, Ll/r97;->e5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    new-instance v0, Ll/irz;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/irz;-><init>(Ll/tvz;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Ll/tvz;->ic(ZLl/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public M2(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/clz;->M2(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/tvz;->i1:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Ll/hqz;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/hqz;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, 0x12c

    .line 14
    .line 15
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic Md(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Me(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    const-string p1, "test"

    .line 6
    .line 7
    const-string v0, "\u4ed6\u8fd1\u671f\u767c\u4f48\u904e\u7591\u4f3c\u5ee3\u544a\u4fe1\u606f\uff0c\u804a\u5929\u8acb\u8b39\u614e"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/yxz;->j5(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Mf(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/tvz;->qc(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Mg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 3

    .line 1
    const-string v0, "warming up start"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/tvz;->P0:Z

    .line 8
    .line 9
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->pre()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_1
    invoke-virtual {p0, v0}, Ll/clz;->Z6(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 31
    .line 32
    .line 33
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2}, Ll/clz;->a7(D)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, v0}, Ll/tvz;->Ed(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/gqz;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/gqz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 48
    .line 49
    .line 50
    const-wide/16 p0, 0x12c

    .line 51
    .line 52
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Ll/tvz;->P0:Z

    .line 58
    .line 59
    return-void
.end method

.method public final Nc()V
    .locals 6

    .line 1
    invoke-static {}, Ll/h39;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/umz;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/umz;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/vmz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/vmz;-><init>(Ll/tvz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/tvz;->s3(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/qu20;

    .line 34
    .line 35
    invoke-direct {v2}, Ll/qu20;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/wmz;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/wmz;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/xmz;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/xmz;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/ymz;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/ymz;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    new-array v0, v0, [Ll/jl80;

    .line 86
    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 102
    .line 103
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 118
    .line 119
    invoke-virtual {v4}, Ll/dkb;->o9()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    new-instance v5, Ll/zmz;

    .line 128
    .line 129
    invoke-direct {v5}, Ll/zmz;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-static {v1, v2, v3, v4, v5}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    new-instance v2, Ll/anz;

    .line 141
    .line 142
    invoke-direct {v2, p0, v0}, Ll/anz;-><init>(Ll/tvz;[Ll/jl80;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final synthetic Nd()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveLabel;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 11
    .line 12
    const-string v1, "\u8fdb\u5165\u76f4\u64ad\u95f4"

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    const-string v1, "\u5979\u6b63\u5728\u89c6\u9891\u76f4\u64ad"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string v1, "\u4ed6\u6b63\u5728\u89c6\u9891\u76f4\u64ad"

    .line 46
    .line 47
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 50
    .line 51
    const-string v1, "\u591a\u4eba\u8fde\u7ebf\u5df2\u5f00\u542f\uff0c\u7b49\u4f60\u52a0\u5165"

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/yxz;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/qzz;->g2()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 65
    .line 66
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast p0, Ll/yxz;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/qzz;->g2()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic Ne(Lcom/p1/mobile/putong/core/data/CoreData;)V
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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->text:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/yxz;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RiskOtherData;->type:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RiskOtherData;->text:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1}, Ll/yxz;->j5(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic Nf(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 2
    .line 3
    iget p0, p0, Ll/tvz;->d1:I

    .line 4
    .line 5
    if-lt p1, p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->un()Z

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
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final Ng(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tempDownAnim = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeat;->toJson()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/fsz;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1}, Ll/fsz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final Oc()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clz;->G:Ll/zqe0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/amz;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/amz;-><init>(Ll/tvz;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/bmz;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/bmz;-><init>(Ll/tvz;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic Od()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/yxz;->p5(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic Oe(Ll/bkj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->hh(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Of(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->un()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/tvz;->e1:Ll/jxd0;

    .line 19
    .line 20
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 28
    .line 29
    iget-object v0, v0, Ll/icb;->V:Ll/byd0;

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 45
    .line 46
    iget-object v0, v0, Ll/icb;->W:Ll/vxd0;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 55
    .line 56
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->nh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method

.method public final Og(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tempUpAnim start fromLevel = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " nextLevel = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " chatHeat = "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/ChatHeat;->toJson()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 41
    .line 42
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/cn7;->A3(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/csz;

    .line 58
    .line 59
    invoke-direct {v1, p0, p3, p1, p2}, Ll/csz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ll/dsz;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Ll/dsz;-><init>(Ll/tvz;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final Pc()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->k5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Na(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/euz;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/euz;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/fuz;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/fuz;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic Pd()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 4
    .line 5
    iget-object v0, v0, Ll/xab;->S:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/yxz;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yxz;->r5()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic Pe(Ll/bkj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->hh(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Pf(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0}, Ll/xg0;->e(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    invoke-static {p0}, Ll/xg0;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final Pg()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ll/r97;->h()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v0, p0}, Ll/r97;->I3(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public Q2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/clz;->Q2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final Qc()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "local_heart_beat_lock_tip"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/h39;->O()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Ll/jxd0;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "heart_beat_lock_message_showed_"

    .line 24
    .line 25
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, "/"

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-direct {v0, v1, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_1

    .line 83
    .line 84
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartBeatLock()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_1

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_1

    .line 103
    .line 104
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 112
    .line 113
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const-string v2, "\u672c\u6b21\u804a\u5929\u9700\u8981\u6d88\u80171\u6b21\u5fc3\u52a8\u6b21\u6570"

    .line 120
    .line 121
    const/4 v3, 0x0

    .line 122
    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->bh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ljava/lang/String;Ll/y20;)Lrx/c;

    .line 123
    .line 124
    .line 125
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic Qd()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->hh(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Qe(Ljava/lang/Integer;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0x64

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Ll/yxz;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/qzz;->d2()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Ll/yxz;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/qzz;->B1()V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 50
    .line 51
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 52
    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J1:Lcom/p1/mobile/putong/core/api/r;

    .line 58
    .line 59
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/r;->g5(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public final synthetic Qf(Ll/bkj0;)V
    .locals 11

    .line 1
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/google/common/base/Optional;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Visitor;

    .line 17
    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/data/Visitor;->visitCount:I

    .line 19
    .line 20
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Visitor;->hidden:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p1, v1

    .line 24
    move v0, p1

    .line 25
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Hs()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Se()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Fj()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    const/4 v5, 0x1

    .line 62
    if-lt v0, v4, :cond_1

    .line 63
    .line 64
    move v4, v5

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move v4, v1

    .line 67
    :goto_1
    sget-object v6, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintLastCloseMills:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 68
    .line 69
    iget-object v7, p0, Ll/clz;->c:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    int-to-long v7, v7

    .line 76
    const-wide/16 v9, 0x3e8

    .line 77
    .line 78
    mul-long/2addr v7, v9

    .line 79
    invoke-static {v7, v8}, Ll/pzi0;->D(J)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-eqz v7, :cond_2

    .line 84
    .line 85
    sget-object v7, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 86
    .line 87
    iget-object v8, p0, Ll/clz;->c:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-lt v7, v3, :cond_2

    .line 94
    .line 95
    move v3, v5

    .line 96
    goto :goto_2

    .line 97
    :cond_2
    move v3, v1

    .line 98
    :goto_2
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 101
    .line 102
    iget-object v7, v7, Ll/enb;->a0:Ll/byd0;

    .line 103
    .line 104
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    check-cast v7, Ljava/lang/Long;

    .line 109
    .line 110
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 111
    .line 112
    .line 113
    move-result-wide v7

    .line 114
    invoke-static {v7, v8}, Ll/pzi0;->D(J)Z

    .line 115
    .line 116
    .line 117
    move-result v7

    .line 118
    if-eqz v7, :cond_3

    .line 119
    .line 120
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 123
    .line 124
    iget-object v7, v7, Ll/enb;->b0:Ll/vxd0;

    .line 125
    .line 126
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    check-cast v7, Ljava/lang/Integer;

    .line 131
    .line 132
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    if-lt v7, v2, :cond_3

    .line 137
    .line 138
    move v1, v5

    .line 139
    :cond_3
    invoke-static {}, Ll/joa;->G3()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_6

    .line 144
    .line 145
    if-nez p1, :cond_6

    .line 146
    .line 147
    if-eqz v4, :cond_6

    .line 148
    .line 149
    if-nez v1, :cond_6

    .line 150
    .line 151
    if-nez v3, :cond_6

    .line 152
    .line 153
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 156
    .line 157
    iget-object v2, p0, Ll/clz;->c:Ljava/lang/String;

    .line 158
    .line 159
    const-string v3, "local_visitor_hide_footprint"

    .line 160
    .line 161
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    new-instance v7, Ll/nrz;

    .line 166
    .line 167
    invoke-direct {v7, v0, p1}, Ll/nrz;-><init>(IZ)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v2, v4, v3, v7}, Lcom/p1/mobile/putong/core/api/g;->bh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ljava/lang/String;Ll/y20;)Lrx/c;

    .line 171
    .line 172
    .line 173
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 176
    .line 177
    iget-object p1, p1, Ll/enb;->a0:Ll/byd0;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p1, Ljava/lang/Long;

    .line 184
    .line 185
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 186
    .line 187
    .line 188
    move-result-wide v0

    .line 189
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_4

    .line 194
    .line 195
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 198
    .line 199
    iget-object p1, p1, Ll/enb;->b0:Ll/vxd0;

    .line 200
    .line 201
    invoke-virtual {p1, v5}, Ll/vxd0;->a(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 208
    .line 209
    iget-object p1, p1, Ll/enb;->b0:Ll/vxd0;

    .line 210
    .line 211
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 221
    .line 222
    iget-object p1, p1, Ll/enb;->a0:Ll/byd0;

    .line 223
    .line 224
    invoke-static {}, Ll/pzi0;->o()J

    .line 225
    .line 226
    .line 227
    move-result-wide v0

    .line 228
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {v6, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    int-to-long v0, p1

    .line 244
    mul-long/2addr v0, v9

    .line 245
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-nez p1, :cond_5

    .line 250
    .line 251
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 252
    .line 253
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {p1, v0, v5}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 258
    .line 259
    .line 260
    goto :goto_4

    .line 261
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 262
    .line 263
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    :goto_4
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-static {}, Ll/pzi0;->o()J

    .line 275
    .line 276
    .line 277
    move-result-wide v0

    .line 278
    div-long/2addr v0, v9

    .line 279
    long-to-int p1, v0

    .line 280
    invoke-virtual {v6, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 281
    .line 282
    .line 283
    :cond_6
    return-void
.end method

.method public final Qg(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 19
    .line 20
    const-string v2, "sticker"

    .line 21
    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p2, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v3, 0x2

    .line 39
    if-lt v1, v3, :cond_0

    .line 40
    .line 41
    iget-object v1, p2, Ll/vg60;->a:Ljava/util/List;

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    move-object v0, p2

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 70
    .line 71
    :cond_0
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-eqz p2, :cond_3

    .line 82
    .line 83
    iget-object p2, p0, Ll/tvz;->T0:Ll/n100;

    .line 84
    .line 85
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, v1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-nez p2, :cond_3

    .line 92
    .line 93
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-nez p2, :cond_1

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-gez p1, :cond_1

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_2

    .line 116
    .line 117
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_3

    .line 122
    .line 123
    iget-object p1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 124
    .line 125
    const-string p2, "fake_id_"

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_3

    .line 132
    .line 133
    invoke-static {}, Ll/pzi0;->o()J

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    long-to-double p1, p1

    .line 138
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 139
    .line 140
    sub-double/2addr p1, v1

    .line 141
    const-wide v1, 0x40af400000000000L    # 4000.0

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    cmpg-double p1, p1, v1

    .line 147
    .line 148
    if-gez p1, :cond_3

    .line 149
    .line 150
    :cond_2
    iget-object p1, p0, Ll/tvz;->T0:Ll/n100;

    .line 151
    .line 152
    iget-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Ll/n100;->b(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 160
    .line 161
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_3

    .line 172
    .line 173
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 174
    .line 175
    const-string v1, "poke"

    .line 176
    .line 177
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    if-eqz p2, :cond_3

    .line 182
    .line 183
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->o(Lcom/p1/mobile/putong/core/data/Sticker;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-nez v1, :cond_3

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    check-cast p0, Ll/yxz;

    .line 198
    .line 199
    invoke-virtual {p0, v0, p2, p1}, Ll/yxz;->b5(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 200
    .line 201
    .line 202
    :cond_3
    return-void
.end method

.method public R2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

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
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 32
    .line 33
    invoke-static {v0}, Ll/o1j0;->n(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/clz;->R2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public final Rc()V
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartBeatLock()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "heartbeat_consume_type"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "quickchat"

    .line 64
    .line 65
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    iget-object v0, v0, Ll/dkb;->d3:Ll/wyd0;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ljava/lang/CharSequence;

    .line 82
    .line 83
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/jpz;

    .line 98
    .line 99
    invoke-direct {v1}, Ll/jpz;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/kpz;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/kpz;-><init>(Ll/tvz;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic Rd()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-double v1, v1

    .line 14
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Wg(Ljava/lang/String;D)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic Re(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/u1z;->o2()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/yxz;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/qzz;->z0()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/yxz;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/yxz;->R3()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic Rf(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/d3z;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/d3z;->u0()Ll/azy;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/azy;->d0()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {v0, v1}, Ll/azy;->I(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/xzm0;->m()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Ll/yxz;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-virtual {p0, p1}, Ll/yxz;->y5(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public Rg(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/tvz;->o1:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tvz;->oc()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/tvz;->o1:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/tvz;->Id()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-long v1, p0

    .line 25
    const-wide/16 v3, 0x3e8

    .line 26
    .line 27
    mul-long/2addr v1, v3

    .line 28
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public S2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/m600;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 36
    .line 37
    invoke-static {v0}, Ll/o1j0;->n(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    move-object v1, p1

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->K5:I

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->L5:I

    .line 70
    .line 71
    :goto_0
    invoke-static {v1}, Ll/o1j0;->h(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 76
    .line 77
    invoke-static {v1}, Ll/o1j0;->h(I)V

    .line 78
    .line 79
    .line 80
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_0

    .line 85
    .line 86
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 89
    .line 90
    .line 91
    move-result-wide v5

    .line 92
    sub-long v6, v5, v3

    .line 93
    .line 94
    const-string v3, "lift_match"

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    move-object v1, p1

    .line 98
    move-object v4, v0

    .line 99
    invoke-static/range {v1 .. v7}, Ll/m600;->g(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V

    .line 100
    .line 101
    .line 102
    :goto_2
    invoke-super {p0, v1, p2, p3}, Ll/clz;->S2(Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    return p0
.end method

.method public final synthetic Sd()V
    .locals 13

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Hs()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Se()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Fj()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintLastCloseMills:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 38
    .line 39
    iget-object v4, p0, Ll/clz;->c:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-long v3, v3

    .line 46
    const-wide/16 v5, 0x3e8

    .line 47
    .line 48
    mul-long/2addr v3, v5

    .line 49
    sget-object v5, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 50
    .line 51
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v5, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    int-to-long v5, p0

    .line 58
    invoke-static {v3, v4}, Ll/pzi0;->D(J)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    const-wide/16 v7, 0x0

    .line 63
    .line 64
    if-nez p0, :cond_0

    .line 65
    .line 66
    move-wide v5, v7

    .line 67
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 70
    .line 71
    iget-object p0, p0, Ll/enb;->a0:Ll/byd0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v9

    .line 83
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 86
    .line 87
    iget-object p0, p0, Ll/enb;->b0:Ll/vxd0;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    check-cast p0, Ljava/lang/Integer;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    int-to-long v11, p0

    .line 100
    invoke-static {v9, v10}, Ll/pzi0;->D(J)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    move-wide v7, v11

    .line 108
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v9, "\u6bcf\u5929\u6700\u591a\u5c55\u793a\u603b\u6b21\u6570\uff08\u53ef\u914d\u7f6e\uff09\uff1a"

    .line 111
    .line 112
    invoke-direct {p0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v0, "\n\u540c\u4e00\u4f1a\u8bdd\u6bcf\u5929\u6700\u591a\u5c55\u793a\u6b21\u6570\uff08\u53ef\u914d\u7f6e\uff09\uff1a"

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, "\n\u540c\u4e00\u4f1a\u8bdd\u6700\u5c11\u8bbf\u95ee\u6b21\u6570\uff08\u53ef\u914d\u7f6e\uff09\uff1a"

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v0, "\n\u5f53\u524d\u4f1a\u8bdd\u4e0a\u6b21\u8bbf\u95ee\u65f6\u95f4\uff1a"

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    sget-object v0, Ll/pzi0;->f:Ljava/text/SimpleDateFormat;

    .line 140
    .line 141
    new-instance v1, Ljava/util/Date;

    .line 142
    .line 143
    invoke-direct {v1, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v0, "\n\u5f53\u524d\u4f1a\u8bdd\u5df2\u7ecf\u8bbf\u95ee\u6b21\u6570\uff1a"

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v0, "\n\u6bcf\u5929\u5df2\u7ecf\u5c55\u793a\u8fc7\u7684\u603b\u6b21\u6570\uff1a"

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final synthetic Se(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/yxz;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yxz;->R3()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast p0, Ll/yxz;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qzz;->w0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic Sf(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/xzm0;->q()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/xzm0;->l()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Ll/yxz;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, v0, p1}, Ll/yxz;->e5(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final Sg(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v0, "exchange_picture"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->exchangeType:I

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->BACK_MESSAGE:I

    .line 32
    .line 33
    if-ne p1, v0, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->launchMessageId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->finished:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->launchMessageId:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->xq(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final Tc()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/e5b0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/yxz;

    .line 8
    .line 9
    invoke-direct {v1, v2, p0}, Ll/e5b0;-><init>(Ll/yxz;Ll/tvz;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ll/h5b0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v2, Ll/yxz;

    .line 22
    .line 23
    invoke-direct {v1, v2, p0}, Ll/h5b0;-><init>(Ll/yxz;Ll/tvz;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 30
    .line 31
    new-instance v1, Ll/q6f;

    .line 32
    .line 33
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v2, Ll/yxz;

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ll/q6f;-><init>(Ll/yxz;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 44
    .line 45
    new-instance v1, Ll/zri0;

    .line 46
    .line 47
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v2, Ll/yxz;

    .line 50
    .line 51
    invoke-direct {v1, v2, p0}, Ll/zri0;-><init>(Ll/yxz;Ll/tvz;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 58
    .line 59
    new-instance v1, Ll/sye;

    .line 60
    .line 61
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast v2, Ll/yxz;

    .line 64
    .line 65
    invoke-direct {v1, v2, p0}, Ll/sye;-><init>(Ll/yxz;Ll/tvz;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 72
    .line 73
    new-instance v1, Ll/oye;

    .line 74
    .line 75
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast v2, Ll/yxz;

    .line 78
    .line 79
    invoke-direct {v1, v2, p0}, Ll/oye;-><init>(Ll/yxz;Ll/tvz;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 86
    .line 87
    new-instance v1, Ll/o6c0;

    .line 88
    .line 89
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v2, Ll/yxz;

    .line 92
    .line 93
    invoke-direct {v1, v2, p0}, Ll/o6c0;-><init>(Ll/yxz;Ll/tvz;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic Td()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintLastCloseMills:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 12
    .line 13
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 21
    .line 22
    iget-object p0, p0, Ll/enb;->a0:Ll/byd0;

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 36
    .line 37
    iget-object p0, p0, Ll/enb;->b0:Ll/vxd0;

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    const-string p0, "\u5df2\u91cd\u7f6e"

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic Te(Ll/jl80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic Tf()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tvz;->M0:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Tg()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tvz;->d1:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic Ud(Ll/bkj0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 15
    .line 16
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 17
    .line 18
    if-nez v1, :cond_3

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "default"

    .line 23
    .line 24
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_3

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 31
    .line 32
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/clz;->a4(Lcom/p1/mobile/putong/data/User;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/clz;->a4(Lcom/p1/mobile/putong/data/User;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->w1:Ll/byd0;

    .line 77
    .line 78
    invoke-static {}, Ll/pzi0;->o()J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string v0, "local_friend_active_remind_female"

    .line 98
    .line 99
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic Ue(ZLl/jl80;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xqz;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/xqz;-><init>(Ll/tvz;Ll/jl80;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/tvz;->ic(ZLl/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Uf(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0}, Ll/xg0;->e(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    invoke-static {p0}, Ll/xg0;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public Ug()Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvz;->e1:Ll/jxd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public V2()Z
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    :cond_0
    return v1

    .line 41
    :cond_1
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    :cond_3
    return v1

    .line 90
    :cond_4
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    xor-int/lit8 p0, p0, 0x1

    .line 99
    .line 100
    return p0
.end method

.method public final Vc()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {}, Ll/wek0;->g()Ll/wek0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/wek0;->k(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/smz;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/smz;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/dnz;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/dnz;-><init>(Ll/tvz;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/onz;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/onz;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/znz;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/znz;-><init>(Ll/tvz;)V

    .line 84
    .line 85
    .line 86
    new-instance v2, Ll/koz;

    .line 87
    .line 88
    invoke-direct {v2}, Ll/koz;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->b0:Lrx/subjects/b;

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v0, Ll/voz;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/voz;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic Vd(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t0:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAITranslate;->o3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/TribeSetting;->transLang:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p1, ""

    .line 41
    .line 42
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    const-string p1, "e_intl_ai_translate_bubble"

    .line 55
    .line 56
    const-string v0, "p_chat_view"

    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast p0, Ll/yxz;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/qzz;->e2()V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t0:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAITranslate;->q3()V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public final synthetic Ve([ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 p3, 0x0

    .line 3
    aput-boolean p2, p1, p3

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ll/tvz;->Lg(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Vf(Ll/bkj0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Hg()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "local_wechat_notify_guide"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "wechat_notify_guide"

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->bh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ljava/lang/String;Ll/y20;)Lrx/c;

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/tvz;->n1:Z

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v0, v0, Ll/dkb;->n5:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/lang/Long;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    iget-object v0, v0, Ll/dkb;->p5:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ll/vxd0;->a(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object v0, v0, Ll/dkb;->p5:Ll/vxd0;

    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    iget-object v0, v0, Ll/dkb;->n5:Ll/byd0;

    .line 78
    .line 79
    invoke-static {}, Ll/pzi0;->o()J

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    iget-object v0, v0, Ll/dkb;->o5:Ll/vxd0;

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ll/vxd0;->a(I)V

    .line 97
    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->wechatNotifyGuideShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 100
    .line 101
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    const-string p1, "e_open_wechat_notification"

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_1
    return-void
.end method

.method public final synthetic Wd(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/tvz;->l1:Ljava/lang/Runnable;

    .line 10
    .line 11
    const-wide/16 v2, 0xa

    .line 12
    .line 13
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isLiveServiceAccount(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/tvz;->Cg()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/yxz;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/qzz;->g2()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    if-ne p1, v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/tvz;->l1:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 47
    .line 48
    if-eq p1, v0, :cond_2

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 51
    .line 52
    if-ne p1, v0, :cond_4

    .line 53
    .line 54
    :cond_2
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    const/4 p1, 0x1

    .line 76
    invoke-virtual {p0, p1}, Ll/clz;->s7(Z)V

    .line 77
    .line 78
    .line 79
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic We([Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-boolean p1, p1, v0

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic Wf(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "local_wechat_notify_guide"

    .line 24
    .line 25
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final Xc()V
    .locals 4

    .line 1
    invoke-static {}, Ll/h39;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 11
    .line 12
    iget-object v0, v0, Ll/yd9;->R:Ll/jxd0;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 23
    .line 24
    iget-object v0, v0, Ll/yd9;->R:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 39
    .line 40
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/kvz;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/kvz;-><init>(Ll/tvz;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "messageDetail"

    .line 70
    .line 71
    const-string v3, "user"

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2, v3}, Ll/yd9;->k3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/lvz;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/lvz;-><init>(Ll/tvz;)V

    .line 84
    .line 85
    .line 86
    new-instance p0, Ll/mvz;

    .line 87
    .line 88
    invoke-direct {p0}, Ll/mvz;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic Xd(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yxz;->c5(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Xe([ZLl/jl80;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    aput-boolean v1, p1, v0

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic Xf()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->C1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y2()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/clz;->i:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/o3z;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->stage:Lcom/p1/mobile/putong/core/data/ChatInterruptStage;

    .line 32
    .line 33
    const-string v0, "locked"

    .line 34
    .line 35
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public Yc()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

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
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/yxz;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/clz;->U2()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v1, Ll/lpz;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/lpz;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Ll/mpz;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/mpz;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic Yd(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/qzz;->U1()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/yxz;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/qzz;->M1()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/clz;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/tvz;->rc(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/yxz;

    .line 25
    .line 26
    iget-object p1, p1, Ll/qzz;->t1:Ll/rdz;

    .line 27
    .line 28
    invoke-interface {p1}, Ll/rdz;->j()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/yxz;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/yxz;->D0()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Ll/r97;->C0()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Ll/r97;->p2()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic Ye(Z[ZLl/jl80;)V
    .locals 1

    .line 1
    new-instance v0, Ll/yrz;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3}, Ll/yrz;-><init>(Ll/tvz;[ZLl/jl80;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/tvz;->ic(ZLl/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Yf(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isBlocked()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Ll/dkb;->Ba(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "autoSendMessage"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/tvz;->k1:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ll/xab;->f3(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Ll/tvz;->k1:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/tvz;->k1:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/clz;->N6(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    new-instance v0, Ll/n4z;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/n4z;-><init>(Ll/clz;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/tvz;->J0:Ll/n4z;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/ar2;->Z()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/tvz;->Tc()V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/h39;->J()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->ProloguesEnterChatCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public Z2()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/clz;->Z2()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/r97;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ll/moz;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/moz;-><init>(Ll/tvz;)V

    .line 20
    .line 21
    .line 22
    const-string v2, "zb\u76f4\u64ad\u72b6\u6001DEBUG"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance v1, Ll/noz;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/noz;-><init>(Ll/tvz;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "\u63a2\u63a2\u8ba4\u8bc1\u6c14\u6ce1"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1}, Ll/r97;->D()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    new-instance v1, Ll/ooz;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/ooz;-><init>(Ll/tvz;)V

    .line 60
    .line 61
    .line 62
    const-string v2, "\u62cd\u4e00\u62cd\u8499\u5c42\u5f15\u5bfc"

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/poz;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/poz;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v2, "\u529f\u80fd\u5f15\u5bfc\u201c\u62cd\u4e00\u62cd\u201d"

    .line 77
    .line 78
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_1
    new-instance v1, Ll/qoz;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/qoz;-><init>(Ll/tvz;)V

    .line 88
    .line 89
    .line 90
    const-string v2, "\u63d2\u5165\u8ba4\u8bc1\u5f15\u5bfc\u6d88\u606f"

    .line 91
    .line 92
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    new-instance v1, Ll/roz;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/roz;-><init>(Ll/tvz;)V

    .line 102
    .line 103
    .line 104
    const-string v2, "\u63d2\u5165\u76f2\u76d2\u5f15\u5bfc\u6d88\u606f"

    .line 105
    .line 106
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    new-instance v1, Ll/soz;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/soz;-><init>(Ll/tvz;)V

    .line 116
    .line 117
    .line 118
    const-string v2, "\u8bbf\u5ba2\'\u9690\u85cf\u8bbf\u95ee\u8db3\u8ff9\'\u7edf\u8ba1\u6b21\u6570"

    .line 119
    .line 120
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    new-instance v1, Ll/toz;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/toz;-><init>(Ll/tvz;)V

    .line 130
    .line 131
    .line 132
    const-string v2, "\u8bbf\u5ba2\'\u9690\u85cf\u8bbf\u95ee\u8db3\u8ff9\'\u91cd\u7f6e"

    .line 133
    .line 134
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    new-instance v1, Ll/tvz$c;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/tvz$c;-><init>(Ll/tvz;)V

    .line 144
    .line 145
    .line 146
    const-string v2, "\u63d2\u5165\u6e38\u620fCP\u6d88\u606f \u81ea\u5df1"

    .line 147
    .line 148
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    new-instance v1, Ll/tvz$d;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/tvz$d;-><init>(Ll/tvz;)V

    .line 158
    .line 159
    .line 160
    const-string p0, "\u63d2\u5165\u6e38\u620fCP\u6d88\u606f \u5bf9\u65b9"

    .line 161
    .line 162
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    return-object v0
.end method

.method public final Zc()V
    .locals 5

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "default"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->l()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "local_pic_cert_guide"

    .line 54
    .line 55
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v1, v2, v4}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/api/g;->iq(Ljava/lang/String;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    new-instance v4, Ll/pnz;

    .line 76
    .line 77
    invoke-direct {v4}, Ll/pnz;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1, v2, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/qnz;

    .line 89
    .line 90
    invoke-direct {v1}, Ll/qnz;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Ll/rnz;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/rnz;-><init>(Ll/tvz;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 142
    .line 143
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 144
    .line 145
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/g;->oo()Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    new-instance v3, Ll/snz;

    .line 150
    .line 151
    invoke-direct {v3}, Ll/snz;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Ll/tnz;

    .line 159
    .line 160
    invoke-direct {v1}, Ll/tnz;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/unz;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/unz;-><init>(Ll/tvz;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 181
    .line 182
    .line 183
    :cond_0
    return-void
.end method

.method public final synthetic Zd(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->co(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Vg(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic Ze(Z[ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p3, Ll/yxz;

    .line 4
    .line 5
    new-instance v0, Ll/drz;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, p2}, Ll/drz;-><init>(Ll/tvz;Z[Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3, v0}, Ll/yxz;->m5(Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Zf()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ll/r97;->s1(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/lqz;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/lqz;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/mqz;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/mqz;-><init>(Ll/tvz;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/tvz;->Kc()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tvz;->md()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/tvz;->hd()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/tvz;->fd()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/clz;->U3()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/tvz;->Cc()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/tvz;->nd()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tvz;->yc()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/tvz;->dd()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/tvz;->Cd()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/tvz;->sd()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/tvz;->yd()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/tvz;->ed()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/tvz;->rd()V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v0, v1}, Ll/r97;->F3(Lcom/p1/mobile/android/app/Act;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/tvz;->Pg()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/tvz;->J0:Ll/n4z;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/n4z;->a0()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/tvz;->Fc()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/tvz;->Oc()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/tvz;->Jc()V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    invoke-direct {p0}, Ll/tvz;->td()V

    .line 93
    .line 94
    .line 95
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/tvz;->Ac()V

    .line 110
    .line 111
    .line 112
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v0}, Ll/r97;->b5()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/tvz;->gd()V

    .line 127
    .line 128
    .line 129
    :cond_2
    invoke-virtual {p0}, Ll/tvz;->Dd()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/tvz;->mc()V

    .line 133
    .line 134
    .line 135
    invoke-direct {p0}, Ll/tvz;->Sc()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ll/tvz;->Pc()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/tvz;->Bc()V

    .line 142
    .line 143
    .line 144
    invoke-direct {p0}, Ll/tvz;->Uc()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ll/tvz;->zc()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/tvz;->ad()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/tvz;->xd()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ll/tvz;->Gc()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ll/tvz;->Hc()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/tvz;->bd()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/tvz;->Lc()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/tvz;->cd()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/tvz;->od()V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/tvz;->Rc()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ll/tvz;->Ic()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Ll/tvz;->id()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Ll/tvz;->wd()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ll/tvz;->Ec()V

    .line 187
    .line 188
    .line 189
    invoke-direct {p0}, Ll/tvz;->Mc()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Ll/tvz;->tc()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Ll/tvz;->Qc()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ll/tvz;->Zc()V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Ll/tvz;->Nc()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ll/tvz;->kd()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ll/tvz;->jd()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0}, Ll/tvz;->Yc()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ll/tvz;->Fg()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Ll/tvz;->Bd()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Ll/tvz;->Fd()V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0}, Ll/tvz;->Xc()V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ll/tvz;->Ad()V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0}, Ll/tvz;->Vc()V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ll/tvz;->ld()V

    .line 232
    .line 233
    .line 234
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-eqz v0, :cond_3

    .line 247
    .line 248
    invoke-static {}, Ll/joa;->M3()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-nez v0, :cond_3

    .line 253
    .line 254
    invoke-virtual {p0}, Ll/tvz;->ud()V

    .line 255
    .line 256
    .line 257
    :cond_3
    invoke-virtual {p0}, Ll/tvz;->qd()V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0}, Ll/tvz;->Dc()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0}, Ll/tvz;->wc()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ll/tvz;->xc()V

    .line 267
    .line 268
    .line 269
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_4

    .line 274
    .line 275
    invoke-direct {p0}, Ll/tvz;->Wc()V

    .line 276
    .line 277
    .line 278
    :cond_4
    return-void
.end method

.method public ad()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->v6(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->nl(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    if-eqz v6, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->xk()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 70
    .line 71
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 72
    .line 73
    iget-object v2, p0, Ll/clz;->c:Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->io(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 87
    .line 88
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v4, p0, Ll/clz;->b:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v5, p0, Ll/clz;->c:Ljava/lang/String;

    .line 103
    .line 104
    new-instance v8, Ll/gnz;

    .line 105
    .line 106
    invoke-direct {v8, p0}, Ll/gnz;-><init>(Ll/tvz;)V

    .line 107
    .line 108
    .line 109
    move-object v3, p0

    .line 110
    invoke-interface/range {v2 .. v8}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Zf(Ll/ner;Ljava/lang/String;Ljava/lang/String;ZZLl/a30;)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J1:Lcom/p1/mobile/putong/core/api/r;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/r;->u5()Lrx/subjects/b;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {v3, p0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance v0, Ll/hnz;

    .line 126
    .line 127
    invoke-direct {v0, v3}, Ll/hnz;-><init>(Ll/tvz;)V

    .line 128
    .line 129
    .line 130
    new-instance v1, Ll/inz;

    .line 131
    .line 132
    invoke-direct {v1}, Ll/inz;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    iget-object v0, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 151
    .line 152
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Pe(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-eqz p0, :cond_1

    .line 157
    .line 158
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 161
    .line 162
    iget-object v0, v3, Ll/clz;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {p0, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {v3, p0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    new-instance v0, Ll/jnz;

    .line 173
    .line 174
    invoke-direct {v0}, Ll/jnz;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    new-instance v0, Ll/knz;

    .line 182
    .line 183
    invoke-direct {v0, v3}, Ll/knz;-><init>(Ll/tvz;)V

    .line 184
    .line 185
    .line 186
    new-instance v1, Ll/lnz;

    .line 187
    .line 188
    invoke-direct {v1}, Ll/lnz;-><init>()V

    .line 189
    .line 190
    .line 191
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 196
    .line 197
    .line 198
    :cond_1
    iget-object p0, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 199
    .line 200
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-eqz p0, :cond_3

    .line 205
    .line 206
    iget-object p0, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 207
    .line 208
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 209
    .line 210
    if-eqz p0, :cond_2

    .line 211
    .line 212
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J1:Lcom/p1/mobile/putong/core/api/r;

    .line 215
    .line 216
    invoke-virtual {v3}, Ll/clz;->i3()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/r;->g5(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_2
    iget-object p0, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 224
    .line 225
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 226
    .line 227
    if-nez v0, :cond_3

    .line 228
    .line 229
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 230
    .line 231
    if-nez p0, :cond_3

    .line 232
    .line 233
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 234
    .line 235
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 236
    .line 237
    iget-object v0, v3, Ll/clz;->b:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_3

    .line 248
    .line 249
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J1:Lcom/p1/mobile/putong/core/api/r;

    .line 252
    .line 253
    invoke-virtual {v3}, Ll/clz;->i3()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    const/4 v3, 0x2

    .line 266
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 267
    .line 268
    invoke-interface {v2, v3, p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Ls(ILcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/r;->v5(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;

    .line 273
    .line 274
    .line 275
    :cond_3
    return-void
.end method

.method public final synthetic ae(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/toh0;->i(Landroid/content/Intent;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput-boolean p1, p0, Ll/tvz;->i1:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/iqz;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/iqz;-><init>(Ll/tvz;)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v1, 0xc8

    .line 25
    .line 26
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic af([ZLjava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-boolean p1, p1, p2

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic ag()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tvz;->oc()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Kf(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/tvz;->Ig()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public bridge synthetic b3(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tvz;->rc(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b6()Z
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
    invoke-interface {v0}, Ll/r97;->U3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 47
    .line 48
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 49
    .line 50
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 55
    .line 56
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->five:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 57
    .line 58
    iget v3, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 59
    .line 60
    if-lt v0, v3, :cond_1

    .line 61
    .line 62
    move v0, v2

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move v0, v1

    .line 65
    :goto_0
    if-nez v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_2

    .line 94
    .line 95
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 96
    .line 97
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 98
    .line 99
    int-to-double v3, p0

    .line 100
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->five:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 107
    .line 108
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 109
    .line 110
    if-lt p0, v0, :cond_2

    .line 111
    .line 112
    return v2

    .line 113
    :cond_2
    return v1

    .line 114
    :cond_3
    return v0
.end method

.method public final bd()V
    .locals 12

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
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    move v1, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v3

    .line 26
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v3

    .line 41
    :goto_1
    new-array v4, v2, [Z

    .line 42
    .line 43
    aput-boolean v3, v4, v3

    .line 44
    .line 45
    new-array v5, v2, [Z

    .line 46
    .line 47
    aput-boolean v3, v5, v3

    .line 48
    .line 49
    if-nez v1, :cond_7

    .line 50
    .line 51
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_7

    .line 58
    .line 59
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 62
    .line 63
    const-string v6, "quickchat"

    .line 64
    .line 65
    invoke-static {v1, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_7

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v6, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 80
    .line 81
    invoke-interface {v1, v6}, Ll/r97;->c4(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_7

    .line 86
    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/joa;->v4()Lrx/c;

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v1}, Ll/r97;->F5()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_2

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-interface {v1}, Ll/r97;->d3()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_2

    .line 121
    .line 122
    move v3, v2

    .line 123
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-interface {v1}, Ll/r97;->C2()Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_3

    .line 136
    .line 137
    new-instance v0, Ll/vnz;

    .line 138
    .line 139
    invoke-direct {v0}, Ll/vnz;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v3, v0}, Ll/tvz;->ic(ZLl/y20;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-interface {v1}, Ll/r97;->J2()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_7

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->b3()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-lez v1, :cond_4

    .line 173
    .line 174
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 175
    .line 176
    check-cast v0, Ll/yxz;

    .line 177
    .line 178
    new-instance v1, Ll/wnz;

    .line 179
    .line 180
    invoke-direct {v1, p0, v3}, Ll/wnz;-><init>(Ll/tvz;Z)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Ll/yxz;->m5(Ll/y20;)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_4
    if-eqz v0, :cond_6

    .line 188
    .line 189
    if-eqz v3, :cond_5

    .line 190
    .line 191
    invoke-virtual {p0, v2}, Ll/tvz;->Lg(Z)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    new-instance v2, Ll/xnz;

    .line 208
    .line 209
    invoke-direct {v2, p0, v4}, Ll/xnz;-><init>(Ll/tvz;[Z)V

    .line 210
    .line 211
    .line 212
    new-instance v3, Ll/ynz;

    .line 213
    .line 214
    invoke-direct {v3, p0, v4}, Ll/ynz;-><init>(Ll/tvz;[Z)V

    .line 215
    .line 216
    .line 217
    const-string p0, "p_chat_view,e_quickchatbell_search,click"

    .line 218
    .line 219
    invoke-interface {v0, v1, p0, v2, v3}, Ll/r97;->O3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 228
    .line 229
    .line 230
    move-result-object v6

    .line 231
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 236
    .line 237
    new-instance v10, Ll/aoz;

    .line 238
    .line 239
    invoke-direct {v10, p0, v3, v5}, Ll/aoz;-><init>(Ll/tvz;Z[Z)V

    .line 240
    .line 241
    .line 242
    new-instance v11, Ll/boz;

    .line 243
    .line 244
    invoke-direct {v11, p0, v5}, Ll/boz;-><init>(Ll/tvz;[Z)V

    .line 245
    .line 246
    .line 247
    const-string v8, "p_chat_view,e_quickchatbell_search,click"

    .line 248
    .line 249
    invoke-interface/range {v6 .. v11}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 250
    .line 251
    .line 252
    :cond_7
    return-void
.end method

.method public final synthetic be(Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/tvz;->a1:Ll/byd0;

    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->n()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Yg(Ljava/lang/String;Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic bf(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Fg(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 p0, 0x0

    .line 52
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final synthetic bg(Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/clz;->E6(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c3(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->sc(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final cd()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/r97;->s5()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 46
    .line 47
    const-string v1, "male"

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    iget-object v0, v0, Ll/dkb;->L2:Ll/vxd0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v1}, Ll/r97;->K5()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-ge v0, v1, :cond_0

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    iget-object v0, v0, Ll/dkb;->M2:Ll/byd0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Ljava/lang/Long;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    invoke-static {v0, v1}, Ll/i39;->a(J)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-interface {v1}, Ll/r97;->V4()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-lt v0, v1, :cond_0

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_0

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/clz;->e4()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_0

    .line 134
    .line 135
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 138
    .line 139
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 148
    .line 149
    iget-object v2, p0, Ll/clz;->b:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ig(Ljava/lang/String;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    new-instance v2, Ll/zqz;

    .line 156
    .line 157
    invoke-direct {v2}, Ll/zqz;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    new-instance v1, Ll/krz;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/krz;-><init>(Ll/tvz;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v1, Ll/vrz;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/vrz;-><init>(Ll/tvz;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 211
    .line 212
    .line 213
    :cond_0
    return-void
.end method

.method public final synthetic ce(Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->B1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic cf(Ll/pf60;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->jh(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object p0, p0, Ll/dkb;->M2:Ll/byd0;

    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    iget-object p0, p0, Ll/dkb;->L2:Ll/vxd0;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Ll/vxd0;->a(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic cg(Lcom/p1/mobile/putong/core/data/ChatHeat;Ll/uxj0;)V
    .locals 2

    .line 1
    const-string p2, "pokeAnimObs back"

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->next()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p2, v0, p1}, Ll/tvz;->Og(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Ll/tvz;->P0:Z

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ll/tvz;->Ng(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public d3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->d3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J1:Lcom/p1/mobile/putong/core/api/r;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/r;->g5(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Ll/tvz;->ug()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public d6()Z
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
    invoke-interface {v0}, Ll/r97;->O2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/tvz;->Hd()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    return v1

    .line 44
    :cond_0
    return v2

    .line 45
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ll/r97;->U3()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    return v2

    .line 60
    :cond_2
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 89
    .line 90
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 91
    .line 92
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 97
    .line 98
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 99
    .line 100
    iget v3, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 101
    .line 102
    if-lt v0, v3, :cond_3

    .line 103
    .line 104
    move v0, v1

    .line 105
    goto :goto_0

    .line 106
    :cond_3
    move v0, v2

    .line 107
    :goto_0
    if-nez v0, :cond_5

    .line 108
    .line 109
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 110
    .line 111
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_4

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_4

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_4

    .line 136
    .line 137
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 138
    .line 139
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 140
    .line 141
    int-to-double v3, p0

    .line 142
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 149
    .line 150
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 151
    .line 152
    if-lt p0, v0, :cond_4

    .line 153
    .line 154
    return v1

    .line 155
    :cond_4
    return v2

    .line 156
    :cond_5
    return v0
.end method

.method public final dd()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->s4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 45
    .line 46
    const-string v1, "intlReadMessage"

    .line 47
    .line 48
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/fnz;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/fnz;-><init>(Ll/tvz;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method

.method public final synthetic de(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

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
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    return-object p0
.end method

.method public final synthetic df(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->B1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic dg(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public e3(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/clz;->e3(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 11
    .line 12
    if-eqz v1, :cond_5

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_5

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_5

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 35
    .line 36
    invoke-interface {v1, p1}, Ll/r97;->i2(Ljava/lang/Throwable;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p1, p0}, Ll/tcz;->F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->subCode:I

    .line 55
    .line 56
    const/16 v1, 0x67

    .line 57
    .line 58
    const-string v2, "\u4ed6"

    .line 59
    .line 60
    const-string v3, "\u5979"

    .line 61
    .line 62
    if-eq p1, v1, :cond_3

    .line 63
    .line 64
    const/16 v1, 0x68

    .line 65
    .line 66
    if-eq p1, v1, :cond_3

    .line 67
    .line 68
    const/16 v1, 0x69

    .line 69
    .line 70
    if-ne p1, v1, :cond_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/16 v1, 0x194

    .line 74
    .line 75
    if-ne p1, v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    move-object v2, v3

    .line 84
    :cond_2
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string v0, "\u4f60\u5df2\u7ecf\u5bf9%s\u53d1\u51fa\u8fc7\u559c\u6b22\u4e86\uff0c\u8bf7\u9759\u5f85\u4ed6\u7684\u56de\u5e94\u5427~"

    .line 89
    .line 90
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_4

    .line 110
    .line 111
    move-object v2, v3

    .line 112
    :cond_4
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string v0, "%s\u5df2\u7ecf\u63d0\u524d\u9000\u51fa\u95ea\u804a"

    .line 117
    .line 118
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 130
    .line 131
    .line 132
    :cond_5
    return-void
.end method

.method public e6()Z
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
    invoke-interface {v0}, Ll/r97;->O2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    return v1

    .line 38
    :cond_0
    return v2

    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ll/r97;->U3()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    return v2

    .line 54
    :cond_2
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 83
    .line 84
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 85
    .line 86
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 91
    .line 92
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 93
    .line 94
    iget v3, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 95
    .line 96
    if-lt v0, v3, :cond_3

    .line 97
    .line 98
    move v0, v1

    .line 99
    goto :goto_0

    .line 100
    :cond_3
    move v0, v2

    .line 101
    :goto_0
    if-nez v0, :cond_5

    .line 102
    .line 103
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 104
    .line 105
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_4

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_4

    .line 130
    .line 131
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 132
    .line 133
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 134
    .line 135
    int-to-double v3, p0

    .line 136
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 141
    .line 142
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 143
    .line 144
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 145
    .line 146
    if-lt p0, v0, :cond_4

    .line 147
    .line 148
    return v1

    .line 149
    :cond_4
    return v2

    .line 150
    :cond_5
    return v0
.end method

.method public final ed()V
    .locals 2

    .line 1
    new-instance v0, Ll/dpz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dpz;-><init>(Ll/tvz;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/epz;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/epz;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/fpz;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/fpz;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/hpz;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/hpz;-><init>(Ll/tvz;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v0, Ll/ipz;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/ipz;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic ee(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvz;->L0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic ef()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic eg(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "message"

    .line 14
    .line 15
    const-string v1, "conversation"

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->Xf(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final fd()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vtz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/vtz;-><init>(Ll/tvz;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic fe(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clz;->K:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic ff(Lcom/p1/mobile/putong/data/Location;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1, v2, p1}, Lcom/p1/mobile/putong/core/api/g;->Aq(Ljava/lang/String;DI)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic fg(Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-object v1, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/yxz;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/qzz;->g2()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iput-object p1, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 38
    .line 39
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Ll/yxz;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/qzz;->g2()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p1, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iput-object v1, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/yxz;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/qzz;->g2()V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public g6()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-super {p0}, Ll/clz;->g6()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final gd()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/gsz;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/gsz;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic ge(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/yxz;->d4(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic gf(Lcom/p1/mobile/putong/data/Location;)Lcom/p1/mobile/putong/data/Location;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/jqz;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/jqz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/data/Location;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public final synthetic gg(Lcom/p1/mobile/putong/core/data/AnalysisGuide;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->used:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/cv6;->t3(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->isShow:Z

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "guide_type_analyze"

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ug(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Ll/cv6;->s3(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final hd()V
    .locals 3

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
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Tn(Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/gu20;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/gu20;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/coz;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/coz;-><init>(Ll/tvz;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/doz;

    .line 75
    .line 76
    invoke-direct {v0}, Ll/doz;-><init>()V

    .line 77
    .line 78
    .line 79
    new-instance v1, Ll/eoz;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/eoz;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public final synthetic he(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 10
    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/n2;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->C()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic hf(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/tvz;->h1:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_2

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/tvz;->h1:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    check-cast v0, Ll/yxz;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/yxz;->X4()V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Ll/tvz;->h1:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    check-cast v0, Ll/yxz;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/yxz;->O3()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Ll/yxz;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/yxz;->K3()V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public final synthetic hg(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/h39;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/yxz;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/yxz;->h5(Ljava/util/List;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public i7()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tvz;->l4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0}, Ll/r97;->Q4(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final ic(ZLl/y20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v4, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 18
    .line 19
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->transDataFromUser(Lcom/p1/mobile/putong/data/User;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, v4, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 27
    .line 28
    iput-boolean v0, v4, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 29
    .line 30
    iput-boolean v0, v4, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isGreet:Z

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v8, ""

    .line 45
    .line 46
    const/4 v9, 0x0

    .line 47
    const/4 v6, 0x0

    .line 48
    const/4 v7, 0x0

    .line 49
    move v5, p1

    .line 50
    move-object v10, p2

    .line 51
    invoke-interface/range {v2 .. v10}, Ll/r97;->W0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;ZLl/y20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    move-object v10, p2

    .line 56
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-interface {v10, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final id()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hd()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v0, p0, Ll/clz;->d:I

    .line 17
    .line 18
    const/16 v1, 0x1d

    .line 19
    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/i46;->a:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance v1, Ll/zsz;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/zsz;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/tvz$a;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/tvz$a;-><init>(Ll/tvz;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->b0:Lrx/subjects/b;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/tvz$b;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/tvz$b;-><init>(Ll/tvz;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic ie(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/tvz;->S0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->e(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 12
    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/n2;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->C()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic ig(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j7()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tvz;->L0:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final jd()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dd()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    iget-object v2, p0, Ll/clz;->c:Ljava/lang/String;

    .line 44
    .line 45
    const-string v3, "local_o_diamond_visitor_guide"

    .line 46
    .line 47
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/wtz;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/wtz;-><init>(Ll/tvz;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 59
    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    new-instance v0, Ljava/lang/NullPointerException;

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Ll/clz;->b:Ljava/lang/String;

    .line 73
    .line 74
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 75
    .line 76
    filled-new-array {v1, v2, p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v1, "initODiamondVisitorGuide,me:%s,other:%s,convId:%s"

    .line 81
    .line 82
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/16 p0, 0xa

    .line 90
    .line 91
    invoke-static {v0, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_5

    .line 100
    .line 101
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_3

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0}, Ll/r97;->a2()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_4

    .line 128
    .line 129
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 132
    .line 133
    const-string v1, "dismissed"

    .line 134
    .line 135
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_5

    .line 140
    .line 141
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 144
    .line 145
    const-string v1, "blocked"

    .line 146
    .line 147
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_4

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 167
    .line 168
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 169
    .line 170
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {v2, v3}, Ll/enb;->G3(Ljava/lang/String;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    new-instance v3, Ll/xtz;

    .line 195
    .line 196
    invoke-direct {v3}, Ll/xtz;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const/4 v1, 0x1

    .line 208
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/ytz;

    .line 213
    .line 214
    invoke-direct {v1}, Ll/ytz;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    new-instance v1, Ll/ztz;

    .line 222
    .line 223
    invoke-direct {v1, p0}, Ll/ztz;-><init>(Ll/tvz;)V

    .line 224
    .line 225
    .line 226
    new-instance p0, Ll/buz;

    .line 227
    .line 228
    invoke-direct {p0}, Ll/buz;-><init>()V

    .line 229
    .line 230
    .line 231
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 236
    .line 237
    .line 238
    :cond_5
    :goto_0
    return-void
.end method

.method public final synthetic je(Ll/ovb0;)V
    .locals 4

    .line 1
    const-string v0, "\u6765\u81ea\u6570\u636e\u5e93\u8ba2\u9605\u53cd\u9988"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v2, "default"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_6

    .line 22
    .line 23
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "quickchat"

    .line 28
    .line 29
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_6

    .line 34
    .line 35
    iget-object v0, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 36
    .line 37
    if-eqz v0, :cond_6

    .line 38
    .line 39
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iget-object v0, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_6

    .line 56
    .line 57
    iget-object v0, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    goto/16 :goto_1

    .line 68
    .line 69
    :cond_0
    iget-object v0, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 70
    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    const-string v0, "chatHeat == null"

    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 79
    .line 80
    move-object v2, v0

    .line 81
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 82
    .line 83
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 84
    .line 85
    int-to-float v2, v2

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 87
    .line 88
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 89
    .line 90
    iget-object v3, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 91
    .line 92
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_1

    .line 97
    .line 98
    iget-object p1, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast p1, Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    int-to-float p1, p1

    .line 111
    const v0, 0x3e4ccccd    # 0.2f

    .line 112
    .line 113
    .line 114
    mul-float/2addr p1, v0

    .line 115
    add-float/2addr v2, p1

    .line 116
    float-to-double v0, v2

    .line 117
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->f(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->p(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    invoke-virtual {p0, p1}, Ll/clz;->Z6(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v0, v1}, Ll/clz;->a7(D)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0, p1}, Ll/tvz;->Ed(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v1, "warmingUpAnimRunning = "

    .line 138
    .line 139
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-boolean v1, p0, Ll/tvz;->P0:Z

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, "  triple.first = "

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v1, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 153
    .line 154
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatHeat;->toJson()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-boolean v0, p0, Ll/tvz;->P0:Z

    .line 171
    .line 172
    iget-object v1, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 173
    .line 174
    if-eqz v0, :cond_5

    .line 175
    .line 176
    move-object v0, v1

    .line 177
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 178
    .line 179
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 180
    .line 181
    if-eqz v0, :cond_4

    .line 182
    .line 183
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 184
    .line 185
    iget-wide v0, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/clz;->m3()D

    .line 188
    .line 189
    .line 190
    move-result-wide v2

    .line 191
    cmpl-double v0, v0, v2

    .line 192
    .line 193
    if-lez v0, :cond_4

    .line 194
    .line 195
    iget-object p1, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 196
    .line 197
    if-nez p1, :cond_3

    .line 198
    .line 199
    const/4 p1, 0x0

    .line 200
    goto :goto_0

    .line 201
    :cond_3
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    :goto_0
    iput-object p1, p0, Ll/tvz;->R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 208
    .line 209
    :cond_4
    return-void

    .line 210
    :cond_5
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 211
    .line 212
    invoke-virtual {p0, v1}, Ll/tvz;->Mg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_6
    :goto_1
    const-string p1, "status exception"

    .line 217
    .line 218
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iput-boolean v1, p0, Ll/tvz;->O0:Z

    .line 222
    .line 223
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    check-cast p0, Ll/d3z;

    .line 236
    .line 237
    invoke-virtual {p0}, Ll/d3z;->y0()V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public final synthetic jf(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/vg60;

    .line 8
    .line 9
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    const/16 v1, 0x64

    .line 12
    .line 13
    iget-object v2, p0, Ll/clz;->n:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/b;->l(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;ILjava/util/HashMap;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Ll/tvz;->g1:Ljava/lang/Runnable;

    .line 26
    .line 27
    const-wide/16 v0, 0x1f4

    .line 28
    .line 29
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic jg(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k6(ILandroid/view/Menu;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/clz;->k6(ILandroid/view/Menu;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const-string p0, "e_message_page_set_nickname"

    .line 11
    .line 12
    const-string p1, "p_chat_view"

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final kd()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->cf()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/tvz;->Hg()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 31
    .line 32
    const-string v2, "local_platinum_pin_guide"

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/core/api/g;->Gg(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Lg(Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    new-instance v3, Ll/foz;

    .line 78
    .line 79
    invoke-direct {v3}, Ll/foz;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/goz;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/goz;-><init>(Ll/tvz;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/hoz;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/hoz;-><init>(Ll/tvz;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic ke(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/yxz;->d4(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic kf()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/yxz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/qzz;->t1:Ll/rdz;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/yxz;

    .line 24
    .line 25
    iget-object p0, p0, Ll/qzz;->t1:Ll/rdz;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/rdz;->d()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic kg(Z)V
    .locals 1

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
    invoke-interface {v0}, Ll/r97;->P()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/qrz;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/qrz;-><init>(Ll/tvz;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Ll/tvz;->ic(ZLl/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public l4()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Ll/hcp;->c(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public l6(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Ll/clz;->l6(Landroid/view/MenuItem;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public l7()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

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
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->tags:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    move v0, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v0, v1

    .line 40
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_2

    .line 53
    .line 54
    iget-object v3, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 55
    .line 56
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 65
    .line 66
    const-string v4, "default"

    .line 67
    .line 68
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-nez v3, :cond_1

    .line 73
    .line 74
    iget-object v3, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 75
    .line 76
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_2

    .line 83
    .line 84
    :cond_1
    if-nez v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    iget-object v3, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 101
    .line 102
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v0}, Ll/clz;->a4(Lcom/p1/mobile/putong/data/User;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-nez p0, :cond_2

    .line 113
    .line 114
    return v2

    .line 115
    :cond_2
    return v1
.end method

.method public final lc()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/n96;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/n96;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/urz;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/urz;-><init>(Ll/tvz;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final ld()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gi()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->p0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/yxz;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/qzz;->s0()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/gtz;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/gtz;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/htz;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/htz;-><init>(Ll/tvz;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public final synthetic le(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/yxz;

    .line 6
    .line 7
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Ll/yxz;->d5(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic lf(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/yxz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/qzz;->t1:Ll/rdz;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/yxz;

    .line 24
    .line 25
    iget-object p0, p0, Ll/qzz;->t1:Ll/rdz;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/rdz;->d()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 42
    .line 43
    move-object v2, v1

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 47
    .line 48
    check-cast v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 51
    .line 52
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "%s\n%s"

    .line 57
    .line 58
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 63
    .line 64
    move-object v2, p1

    .line 65
    check-cast v2, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCount:Ljava/lang/String;

    .line 68
    .line 69
    check-cast p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTime:Ljava/lang/String;

    .line 72
    .line 73
    filled-new-array {v2, p1}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v2, "#4c000000"

    .line 82
    .line 83
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    const-string v3, "sans-serif"

    .line 88
    .line 89
    invoke-static {v3, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v1, p1, v2, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public final synthetic lg()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final mc()V
    .locals 0

    .line 1
    return-void
.end method

.method public final md()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gr90;->a()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bnz;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/bnz;-><init>(Ll/tvz;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/cnz;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/cnz;-><init>(Ll/tvz;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/enz;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/enz;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic me(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/k05;->e()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/k05;->o()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/k05;->g()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic mf(Ll/bkj0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/r97;->a2()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCount:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTime:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_0
    new-instance v0, Ll/cqz;

    .line 76
    .line 77
    invoke-direct {v0, p0, p1}, Ll/cqz;-><init>(Ll/tvz;Ll/bkj0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 85
    .line 86
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-static {v0}, Ll/xg0;->e(Lcom/p1/mobile/putong/data/User;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    iget-object v1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 99
    .line 100
    invoke-static {v1}, Ll/xg0;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_3

    .line 129
    .line 130
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTime:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_3

    .line 141
    .line 142
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 145
    .line 146
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCount:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-nez v1, :cond_2

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    .line 156
    .line 157
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 158
    .line 159
    .line 160
    :try_start_0
    const-string v2, "title"

    .line 161
    .line 162
    iget-object v3, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 163
    .line 164
    check-cast v3, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 165
    .line 166
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitCountStr:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    const-string v2, "sub_title"

    .line 172
    .line 173
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->visitTimeStr:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .line 181
    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 191
    .line 192
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->fn(Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_3

    .line 197
    .line 198
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 201
    .line 202
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 203
    .line 204
    const-string v2, "local_o_diamond_visitor_guide"

    .line 205
    .line 206
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    const/4 v3, 0x0

    .line 215
    invoke-virtual {p1, v0, v2, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->bh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ljava/lang/String;Ll/y20;)Lrx/c;

    .line 216
    .line 217
    .line 218
    invoke-direct {p0}, Ll/tvz;->vd()V

    .line 219
    .line 220
    .line 221
    const-string p0, "e_visit_times_decrypt"

    .line 222
    .line 223
    const-string p1, "p_chat_view"

    .line 224
    .line 225
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :catch_0
    move-exception p0

    .line 230
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 231
    .line 232
    .line 233
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic mg(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final nc()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/orz;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/orz;-><init>(Ll/tvz;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/prz;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Ll/prz;-><init>(Ll/tvz;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public nd()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/qmz;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ll/qmz;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/rmz;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/rmz;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/tmz;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/tmz;-><init>(Ll/tvz;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic ne(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    check-cast v0, Ll/yxz;

    .line 14
    .line 15
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/yxz;->f5(Lcom/p1/mobile/putong/data/Picture;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    check-cast v0, Ll/yxz;

    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    invoke-virtual {v0, p0}, Ll/yxz;->f5(Lcom/p1/mobile/putong/data/Picture;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic nf(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {v0}, Ll/xg0;->e(Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    invoke-static {p0}, Ll/xg0;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic ng(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tvz;->yg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final oc()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_6

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/clz;->e4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    return v1

    .line 56
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Ll/cv6;->p3(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    invoke-static {}, Ll/joa;->l3()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-gtz p0, :cond_5

    .line 76
    .line 77
    return v1

    .line 78
    :cond_5
    const/4 p0, 0x1

    .line 79
    return p0

    .line 80
    :cond_6
    :goto_0
    return v1
.end method

.method public final od()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->V0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/guz;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/guz;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/huz;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/huz;-><init>(Ll/tvz;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/iuz;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/iuz;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/juz;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/juz;-><init>(Ll/tvz;)V

    .line 75
    .line 76
    .line 77
    new-instance p0, Ll/kuz;

    .line 78
    .line 79
    invoke-direct {p0}, Ll/kuz;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic oe(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Eg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic of(Ll/bkj0;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 38
    .line 39
    iget-boolean v2, p1, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->pin:Z

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 44
    .line 45
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    long-to-double v4, v4

    .line 50
    cmpl-double p1, v2, v4

    .line 51
    .line 52
    if-lez p1, :cond_0

    .line 53
    .line 54
    move p1, v1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    move p1, v0

    .line 57
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumChatPinGuideLastCloseTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 58
    .line 59
    iget-object v3, p0, Ll/clz;->c:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    int-to-long v2, v2

    .line 66
    const-wide/16 v4, 0x3e8

    .line 67
    .line 68
    mul-long/2addr v2, v4

    .line 69
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumChatPinGuideCloseCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 76
    .line 77
    iget-object v3, p0, Ll/clz;->c:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-static {}, Ll/h39;->w()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-lt v2, v3, :cond_1

    .line 88
    .line 89
    move v2, v1

    .line 90
    goto :goto_1

    .line 91
    :cond_1
    move v2, v0

    .line 92
    :goto_1
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 95
    .line 96
    iget-object v3, v3, Ll/pla;->Z:Ll/byd0;

    .line 97
    .line 98
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Ljava/lang/Long;

    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 105
    .line 106
    .line 107
    move-result-wide v3

    .line 108
    invoke-static {v3, v4}, Ll/pzi0;->D(J)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-eqz v3, :cond_2

    .line 113
    .line 114
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 117
    .line 118
    iget-object v3, v3, Ll/pla;->a0:Ll/vxd0;

    .line 119
    .line 120
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Ljava/lang/Integer;

    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    invoke-static {}, Ll/h39;->x()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-lt v3, v4, :cond_2

    .line 135
    .line 136
    move v0, v1

    .line 137
    :cond_2
    if-nez p1, :cond_5

    .line 138
    .line 139
    invoke-static {}, Ll/joa;->I3()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_3

    .line 144
    .line 145
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 146
    .line 147
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 148
    .line 149
    if-eqz p1, :cond_5

    .line 150
    .line 151
    if-nez v0, :cond_5

    .line 152
    .line 153
    if-nez v2, :cond_5

    .line 154
    .line 155
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 156
    .line 157
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 158
    .line 159
    iget-object v0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 160
    .line 161
    const-string v2, "local_platinum_pin_guide"

    .line 162
    .line 163
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    const-string v3, "platinum pin guide"

    .line 168
    .line 169
    const/4 v4, 0x0

    .line 170
    invoke-virtual {p1, v0, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->bh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ljava/lang/String;Ll/y20;)Lrx/c;

    .line 171
    .line 172
    .line 173
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 176
    .line 177
    iget-object p1, p1, Ll/pla;->Z:Ll/byd0;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p1, Ljava/lang/Long;

    .line 184
    .line 185
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 186
    .line 187
    .line 188
    move-result-wide v2

    .line 189
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_4

    .line 194
    .line 195
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 198
    .line 199
    iget-object p1, p1, Ll/pla;->a0:Ll/vxd0;

    .line 200
    .line 201
    invoke-virtual {p1, v1}, Ll/vxd0;->a(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_2

    .line 205
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 208
    .line 209
    iget-object p1, p1, Ll/pla;->a0:Ll/vxd0;

    .line 210
    .line 211
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    :goto_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 221
    .line 222
    iget-object p1, p1, Ll/pla;->Z:Ll/byd0;

    .line 223
    .line 224
    invoke-static {}, Ll/pzi0;->o()J

    .line 225
    .line 226
    .line 227
    move-result-wide v0

    .line 228
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    const-string p1, "e_platinum_top_chat"

    .line 236
    .line 237
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_5
    return-void
.end method

.method public final synthetic og()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yxz;->B5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final pc()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_7

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/clz;->e4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    return v1

    .line 56
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v2}, Ll/cv6;->q3(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Ll/cv6;->w3(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    return v1

    .line 86
    :cond_5
    invoke-static {}, Ll/joa;->k3()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-gtz p0, :cond_6

    .line 91
    .line 92
    return v1

    .line 93
    :cond_6
    const/4 p0, 0x1

    .line 94
    return p0

    .line 95
    :cond_7
    :goto_0
    return v1
.end method

.method public final pd()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Jo()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object v2, p0, Ll/clz;->c:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Kg(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v3, Ll/ypz;

    .line 49
    .line 50
    invoke-direct {v3}, Ll/ypz;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/zpz;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/zpz;-><init>(Ll/tvz;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/aqz;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/aqz;-><init>(Ll/tvz;)V

    .line 77
    .line 78
    .line 79
    new-instance p0, Ll/bqz;

    .line 80
    .line 81
    invoke-direct {p0}, Ll/bqz;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public final synthetic pe(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Bg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic pf(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->P1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic pg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v1, v1, Ll/dkb;->s2:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->h(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {p0, v1, v2}, Ll/clz;->Y6(D)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Ll/yxz;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/yxz;->u5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 39
    .line 40
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 41
    .line 42
    iget-object v2, p0, Ll/clz;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ll/t600;->U(Ljava/lang/String;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/4 v3, 0x0

    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 60
    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    long-to-double v4, v4

    .line 66
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 67
    .line 68
    sub-double/2addr v4, v1

    .line 69
    const-wide v1, 0x4194997000000000L    # 8.64E7

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    div-double/2addr v4, v1

    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->h(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 76
    .line 77
    .line 78
    move-result-wide v1

    .line 79
    new-instance v6, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v7, "tempDownAnim day = "

    .line 82
    .line 83
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-static {v6}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const-wide/high16 v6, 0x401c000000000000L    # 7.0

    .line 97
    .line 98
    cmpg-double v6, v4, v6

    .line 99
    .line 100
    if-gtz v6, :cond_1

    .line 101
    .line 102
    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    .line 103
    .line 104
    cmpl-double v4, v4, v6

    .line 105
    .line 106
    if-ltz v4, :cond_1

    .line 107
    .line 108
    iget-wide v4, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 109
    .line 110
    cmpl-double v4, v4, v1

    .line 111
    .line 112
    if-lez v4, :cond_1

    .line 113
    .line 114
    iget-wide v4, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 115
    .line 116
    cmpg-double v4, v4, v1

    .line 117
    .line 118
    if-gez v4, :cond_1

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 125
    .line 126
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 129
    .line 130
    new-instance v4, Ll/ksz;

    .line 131
    .line 132
    invoke-direct {v4, p1}, Ll/ksz;-><init>(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v4}, Ll/fy6;->a(Ll/x20;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, v1, v2}, Ll/clz;->Y6(D)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 142
    .line 143
    check-cast p0, Ll/yxz;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/yxz;->u5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_1
    iput-boolean v3, p0, Ll/tvz;->P0:Z

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_2
    iput-boolean v3, p0, Ll/tvz;->P0:Z

    .line 153
    .line 154
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    new-instance v0, Ll/lsz;

    .line 159
    .line 160
    invoke-direct {v0, p0}, Ll/lsz;-><init>(Ll/tvz;)V

    .line 161
    .line 162
    .line 163
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public q4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yxz;->c4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final qc(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Ll/clz;->i:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Ll/clz;->i:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    iget-object v0, v0, Ll/dkb;->H0:Ll/vxd0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v1, 0x3

    .line 68
    if-ge v0, v1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Ll/pzi0;->o()J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object v3, v3, Ll/dkb;->I0:Ll/byd0;

    .line 79
    .line 80
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Ljava/lang/Long;

    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    const/4 v5, 0x1

    .line 91
    if-nez v0, :cond_0

    .line 92
    .line 93
    iget-object v3, p0, Ll/clz;->i:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 96
    .line 97
    double-to-long v3, v3

    .line 98
    const/4 v6, 0x4

    .line 99
    invoke-static {v1, v2, v3, v4, v6}, Ll/tzi0;->h(JJI)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    goto :goto_0

    .line 104
    :cond_0
    if-ne v0, v5, :cond_1

    .line 105
    .line 106
    invoke-static {v1, v2, v3, v4, v5}, Ll/tzi0;->h(JJI)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    goto :goto_0

    .line 111
    :cond_1
    const/4 v6, 0x2

    .line 112
    if-ne v0, v6, :cond_2

    .line 113
    .line 114
    invoke-static {v1, v2, v3, v4, v6}, Ll/tzi0;->h(JJI)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    goto :goto_0

    .line 119
    :cond_2
    const/4 v3, 0x0

    .line 120
    :goto_0
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 123
    .line 124
    iget-object v4, v4, Ll/dkb;->J0:Ll/xyd0;

    .line 125
    .line 126
    invoke-virtual {v4}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Ljava/util/HashSet;

    .line 131
    .line 132
    if-eqz v3, :cond_3

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-nez v3, :cond_3

    .line 143
    .line 144
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 147
    .line 148
    iget-object v3, v3, Ll/dkb;->I0:Ll/byd0;

    .line 149
    .line 150
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    invoke-virtual {v3, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 158
    .line 159
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 160
    .line 161
    iget-object v3, v3, Ll/dkb;->H0:Ll/vxd0;

    .line 162
    .line 163
    add-int/2addr v0, v5

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v3, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 176
    .line 177
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Ljava/lang/Integer;

    .line 182
    .line 183
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-static {v0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 192
    .line 193
    const-string v0, "tantan_verify_toast"

    .line 194
    .line 195
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 200
    .line 201
    long-to-double v5, v1

    .line 202
    iput-wide v5, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 203
    .line 204
    iput-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageExtData;->new_()Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 211
    .line 212
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 215
    .line 216
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-virtual {v4, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 227
    .line 228
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 229
    .line 230
    iget-object p0, p0, Ll/dkb;->J0:Ll/xyd0;

    .line 231
    .line 232
    invoke-virtual {p0, v4}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    :cond_3
    return-void
.end method

.method public final qd()V
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/tvz;->N0:Lrx/subjects/a;

    .line 19
    .line 20
    new-instance v1, Ll/gpz;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/gpz;-><init>(Ll/tvz;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/rpz;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/rpz;-><init>(Ll/tvz;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/h39;->J()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/sb8;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/sb8;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/dqz;

    .line 73
    .line 74
    invoke-direct {v1}, Ll/dqz;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/oqz;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/oqz;-><init>(Ll/tvz;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic qe(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->Bg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic qf(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic qg(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p4, p4, Ll/dkb;->s2:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    check-cast p4, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-nez p4, :cond_0

    .line 18
    .line 19
    new-instance p4, Ll/jsz;

    .line 20
    .line 21
    invoke-direct {p4, p1}, Ll/jsz;-><init>(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p4}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/yxz;

    .line 30
    .line 31
    invoke-virtual {p0, p2, p3}, Ll/yxz;->w5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public r3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public rc(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/clz;->b3(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isCustomerServiceAccount()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/yxz;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qzz;->U1()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final rd()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->s4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ll/r97;->U2()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/uoz;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/uoz;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/woz;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/woz;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/xoz;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/xoz;-><init>(Ll/tvz;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final synthetic re(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/d3z;

    .line 14
    .line 15
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p0, v0, p1}, Ll/d3z;->F1(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic rf(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic rg(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/tvz;->P0:Z

    .line 3
    .line 4
    return-void
.end method

.method public s3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public sc(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;Lcom/p1/mobile/putong/data/User;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/clz;->c3(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/tvz;->c1:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iput-boolean v3, p0, Ll/tvz;->c1:Z

    .line 12
    .line 13
    invoke-static {}, Ll/nvm;->n()Ll/nvm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v4, p2, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    move-object v4, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v4, p2, Ll/vg60;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Lcom/p1/mobile/putong/core/data/Message;

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v0, p1, v4, p3}, Ll/nvm;->v(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-static {}, Ll/nvm;->n()Ll/nvm;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v4, p2, Ll/vg60;->a:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iget-object v2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    move-object v2, v1

    .line 58
    check-cast v2, Lcom/p1/mobile/putong/core/data/Message;

    .line 59
    .line 60
    :goto_1
    invoke-virtual {v0, p1, v2, p3}, Ll/nvm;->k(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Qg(Lcom/p1/mobile/putong/core/data/Conversation;Ll/vg60;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Ll/clz;->i:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    invoke-virtual {v0, p3, v1}, Ll/o3z;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/tvz;->Gg(Ljava/util/List;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_4

    .line 106
    .line 107
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ll/xab;->e3(Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_4

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 128
    .line 129
    const-string v0, "dismissed"

    .line 130
    .line 131
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_4

    .line 136
    .line 137
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_4

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-interface {p1}, Ll/r97;->N3()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_4

    .line 156
    .line 157
    iget-boolean p1, p0, Ll/tvz;->I0:Z

    .line 158
    .line 159
    if-nez p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 162
    .line 163
    check-cast p1, Ll/yxz;

    .line 164
    .line 165
    invoke-virtual {p1}, Ll/yxz;->r5()V

    .line 166
    .line 167
    .line 168
    iput-boolean v3, p0, Ll/tvz;->I0:Z

    .line 169
    .line 170
    :cond_4
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 175
    .line 176
    invoke-virtual {p0, p1, p2}, Ll/tvz;->sg(Ljava/lang/String;Ljava/util/List;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final sd()V
    .locals 3

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
    invoke-interface {v0}, Ll/r97;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/btz;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/btz;-><init>(Ll/tvz;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/ctz;

    .line 32
    .line 33
    invoke-direct {v2, v1}, Ll/ctz;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/dtz;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/dtz;-><init>(Ll/tvz;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/ftz;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/ftz;-><init>(Ll/tvz;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final synthetic se()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Hf(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic sf(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yxz;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yxz;->V3(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final sg(Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

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
    invoke-interface {v0}, Ll/r97;->H4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_4

    .line 21
    .line 22
    const-string v0, "-11004"

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {v0, p1}, Ll/r97;->I1(Lcom/p1/mobile/putong/data/User;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    move p2, v1

    .line 58
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/tvz;->vc()Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    const/4 v2, 0x1

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-direct {p0, v2}, Ll/tvz;->tg(Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    add-int/2addr p2, v2

    .line 90
    const/16 v0, 0xa

    .line 91
    .line 92
    if-lt p2, v0, :cond_1

    .line 93
    .line 94
    invoke-direct {p0, v2}, Ll/tvz;->tg(Z)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    invoke-direct {p0, v1}, Ll/tvz;->tg(Z)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_4
    :goto_0
    invoke-direct {p0, v1}, Ll/tvz;->tg(Z)V

    .line 103
    .line 104
    .line 105
    :cond_5
    return-void
.end method

.method public t6(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

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
    invoke-interface {v0, p1}, Ll/r97;->K2(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->giftRecordId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->giftRecordId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/lu8;->j4(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/hsz;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/hsz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/fjf0;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final tc()V
    .locals 4

    .line 1
    invoke-static {}, Ll/h39;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->w1:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sub-long/2addr v0, v2

    .line 28
    const-wide/32 v2, 0x240c8400

    .line 29
    .line 30
    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-gez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    iget-object v0, v0, Ll/dkb;->R:Ll/gyd0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Jg(Ljava/lang/String;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 78
    .line 79
    iget-object v2, p0, Ll/clz;->b:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    new-instance v3, Ll/rvz;

    .line 98
    .line 99
    invoke-direct {v3}, Ll/rvz;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/mlz;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/mlz;-><init>(Ll/tvz;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 125
    .line 126
    .line 127
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic te()V
    .locals 1

    .line 1
    new-instance v0, Ll/lrz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lrz;-><init>(Ll/tvz;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic tf(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ll/r97;->E3()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Ll/yxz;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/qzz;->r0()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public u3()Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvz;->j1:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 2
    .line 3
    return-object p0
.end method

.method public uc(Ljava/lang/Class;)Ll/cbm;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/cbm;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tvz;->f1:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/asz;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/asz;-><init>(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/qbm;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    check-cast p0, Ll/cbm;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final ud()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xsz;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/xsz;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ysz;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ysz;-><init>(Ll/tvz;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic ue([Ll/jl80;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    aput-object v1, p1, v0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic uf(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x14

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/tvz;->Q0:Z

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/tvz;->Q0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-ne p1, v1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Ll/r97;->E3()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p1, Ll/yxz;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/qzz;->N0()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Ll/yxz;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/qzz;->i2()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final ug()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/h39;->I()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "local_birthday_tip"

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/r97;->v5()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string v0, "local_chat_assistant_question_new"

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-static {}, Ll/h39;->O()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const-string v0, "local_heart_beat_lock_tip"

    .line 43
    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->cf()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const-string v0, "local_platinum_pin_guide"

    .line 62
    .line 63
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dd()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    const-string v0, "local_o_diamond_visitor_guide"

    .line 81
    .line 82
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d4()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    const-string v0, "local_visitor_hide_footprint"

    .line 100
    .line 101
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {v0}, Ll/r97;->o0()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_6

    .line 117
    .line 118
    const-string v0, "local_wechat_notify_guide"

    .line 119
    .line 120
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xn()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    const-string v0, "local_ux_questionnaire"

    .line 138
    .line 139
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    const-string v0, "local_ux_questionnaire_tip"

    .line 143
    .line 144
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    :cond_7
    return-object p0
.end method

.method public vc()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clz;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic ve([Ll/jl80;Ll/ovb0;)V
    .locals 5

    .line 1
    iget-object v0, p2, Ll/ovb0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "default"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    iget-object v0, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_4

    .line 24
    .line 25
    iget-object v0, p2, Ll/ovb0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 30
    .line 31
    const-string v1, "deleted"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    iget-object v0, p2, Ll/ovb0;->c:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 44
    .line 45
    const-string v1, "dismissed"

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_4

    .line 52
    .line 53
    iget-object v0, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    iget-object v0, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget-object v1, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isOpenFilterVeriMsg()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget-object v2, p2, Ll/ovb0;->b:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/4 v3, 0x0

    .line 87
    if-eqz v2, :cond_1

    .line 88
    .line 89
    iget-object v2, p2, Ll/ovb0;->b:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_1

    .line 100
    .line 101
    iget-object v2, p2, Ll/ovb0;->b:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 104
    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 108
    .line 109
    const-string v4, "verified"

    .line 110
    .line 111
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    if-eqz v0, :cond_3

    .line 119
    .line 120
    if-nez v1, :cond_2

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_2
    aget-object v0, p1, v3

    .line 124
    .line 125
    if-nez v0, :cond_4

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget-object v1, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 132
    .line 133
    iget-object p2, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    new-instance v2, Ll/frz;

    .line 138
    .line 139
    invoke-direct {v2, p0, p1}, Ll/frz;-><init>(Ll/tvz;[Ll/jl80;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v1, p2, v2}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/jl80;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    aput-object p0, p1, v3

    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    :goto_0
    aget-object p0, p1, v3

    .line 150
    .line 151
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-eqz p0, :cond_4

    .line 156
    .line 157
    aget-object p0, p1, v3

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_4

    .line 164
    .line 165
    aget-object p0, p1, v3

    .line 166
    .line 167
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 168
    .line 169
    .line 170
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic vf(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Y7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 42
    .line 43
    const-string v0, "default"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    iget-object p1, p1, Ll/dkb;->e2:Ll/jxd0;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/tvz;->Hg()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_0

    .line 74
    .line 75
    iget-boolean p0, p0, Ll/tvz;->n1:Z

    .line 76
    .line 77
    if-nez p0, :cond_0

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const/4 p0, 0x0

    .line 82
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public vg()Z
    .locals 9

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
    invoke-interface {v0}, Ll/r97;->v5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_4

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_4

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_4

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_4

    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 120
    .line 121
    if-nez v0, :cond_4

    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_4

    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_1
    invoke-virtual {p0}, Ll/clz;->e4()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-nez v0, :cond_4

    .line 157
    .line 158
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 159
    .line 160
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_4

    .line 173
    .line 174
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-nez v0, :cond_4

    .line 181
    .line 182
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 183
    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 185
    .line 186
    const-string v2, "dismissed"

    .line 187
    .line 188
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-nez v0, :cond_4

    .line 193
    .line 194
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 195
    .line 196
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 197
    .line 198
    const/4 v2, 0x1

    .line 199
    if-lt v0, v2, :cond_2

    .line 200
    .line 201
    goto :goto_0

    .line 202
    :cond_2
    invoke-static {}, Ll/pzi0;->o()J

    .line 203
    .line 204
    .line 205
    move-result-wide v3

    .line 206
    iget-object p0, p0, Ll/tvz;->a1:Ll/byd0;

    .line 207
    .line 208
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    check-cast p0, Ljava/lang/Long;

    .line 213
    .line 214
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 215
    .line 216
    .line 217
    move-result-wide v5

    .line 218
    const-wide/32 v7, 0x5265c00

    .line 219
    .line 220
    .line 221
    add-long/2addr v5, v7

    .line 222
    cmp-long p0, v3, v5

    .line 223
    .line 224
    if-gez p0, :cond_3

    .line 225
    .line 226
    return v1

    .line 227
    :cond_3
    return v2

    .line 228
    :cond_4
    :goto_0
    return v1
.end method

.method public final wc()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Kf(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/tvz;->pc()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/tvz;->Jg()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final wd()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->oo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ioz;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ioz;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/joz;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/joz;-><init>(Ll/tvz;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->wn()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/ioz;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/ioz;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/joz;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/joz;-><init>(Ll/tvz;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/h39;->S()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    :goto_0
    return-void

    .line 91
    :cond_1
    new-instance v0, Ll/loz;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/loz;-><init>(Ll/tvz;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic we()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->G:Ll/zqe0;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/zqe0;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic wf(Ll/pf60;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "local_push_switch"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object p0, p0, Ll/dkb;->e2:Ll/jxd0;

    .line 21
    .line 22
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    iget-object p0, p0, Ll/dkb;->b2:Ll/byd0;

    .line 32
    .line 33
    invoke-static {}, Ll/pzi0;->o()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public wg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->s()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public x3()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvz;->J0:Ll/n4z;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/n4z;->r0()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public x6()Lcom/p1/mobile/putong/data/User;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/clz;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-object p0
.end method

.method public final xc()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t0:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAITranslate;->p3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/yoz;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/yoz;-><init>(Ll/tvz;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/zoz;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/zoz;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final xd()V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->w4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0}, Ll/tvz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v0, v1}, Ll/r97;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ll/r97;->g2()Lrx/subjects/b;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v1, 0x2

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/atz;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/atz;-><init>(Ll/tvz;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public final synthetic xe(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/clz;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/yxz;

    .line 12
    .line 13
    iget-object v0, p0, Ll/clz;->H:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 21
    .line 22
    new-instance v1, Ll/erz;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/erz;-><init>(Ll/tvz;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Ll/yxz;->Z4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic xf(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tvz;->lc()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/clz;->s:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/utq;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/utq;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p0, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public xg(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tvz;->zg(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/tvz;->Ag(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public y6()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/clz;->y6()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/nvm;->n()Ll/nvm;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/nvm;->u(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final yc()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/llz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/llz;-><init>(Ll/tvz;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final yd()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Jo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ktz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ktz;-><init>(Ll/tvz;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic ye(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/clz;->H:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/yxz;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/yxz;->t5()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic yf(Ll/pf60;)V
    .locals 4

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v1, Ll/yxz;

    .line 24
    .line 25
    iget-object v1, v1, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v1, Ll/yxz;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/yxz;->n5()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v1, Ll/yxz;

    .line 44
    .line 45
    iget-object v1, v1, Ll/qzz;->r1:Ll/hxy;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v1, Ll/yxz;

    .line 56
    .line 57
    iget-object v1, v1, Ll/qzz;->r1:Ll/hxy;

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/hxy;->m()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/16 v2, 0xa

    .line 64
    .line 65
    if-ne v1, v2, :cond_1

    .line 66
    .line 67
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast v1, Ll/yxz;

    .line 70
    .line 71
    new-instance v2, Ll/uqz;

    .line 72
    .line 73
    invoke-direct {v2}, Ll/uqz;-><init>()V

    .line 74
    .line 75
    .line 76
    const/4 v3, 0x0

    .line 77
    invoke-virtual {v1, v3, v2}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    iget-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_2

    .line 97
    .line 98
    const-string p1, ""

    .line 99
    .line 100
    iput-object p1, p0, Ll/tvz;->b1:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public final yg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "playTempAnim level = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "   chatHeat = "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeat;->toJson()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v0, Ll/yxz;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/yxz;->a4()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Ll/yxz;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/yxz;->N3()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 54
    .line 55
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/wrz;

    .line 69
    .line 70
    invoke-direct {v1, p0, p1}, Ll/wrz;-><init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public z3()Ljava/lang/String;
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->U3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-super {p0}, Ll/clz;->z3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 23
    .line 24
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/cn7;->m3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 43
    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v1, "level_"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 54
    .line 55
    add-int/lit8 p0, p0, -0x1

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    const-string p0, "-1"

    .line 66
    .line 67
    return-object p0
.end method

.method public z6(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;Z)V
    .locals 8

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/clz;->H:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/yxz;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/yxz;->Z3()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    move-object v1, v0

    .line 29
    check-cast v1, Ll/yxz;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x1

    .line 33
    move-object v2, p1

    .line 34
    move-object v3, p2

    .line 35
    move-object v6, p3

    .line 36
    move v7, p4

    .line 37
    invoke-virtual/range {v1 .. v7}, Ll/yxz;->a5(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    xor-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "is_chat_gift_sender"

    .line 59
    .line 60
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string p2, "chat_gift_id"

    .line 65
    .line 66
    iget-object p3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string p2, "e_chat_gift_view"

    .line 77
    .line 78
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public final zc()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/vlz;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/vlz;-><init>(Ll/tvz;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/r97;->h3()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 46
    .line 47
    if-ne v0, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/tvz;->pd()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final zd()V
    .locals 3

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    iget-object v1, v1, Ll/dkb;->K0:Ll/jxd0;

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_0

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    iget-object v1, v1, Ll/dkb;->K0:Ll/jxd0;

    .line 88
    .line 89
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast p0, Ll/yxz;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/yxz;->p5(Lcom/p1/mobile/putong/data/User;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    return-void
.end method

.method public final synthetic ze(Ll/jl80;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic zf(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/yxz;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Ll/yxz;->W4(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final zg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 10
    .line 11
    const-string p1, "image/*"

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 14
    .line 15
    const-string p1, "raw"

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 22
    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 37
    .line 38
    const-string v0, "real_shot"

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 45
    .line 46
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/clz;->A6(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
