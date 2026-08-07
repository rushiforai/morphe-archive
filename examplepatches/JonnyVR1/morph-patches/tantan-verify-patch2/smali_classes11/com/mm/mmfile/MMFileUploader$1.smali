.class Lcom/mm/mmfile/MMFileUploader$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mm/mmfile/MMFileUploader;->forceUploadMMFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mm/mmfile/MMFileUploader;

.field final synthetic val$filePath:Ljava/lang/String;

.field final synthetic val$fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/FileUploadConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader$1;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/mm/mmfile/MMFileUploader$1;->val$fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/mm/mmfile/MMFileUploader$1;->val$filePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader$1;->val$fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    new-instance v1, Ljava/io/File;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$1;->val$filePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/mm/mmfile/MMFileUploader;->access$200(Lcom/mm/mmfile/FileUploadConfig;Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
