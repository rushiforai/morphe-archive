.class Lcom/leanplum/LeanplumInbox$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumInbox;->messagesIds()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/LeanplumInbox;


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumInbox;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/LeanplumInbox$1;->this$0:Lcom/leanplum/LeanplumInbox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 39
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/LeanplumInbox$1;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$1;->this$0:Lcom/leanplum/LeanplumInbox;

    invoke-virtual {v0, p1}, Lcom/leanplum/LeanplumInbox;->messageForId(Ljava/lang/String;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object p1

    const/4 v0, -0x1

    if-nez p1, :cond_a

    return v0

    :cond_a
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox$1;->this$0:Lcom/leanplum/LeanplumInbox;

    invoke-virtual {p0, p2}, Lcom/leanplum/LeanplumInbox;->messageForId(Ljava/lang/String;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object p0

    const/4 p2, 0x1

    if-nez p0, :cond_14

    return p2

    :cond_14
    invoke-virtual {p1}, Lcom/leanplum/LeanplumInboxMessage;->getDeliveryTimestamp()Ljava/util/Date;

    move-result-object p1

    if-nez p1, :cond_1b

    return v0

    :cond_1b
    invoke-virtual {p0}, Lcom/leanplum/LeanplumInboxMessage;->getDeliveryTimestamp()Ljava/util/Date;

    move-result-object p0

    if-nez p0, :cond_22

    return p2

    :cond_22
    invoke-virtual {p1, p0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    move-result p0

    return p0
.end method
