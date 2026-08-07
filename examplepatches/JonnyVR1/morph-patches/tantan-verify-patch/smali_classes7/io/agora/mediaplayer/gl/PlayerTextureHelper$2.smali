.class Lio/agora/mediaplayer/gl/PlayerTextureHelper$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/gl/PlayerTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/mediaplayer/gl/PlayerTextureHelper;


# direct methods
.method public constructor <init>(Lio/agora/mediaplayer/gl/PlayerTextureHelper;)V
    .locals 0

    iput-object p1, p0, Lio/agora/mediaplayer/gl/PlayerTextureHelper$2;->this$0:Lio/agora/mediaplayer/gl/PlayerTextureHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/agora/mediaplayer/gl/PlayerTextureHelper$2;->this$0:Lio/agora/mediaplayer/gl/PlayerTextureHelper;

    invoke-static {v0}, Lio/agora/mediaplayer/gl/PlayerTextureHelper;->access$100(Lio/agora/mediaplayer/gl/PlayerTextureHelper;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/agora/mediaplayer/gl/PlayerTextureHelper$2;->this$0:Lio/agora/mediaplayer/gl/PlayerTextureHelper;

    invoke-static {v0}, Lio/agora/mediaplayer/gl/PlayerTextureHelper;->access$200(Lio/agora/mediaplayer/gl/PlayerTextureHelper;)V

    iget-object p0, p0, Lio/agora/mediaplayer/gl/PlayerTextureHelper$2;->this$0:Lio/agora/mediaplayer/gl/PlayerTextureHelper;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/agora/mediaplayer/gl/PlayerTextureHelper;->access$102(Lio/agora/mediaplayer/gl/PlayerTextureHelper;Z)Z

    :cond_0
    return-void
.end method
