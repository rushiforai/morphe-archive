.class public final synthetic Ll/dbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/SurfaceViewRenderer;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/SurfaceViewRenderer;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbh0;->a:Lcom/bytedance/realx/video/SurfaceViewRenderer;

    iput p2, p0, Ll/dbh0;->b:I

    iput p3, p0, Ll/dbh0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dbh0;->a:Lcom/bytedance/realx/video/SurfaceViewRenderer;

    iget v1, p0, Ll/dbh0;->b:I

    iget p0, p0, Ll/dbh0;->c:I

    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->a(Lcom/bytedance/realx/video/SurfaceViewRenderer;II)V

    return-void
.end method
