.class public Ll/sye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qbm;


# instance fields
.field public final a:Ll/yxz;

.field public final b:Ll/tvz;

.field public c:I


# direct methods
.method public constructor <init>(Ll/yxz;Ll/tvz;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/sye;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/sye;->a:Ll/yxz;

    .line 8
    .line 9
    iput-object p2, p0, Ll/sye;->b:Ll/tvz;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ll/sye;)Ll/pf60;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sye;->f()Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/sye;Ll/pf60;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sye;->g(Ll/pf60;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/sye;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sye;->h(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic f()Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    iget-object v1, p0, Ll/sye;->b:Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 24
    .line 25
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 26
    .line 27
    iget-object v2, p0, Ll/sye;->b:Ll/tvz;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object p0, p0, Ll/sye;->b:Ll/tvz;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, v2, p0}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b()Lrx/c;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pye;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pye;-><init>(Ll/sye;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/qye;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/qye;-><init>(Ll/sye;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/rye;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/rye;-><init>(Ll/sye;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic g(Ll/pf60;)Ljava/lang/Integer;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v2, Ljava/util/List;

    .line 9
    .line 10
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x7

    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_1

    .line 57
    .line 58
    const/16 p0, 0x8

    .line 59
    .line 60
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->iceBreakLastMessageShowCountLimit:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 66
    .line 67
    iget-object p0, p0, Ll/sye;->b:Ll/tvz;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-static {}, Ll/h39;->u()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iget v3, v3, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;->iceBreakLastMessageShowCountLimit:I

    .line 82
    .line 83
    if-lt p0, v3, :cond_2

    .line 84
    .line 85
    return-object v1

    .line 86
    :cond_2
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    const-wide/16 v3, 0x0

    .line 91
    .line 92
    if-eqz p0, :cond_3

    .line 93
    .line 94
    move-wide v5, v3

    .line 95
    goto :goto_0

    .line 96
    :cond_3
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 101
    .line 102
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 103
    .line 104
    :goto_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    move-wide p0, v3

    .line 111
    goto :goto_1

    .line 112
    :cond_4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 117
    .line 118
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 119
    .line 120
    :goto_1
    invoke-static {v5, v6, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 121
    .line 122
    .line 123
    move-result-wide p0

    .line 124
    cmpl-double v0, p0, v3

    .line 125
    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    return-object v1

    .line 129
    :cond_5
    invoke-static {}, Ll/h39;->u()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;->iceBreakLastMessageTimeLimit:I

    .line 134
    .line 135
    int-to-long v2, v0

    .line 136
    const-wide/32 v4, 0x5265c00

    .line 137
    .line 138
    .line 139
    mul-long/2addr v2, v4

    .line 140
    invoke-static {}, Ll/pzi0;->o()J

    .line 141
    .line 142
    .line 143
    move-result-wide v4

    .line 144
    long-to-double v4, v4

    .line 145
    sub-double/2addr v4, p0

    .line 146
    long-to-double p0, v2

    .line 147
    cmpl-double p0, v4, p0

    .line 148
    .line 149
    if-lez p0, :cond_6

    .line 150
    .line 151
    const/16 p0, 0x9

    .line 152
    .line 153
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0

    .line 158
    :cond_6
    return-object v1
.end method

.method public final synthetic h(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Ll/sye;->c:I

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public handle()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sye;->a:Ll/yxz;

    .line 2
    .line 3
    iget p0, p0, Ll/sye;->c:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/yxz;->g5(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
