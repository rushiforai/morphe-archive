.class public final synthetic Ll/nah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/SurfaceTextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    invoke-static {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->c(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    return-void
.end method
