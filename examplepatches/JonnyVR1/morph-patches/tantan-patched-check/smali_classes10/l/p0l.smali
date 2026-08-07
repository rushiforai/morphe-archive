.class public final synthetic Ll/p0l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;

.field public final synthetic c:Ll/i1l;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p0l;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

    iput-object p2, p0, Ll/p0l;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;

    iput-object p3, p0, Ll/p0l;->c:Ll/i1l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p0l;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

    iget-object v1, p0, Ll/p0l;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;

    iget-object p0, p0, Ll/p0l;->c:Ll/i1l;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;->i0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;Landroid/view/View;)V

    return-void
.end method
