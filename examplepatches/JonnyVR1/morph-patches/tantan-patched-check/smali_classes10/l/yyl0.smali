.class public final synthetic Ll/yyl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/osn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;


# direct methods
.method public synthetic constructor <init>(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yyl0;->a:Ll/osn0;

    iput-object p2, p0, Ll/yyl0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yyl0;->a:Ll/osn0;

    iget-object p0, p0, Ll/yyl0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardSecondOrThirdView;->h0(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Landroid/view/View;)V

    return-void
.end method
