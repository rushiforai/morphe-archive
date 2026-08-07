.class public final Lcom/mm/mmfile/Strategy$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/Strategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private businesses:[Ljava/lang/String;

.field private fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

.field private fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Lcom/mm/mmfile/Strategy$Builder;)Lcom/mm/mmfile/FileUploadConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy$Builder;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/mm/mmfile/Strategy$Builder;)Lcom/mm/mmfile/core/FileWriteConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy$Builder;->fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/mm/mmfile/Strategy$Builder;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/Strategy$Builder;->businesses:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public build()Lcom/mm/mmfile/Strategy;
    .locals 2

    .line 1
    new-instance v0, Lcom/mm/mmfile/Strategy;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/mm/mmfile/Strategy;-><init>(Lcom/mm/mmfile/Strategy$Builder;Lcom/mm/mmfile/Strategy$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public varargs businesses([Ljava/lang/String;)Lcom/mm/mmfile/Strategy$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/Strategy$Builder;->businesses:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public fileUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/Strategy$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/Strategy$Builder;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public fileWriteConfig(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/Strategy$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/Strategy$Builder;->fileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 2
    .line 3
    return-object p0
.end method
