.class public final Lcom/mm/mmfile/FileUploadConfig$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/FileUploadConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private deleteAfterUploaded:Z

.field private uploadClockTimeSeconds:J

.field private uploader:Lcom/mm/mmfile/IMMFileUploader;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->deleteAfterUploaded:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x384

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds:J

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$000(Lcom/mm/mmfile/FileUploadConfig$Builder;)Lcom/mm/mmfile/IMMFileUploader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploader:Lcom/mm/mmfile/IMMFileUploader;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/mm/mmfile/FileUploadConfig$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->deleteAfterUploaded:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/mm/mmfile/FileUploadConfig$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public build()Lcom/mm/mmfile/FileUploadConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/mm/mmfile/FileUploadConfig;-><init>(Lcom/mm/mmfile/FileUploadConfig$Builder;Lcom/mm/mmfile/FileUploadConfig$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public deleteAfterUploaded(Z)Lcom/mm/mmfile/FileUploadConfig$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->deleteAfterUploaded:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public uploadClockTimeSeconds(J)Lcom/mm/mmfile/FileUploadConfig$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds:J

    .line 2
    .line 3
    return-object p0
.end method

.method public uploader(Lcom/mm/mmfile/IMMFileUploader;)Lcom/mm/mmfile/FileUploadConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploader:Lcom/mm/mmfile/IMMFileUploader;

    .line 2
    .line 3
    return-object p0
.end method
