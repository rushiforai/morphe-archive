.class public final synthetic Ll/cbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/SurfaceViewRenderer;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/SurfaceViewRenderer;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cbh0;->a:Lcom/momo/rtcbase/SurfaceViewRenderer;

    iput p2, p0, Ll/cbh0;->b:I

    iput p3, p0, Ll/cbh0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cbh0;->a:Lcom/momo/rtcbase/SurfaceViewRenderer;

    iget v1, p0, Ll/cbh0;->b:I

    iget p0, p0, Ll/cbh0;->c:I

    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/SurfaceViewRenderer;->a(Lcom/momo/rtcbase/SurfaceViewRenderer;II)V

    return-void
.end method
