.class public Ll/ft4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z6m;


# static fields
.field public static final c:Ll/z6m;


# instance fields
.field public b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ft4;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ft4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ft4;->c:Ll/z6m;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/ft4;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static d()Ll/z6m;
    .locals 1

    .line 1
    sget-object v0, Ll/ft4;->c:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/tcu;->d()Ll/z6m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1, p2}, Ll/z6m;->a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    invoke-virtual {p2, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->bo(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    iget-object p2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 28
    .line 29
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    invoke-interface {p2, v0, p1}, Ll/ue6;->I0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/ft4;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    xor-int/lit8 p0, p0, 0x1

    .line 44
    .line 45
    return p0

    .line 46
    :cond_1
    return v0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 8
    .line 9
    const-string p2, "birthday"

    .line 10
    .line 11
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/16 p1, -0x7a45

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const p1, -0x181e3

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p0, p0, Ll/ft4;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
