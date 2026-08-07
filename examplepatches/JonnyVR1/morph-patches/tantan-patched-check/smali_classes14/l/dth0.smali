.class public final synthetic Ll/dth0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ith0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ith0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dth0;->a:Ll/ith0;

    iput-object p2, p0, Ll/dth0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/dth0;->c:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    iput-object p4, p0, Ll/dth0;->d:Ll/x20;

    iput-object p5, p0, Ll/dth0;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dth0;->a:Ll/ith0;

    iget-object v1, p0, Ll/dth0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/dth0;->c:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    iget-object v3, p0, Ll/dth0;->d:Ll/x20;

    iget-object p0, p0, Ll/dth0;->e:Ll/y20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/ith0;->j(Ll/ith0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    return-void
.end method
