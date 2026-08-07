.class public final synthetic Ll/wwu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wwu;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwu;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
