.class public final synthetic Ll/kah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/SurfaceTextureHelper;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    iput p2, p0, Ll/kah0;->b:I

    iput p3, p0, Ll/kah0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    iget v1, p0, Ll/kah0;->b:I

    iget p0, p0, Ll/kah0;->c:I

    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->d(Lcom/momo/rtcbase/SurfaceTextureHelper;II)V

    return-void
.end method
