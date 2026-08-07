.class Lio/agora/rtc2/internal/gdp/GDPAndroid$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/internal/gdp/GDPAndroid;->gatherGlInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/gdp/GDPAndroid;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/gdp/GDPAndroid;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$1;->this$0:Lio/agora/rtc2/internal/gdp/GDPAndroid;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/internal/gdp/EglCore;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/internal/gdp/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    new-instance v1, Lio/agora/rtc2/internal/gdp/OffscreenSurface;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2, v2}, Lio/agora/rtc2/internal/gdp/OffscreenSurface;-><init>(Lio/agora/rtc2/internal/gdp/EglCore;II)V

    invoke-virtual {v1}, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->makeCurrent()V

    iget-object v2, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$1;->this$0:Lio/agora/rtc2/internal/gdp/GDPAndroid;

    const/16 v3, 0x1f00

    invoke-static {v3}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$002(Lio/agora/rtc2/internal/gdp/GDPAndroid;Ljava/lang/String;)Ljava/lang/String;

    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$1;->this$0:Lio/agora/rtc2/internal/gdp/GDPAndroid;

    const/16 v2, 0x1f01

    invoke-static {v2}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$102(Lio/agora/rtc2/internal/gdp/GDPAndroid;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/gdp/OffscreenSurface;->release()V

    invoke-virtual {v0}, Lio/agora/rtc2/internal/gdp/EglCore;->release()V

    return-void
.end method
