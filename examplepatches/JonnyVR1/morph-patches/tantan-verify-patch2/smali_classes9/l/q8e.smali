.class public final synthetic Ll/q8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u8e;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;


# direct methods
.method public synthetic constructor <init>(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8e;->a:Ll/u8e;

    iput-object p2, p0, Ll/q8e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q8e;->a:Ll/u8e;

    iget-object p0, p0, Ll/q8e;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0}, Ll/u8e;->b(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    return-void
.end method
