.class public Lio/agora/meta/IMetaServiceEventHandler$SceneDownloadState;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/meta/IMetaServiceEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SceneDownloadState"
.end annotation


# static fields
.field public static final META_SCENE_DOWNLOAD_STATE_DOWNLOADED:I = 0x2

.field public static final META_SCENE_DOWNLOAD_STATE_DOWNLOADING:I = 0x1

.field public static final META_SCENE_DOWNLOAD_STATE_FAILED:I = 0x3

.field public static final META_SCENE_DOWNLOAD_STATE_IDLE:I


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
