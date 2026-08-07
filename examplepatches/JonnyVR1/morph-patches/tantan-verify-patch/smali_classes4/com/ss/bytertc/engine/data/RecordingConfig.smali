.class public Lcom/ss/bytertc/engine/data/RecordingConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public dirPath:Ljava/lang/String;

.field public recordingFileType:Lcom/ss/bytertc/engine/type/RecordingFileType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    sget-object v0, Lcom/ss/bytertc/engine/type/RecordingFileType;->MP4:Lcom/ss/bytertc/engine/type/RecordingFileType;

    iput-object v0, p0, Lcom/ss/bytertc/engine/data/RecordingConfig;->recordingFileType:Lcom/ss/bytertc/engine/type/RecordingFileType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RecordingFileType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/type/RecordingFileType;->AAC:Lcom/ss/bytertc/engine/type/RecordingFileType;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RecordingConfig;->dirPath:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/RecordingConfig;->recordingFileType:Lcom/ss/bytertc/engine/type/RecordingFileType;

    .line 9
    .line 10
    return-void
.end method
