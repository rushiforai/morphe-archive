.class public Ll/evq;
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
    new-instance v0, Ll/evq;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/evq;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/evq;->b:Ll/z6m;

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
    sget-object v0, Ll/evq;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->u3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 24
    .line 25
    const-string v0, "default"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 46
    .line 47
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    const/4 v1, 0x5

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_0

    .line 55
    .line 56
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-static {}, Ll/pzi0;->o()J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    long-to-double v0, v0

    .line 73
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 74
    .line 75
    sub-double/2addr v0, v2

    .line 76
    const-wide v2, 0x41124f8000000000L    # 300000.0

    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    cmpg-double p0, v0, v2

    .line 82
    .line 83
    if-gez p0, :cond_0

    .line 84
    .line 85
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 86
    .line 87
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 88
    .line 89
    const/4 p2, 0x1

    .line 90
    if-ge p1, p2, :cond_0

    .line 91
    .line 92
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 93
    .line 94
    if-lez p0, :cond_0

    .line 95
    .line 96
    return p2

    .line 97
    :cond_0
    const/4 p0, 0x0

    .line 98
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p1, "\u521a\u53d1\u6765\u6d88\u606f"

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/z6m;->c(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
