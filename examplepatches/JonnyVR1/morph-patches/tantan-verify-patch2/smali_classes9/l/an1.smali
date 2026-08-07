.class public final synthetic Ll/an1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/in1;


# direct methods
.method public synthetic constructor <init>(Ll/in1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/an1;->a:Ll/in1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an1;->a:Ll/in1;

    check-cast p1, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    invoke-virtual {p0, p1}, Ll/in1;->Z3(Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;)V

    return-void
.end method
