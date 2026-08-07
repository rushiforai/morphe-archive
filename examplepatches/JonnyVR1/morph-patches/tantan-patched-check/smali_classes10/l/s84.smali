.class public final synthetic Ll/s84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s84;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    iput-boolean p2, p0, Ll/s84;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s84;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    iget-boolean p0, p0, Ll/s84;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->f(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Z)V

    return-void
.end method
