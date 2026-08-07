.class public final synthetic Ll/hss;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iss;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;


# direct methods
.method public synthetic constructor <init>(Ll/iss;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hss;->a:Ll/iss;

    iput-object p2, p0, Ll/hss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hss;->a:Ll/iss;

    iget-object p0, p0, Ll/hss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    invoke-static {v0, p0, p1}, Ll/iss;->E(Ll/iss;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Landroid/view/View;)V

    return-void
.end method
