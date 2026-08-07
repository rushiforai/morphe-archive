.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;,
        Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;,
        Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;
    }
.end annotation


# instance fields
.field private beauty:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

.field private body:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

.field private makeup:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

.field private makeupStyle:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "makeup_style"
    .end annotation
.end field

.field private reshape:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;


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


# virtual methods
.method public getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->beauty:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBody()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->body:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->makeup:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->makeupStyle:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->reshape:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 2
    .line 3
    return-object p0
.end method
