.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FolderConfig"
.end annotation


# instance fields
.field private folder:Ljava/lang/String;

.field private objects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->folder:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->objects:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->folder:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getObjects()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->objects:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method
