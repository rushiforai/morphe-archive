.class public Ll/c6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z6m;


# static fields
.field public static final b:Ll/z6m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c6e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c6e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c6e;->b:Ll/z6m;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d()Ll/z6m;
    .locals 1

    .line 1
    sget-object v0, Ll/c6e;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/tcu;->d()Ll/z6m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ll/z6m;->a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_2

    .line 10
    .line 11
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "fake_conversation_greeting"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/dek0;->d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    :cond_0
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 80
    .line 81
    const-string p1, "group"

    .line 82
    .line 83
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_1

    .line 94
    .line 95
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 96
    .line 97
    const-string p1, "red_packet"

    .line 98
    .line 99
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_2

    .line 104
    .line 105
    invoke-static {p2}, Ll/dek0;->c(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_2

    .line 110
    .line 111
    :cond_1
    const/4 p0, 0x1

    .line 112
    return p0

    .line 113
    :cond_2
    const/4 p0, 0x0

    .line 114
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Ll/dek0;->b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/z6m;->c(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
