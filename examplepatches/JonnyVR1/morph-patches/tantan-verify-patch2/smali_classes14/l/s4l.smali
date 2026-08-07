.class public final synthetic Ll/s4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u4l;

.field public final synthetic b:Ll/vx80;


# direct methods
.method public synthetic constructor <init>(Ll/u4l;Ll/vx80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4l;->a:Ll/u4l;

    iput-object p2, p0, Ll/s4l;->b:Ll/vx80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4l;->a:Ll/u4l;

    iget-object p0, p0, Ll/s4l;->b:Ll/vx80;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, p0, p1}, Ll/u4l;->O(Ll/u4l;Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
