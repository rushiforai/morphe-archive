.class public Lcom/mm/mmfile/Strategy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/Strategy$Builder;
    }
.end annotation


# instance fields
.field private businesses:[Ljava/lang/String;

.field private fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

.field private fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;


# direct methods
.method private constructor <init>(Lcom/mm/mmfile/Strategy$Builder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/mm/mmfile/Strategy$Builder;->access$000(Lcom/mm/mmfile/Strategy$Builder;)Lcom/mm/mmfile/FileUploadConfig;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/mm/mmfile/Strategy;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/mm/mmfile/Strategy$Builder;->access$100(Lcom/mm/mmfile/Strategy$Builder;)Lcom/mm/mmfile/core/FileWriteConfig;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/mm/mmfile/Strategy;->fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/mm/mmfile/Strategy$Builder;->access$200(Lcom/mm/mmfile/Strategy$Builder;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/mm/mmfile/Strategy;->businesses:[Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/Strategy$Builder;Lcom/mm/mmfile/Strategy$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/mm/mmfile/Strategy;-><init>(Lcom/mm/mmfile/Strategy$Builder;)V

    return-void
.end method


# virtual methods
.method public getBusinesses()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy;->businesses:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy;->fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 2
    .line 3
    return-object p0
.end method
