.class public final Lcom/heytap/mcssdk/b/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/heytap/mcssdk/b/c;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lcom/heytap/mcssdk/mode/Message;Lcom/heytap/mcssdk/callback/MessageCallback;)V
    .locals 1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/heytap/mcssdk/mode/Message;->getType()I

    move-result p0

    const/16 v0, 0x1007

    if-ne p0, v0, :cond_1

    check-cast p2, Lcom/heytap/mcssdk/mode/SptDataMessage;

    if-eqz p3, :cond_1

    invoke-interface {p3, p1, p2}, Lcom/heytap/mcssdk/callback/MessageCallback;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V

    :cond_1
    :goto_0
    return-void
.end method
