.class public Lcom/p1/mobile/share_sdk/content/PicContent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/share_sdk/content/Content;


# instance fields
.field private file:Ljava/io/File;

.field private largeBmpPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/share_sdk/content/PicContent;-><init>(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/share_sdk/content/PicContent;->largeBmpPath:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/share_sdk/content/PicContent;->file:Ljava/io/File;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getFile()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/share_sdk/content/PicContent;->file:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLargeBmpPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/share_sdk/content/PicContent;->largeBmpPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSummary()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getThumbBmpPath()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getType()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public getURL()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
