.class public final synthetic Ll/wf60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wf60;->a:Ljava/util/List;

    iput-object p2, p0, Ll/wf60;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wf60;->a:Ljava/util/List;

    iget-object p0, p0, Ll/wf60;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->d(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;)V

    return-void
.end method
