.class public final synthetic Ll/f97;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/GroupNotification;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/GroupNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f97;->a:Lcom/p1/mobile/putong/core/data/GroupNotification;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f97;->a:Lcom/p1/mobile/putong/core/data/GroupNotification;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->Q(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
