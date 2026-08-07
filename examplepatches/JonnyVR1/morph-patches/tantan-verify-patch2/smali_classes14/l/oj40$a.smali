.class public Ll/oj40$a;
.super Ll/oj40;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/oj40;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pf60;


# direct methods
.method public constructor <init>(Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oj40$a;->a:Ll/pf60;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/oj40;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oj40$a;->a:Ll/pf60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oj40$a;->a:Ll/pf60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3}, Ll/oj40;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
