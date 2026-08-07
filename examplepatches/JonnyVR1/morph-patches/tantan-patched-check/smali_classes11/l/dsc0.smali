.class public Ll/dsc0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;)I
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_2

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 28
    .line 29
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E7(Lcom/p1/mobile/putong/data/CounterConversations;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 34
    .line 35
    iget v0, v0, Lcom/p1/mobile/putong/data/CounterMessages;->unread:I

    .line 36
    .line 37
    add-int/2addr p0, v0

    .line 38
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    add-int/2addr p0, p2

    .line 43
    invoke-static {}, Ll/f7e;->a()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    iget-object p2, p2, Ll/dkb;->V0:Ll/vxd0;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    const/4 v0, 0x2

    .line 66
    if-ge p2, v0, :cond_0

    .line 67
    .line 68
    invoke-static {}, Ll/gra;->S2()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_0

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 75
    .line 76
    iget p1, p1, Lcom/p1/mobile/putong/data/CounterMessages;->liunread:I

    .line 77
    .line 78
    sub-int/2addr p0, p1

    .line 79
    :cond_0
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p1, p1, Ll/r8n;->b:Lrx/subjects/a;

    .line 84
    .line 85
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_1

    .line 96
    .line 97
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 98
    .line 99
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_1

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 106
    .line 107
    new-instance p2, Ll/csc0;

    .line 108
    .line 109
    invoke-direct {p2}, Ll/csc0;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {p1, p2}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    add-int/2addr p0, p1

    .line 117
    :cond_1
    return p0

    .line 118
    :cond_2
    const/4 p0, 0x0

    .line 119
    return p0
.end method
