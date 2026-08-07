.class public final synthetic Ll/k0c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;


# direct methods
.method public synthetic constructor <init>(JLcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/k0c0;->a:J

    iput-object p3, p0, Ll/k0c0;->b:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/k0c0;->a:J

    iget-object p0, p0, Ll/k0c0;->b:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, p0, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;->q(JLcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;J)V

    return-void
.end method
