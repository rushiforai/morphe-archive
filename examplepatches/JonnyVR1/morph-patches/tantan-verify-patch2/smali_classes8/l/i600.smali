.class public final synthetic Ll/i600;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i600;->a:Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i600;->a:Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;

    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->Y1(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Lcom/p1/mobile/putong/data/Gender;)V

    return-void
.end method
