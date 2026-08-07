.class public final synthetic Ll/g3m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

.field public final synthetic b:Landroid/widget/LinearLayout;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g3m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

    iput-object p2, p0, Ll/g3m0;->b:Landroid/widget/LinearLayout;

    iput-object p3, p0, Ll/g3m0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g3m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

    iget-object v1, p0, Ll/g3m0;->b:Landroid/widget/LinearLayout;

    iget-object p0, p0, Ll/g3m0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;Landroid/view/View;)V

    return-void
.end method
