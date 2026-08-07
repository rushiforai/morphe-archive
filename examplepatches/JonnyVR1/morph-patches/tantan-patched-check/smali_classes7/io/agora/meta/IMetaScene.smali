.class public abstract Lio/agora/meta/IMetaScene;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addEventHandler(Lio/agora/meta/IMetaSceneEventHandler;)I
.end method

.method public abstract addSceneView(Landroid/view/TextureView;Lio/agora/meta/SceneDisplayConfig;)I
.end method

.method public abstract enableFaceCapture(Z)I
.end method

.method public abstract enableSceneVideoCapture(Landroid/view/TextureView;Z)I
.end method

.method public abstract enableVideoDisplay(Ljava/lang/String;Z)I
.end method

.method public abstract enterScene(Lio/agora/meta/EnterSceneConfig;)I
.end method

.method public abstract getLocalUserAvatar()Lio/agora/meta/ILocalUserAvatar;
.end method

.method public abstract leaveScene()I
.end method

.method public abstract pushVideoFrameToDisplay(Ljava/lang/String;Lio/agora/base/VideoFrame;)I
.end method

.method public abstract pushVideoFrameToDisplay(Ljava/lang/String;Lio/agora/rtc2/video/AgoraVideoFrame;)I
.end method

.method public abstract release()I
.end method

.method public abstract removeEventHandler(Lio/agora/meta/IMetaSceneEventHandler;)I
.end method

.method public abstract removeSceneView(Landroid/view/TextureView;)I
.end method

.method public abstract sendSceneMessage([B)I
.end method

.method public abstract setSceneParameters(Ljava/lang/String;)I
.end method
