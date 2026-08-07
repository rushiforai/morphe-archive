.class public final Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

.field public b:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1    # Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/SurfaceHolder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;->a:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;->b:Landroid/view/SurfaceHolder;

    .line 7
    .line 8
    return-void
.end method
