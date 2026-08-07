.class public final synthetic Ll/e4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

.field public final synthetic b:Ll/dyh0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Ll/dyh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    iput-object p2, p0, Ll/e4t;->b:Ll/dyh0;

    iput-object p3, p0, Ll/e4t;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    iget-object v1, p0, Ll/e4t;->b:Ll/dyh0;

    iget-object p0, p0, Ll/e4t;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Ll/dyh0;Ljava/lang/String;)V

    return-void
.end method
