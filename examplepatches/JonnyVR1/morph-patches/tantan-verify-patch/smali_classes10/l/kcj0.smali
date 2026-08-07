.class public final synthetic Ll/kcj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/PreviewTagView;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;Lcom/p1/mobile/putong/live/livingroom/virtual/preview/PreviewTagView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kcj0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    iput-object p2, p0, Ll/kcj0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/PreviewTagView;

    iput-object p3, p0, Ll/kcj0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kcj0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    iget-object v1, p0, Ll/kcj0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/PreviewTagView;

    iget-object p0, p0, Ll/kcj0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;->m(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;Lcom/p1/mobile/putong/live/livingroom/virtual/preview/PreviewTagView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;Landroid/view/View;)V

    return-void
.end method
