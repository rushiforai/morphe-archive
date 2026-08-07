.class Lcom/momo/mcamera/mask/BasicRender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/BasicRender;->updateRenderSize(Ll/erf0;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/BasicRender;

.field final synthetic val$isFront:Z

.field final synthetic val$rotateValue:I

.field final synthetic val$size:Ll/erf0;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/BasicRender;Ll/erf0;ZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender$1;->this$0:Lcom/momo/mcamera/mask/BasicRender;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$size:Ll/erf0;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$isFront:Z

    .line 6
    .line 7
    iput p4, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$rotateValue:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender$1;->this$0:Lcom/momo/mcamera/mask/BasicRender;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/momo/mcamera/mask/BasicRender;->onSurfaceChangedListener:Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;->onSurfaceChanged()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender$1;->this$0:Lcom/momo/mcamera/mask/BasicRender;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$size:Ll/erf0;

    .line 13
    .line 14
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$isFront:Z

    .line 15
    .line 16
    iget p0, p0, Lcom/momo/mcamera/mask/BasicRender$1;->val$rotateValue:I

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, p0}, Lcom/momo/mcamera/mask/BasicRender;->updateSize(Ll/erf0;ZI)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
