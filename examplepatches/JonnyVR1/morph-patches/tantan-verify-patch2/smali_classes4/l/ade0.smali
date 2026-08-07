.class public final synthetic Ll/ade0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

.field public final synthetic b:Landroid/media/projection/MediaProjection;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;Landroid/media/projection/MediaProjection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ade0;->a:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    iput-object p2, p0, Ll/ade0;->b:Landroid/media/projection/MediaProjection;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ade0;->a:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    iget-object p0, p0, Ll/ade0;->b:Landroid/media/projection/MediaProjection;

    invoke-static {v0, p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->b(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;Landroid/media/projection/MediaProjection;)V

    return-void
.end method
