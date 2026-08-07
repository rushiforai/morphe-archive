.class public final synthetic Ll/ih10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInvite;

.field public final synthetic c:Ll/jh10;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInvite;Ll/jh10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/ih10;->a:I

    iput-object p2, p0, Ll/ih10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInvite;

    iput-object p3, p0, Ll/ih10;->c:Ll/jh10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/ih10;->a:I

    iget-object v1, p0, Ll/ih10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInvite;

    iget-object p0, p0, Ll/ih10;->c:Ll/jh10;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, p0, v2, v3}, Ll/jh10;->P3(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInvite;Ll/jh10;J)V

    return-void
.end method
