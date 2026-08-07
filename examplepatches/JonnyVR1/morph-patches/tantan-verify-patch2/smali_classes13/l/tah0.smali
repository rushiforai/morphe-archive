.class public final synthetic Ll/tah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    iput p2, p0, Ll/tah0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    iget p0, p0, Ll/tah0;->b:I

    invoke-static {v0, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->a(Lcom/momo/rtcbase/SurfaceTextureHelper;I)V

    return-void
.end method
