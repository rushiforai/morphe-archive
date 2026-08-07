.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

.field public b:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->b:Ljava/lang/CharSequence;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 24
    .line 25
    if-ne p0, p1, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->b:Ljava/lang/CharSequence;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
