.class public Lcom/mm/mmfile/FileUploadConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/FileUploadConfig$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_UPLOAD_TIME_SECONDS:J = 0x384L


# instance fields
.field private deleteAfterUploaded:Z

.field private uploadClockTimeSeconds:J

.field private uploader:Lcom/mm/mmfile/IMMFileUploader;


# direct methods
.method private constructor <init>(Lcom/mm/mmfile/FileUploadConfig$Builder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->access$000(Lcom/mm/mmfile/FileUploadConfig$Builder;)Lcom/mm/mmfile/IMMFileUploader;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/mm/mmfile/FileUploadConfig;->uploader:Lcom/mm/mmfile/IMMFileUploader;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->access$100(Lcom/mm/mmfile/FileUploadConfig$Builder;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/mm/mmfile/FileUploadConfig;->deleteAfterUploaded:Z

    .line 15
    .line 16
    invoke-static {p1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->access$200(Lcom/mm/mmfile/FileUploadConfig$Builder;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Lcom/mm/mmfile/FileUploadConfig;->uploadClockTimeSeconds:J

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/FileUploadConfig$Builder;Lcom/mm/mmfile/FileUploadConfig$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/mm/mmfile/FileUploadConfig;-><init>(Lcom/mm/mmfile/FileUploadConfig$Builder;)V

    return-void
.end method

.method public static getDefaultUploadTimeSeconds()J
    .locals 2

    const-wide/16 v0, 0x384

    return-wide v0
.end method


# virtual methods
.method public getUploadClockTimeSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/FileUploadConfig;->uploadClockTimeSeconds:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUploader()Lcom/mm/mmfile/IMMFileUploader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/FileUploadConfig;->uploader:Lcom/mm/mmfile/IMMFileUploader;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDeleteAfterUploaded()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/FileUploadConfig;->deleteAfterUploaded:Z

    .line 2
    .line 3
    return p0
.end method

.method public setUploadClockTimeSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mmfile/FileUploadConfig;->uploadClockTimeSeconds:J

    .line 2
    .line 3
    return-void
.end method
