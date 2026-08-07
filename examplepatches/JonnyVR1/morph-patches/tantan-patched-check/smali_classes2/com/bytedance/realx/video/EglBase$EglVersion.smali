.class public Lcom/bytedance/realx/video/EglBase$EglVersion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/EglBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EglVersion"
.end annotation


# static fields
.field public static final EGL_VERSION_2:I = 0x2

.field public static final EGL_VERSION_3:I = 0x3

.field private static PREFERRED_EGL_VERSION:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getPreferredEglVersion()I
    .locals 1

    .line 1
    sget v0, Lcom/bytedance/realx/video/EglBase$EglVersion;->PREFERRED_EGL_VERSION:I

    .line 2
    .line 3
    return v0
.end method

.method public static setPreferredEglVersion(I)V
    .locals 0

    .line 1
    sput p0, Lcom/bytedance/realx/video/EglBase$EglVersion;->PREFERRED_EGL_VERSION:I

    .line 2
    .line 3
    return-void
.end method
