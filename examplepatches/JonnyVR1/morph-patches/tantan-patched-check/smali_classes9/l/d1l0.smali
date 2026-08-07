.class public final synthetic Ll/d1l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/d1l0;->a:I

    iput-object p2, p0, Ll/d1l0;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget v0, p0, Ll/d1l0;->a:I

    iget-object p0, p0, Ll/d1l0;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView$b;->i(ILcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;)V

    return-void
.end method
