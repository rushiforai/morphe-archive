.class public final synthetic Ll/ecj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ecj0;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Ll/ecj0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ecj0;->a:Landroid/view/ViewGroup;

    iget-object p0, p0, Ll/ecj0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;->c(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/topic/TopicView;)V

    return-void
.end method
