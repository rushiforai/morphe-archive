.class public final synthetic Ll/c7n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/g7n0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;


# direct methods
.method public synthetic constructor <init>(Ll/g7n0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c7n0;->a:Ll/g7n0;

    iput-object p2, p0, Ll/c7n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c7n0;->a:Ll/g7n0;

    iget-object p0, p0, Ll/c7n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    invoke-static {v0, p0, p1}, Ll/g7n0;->a(Ll/g7n0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;Landroid/view/View;)V

    return-void
.end method
