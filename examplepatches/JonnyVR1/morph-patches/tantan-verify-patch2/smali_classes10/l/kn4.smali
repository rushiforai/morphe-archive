.class public final synthetic Ll/kn4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/LiveUserLevel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/LiveUserLevel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kn4;->a:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    iput-object p2, p0, Ll/kn4;->b:Lcom/p1/mobile/putong/data/LiveUserLevel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kn4;->a:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    iget-object p0, p0, Ll/kn4;->b:Lcom/p1/mobile/putong/data/LiveUserLevel;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->p(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/LiveUserLevel;)V

    return-void
.end method
