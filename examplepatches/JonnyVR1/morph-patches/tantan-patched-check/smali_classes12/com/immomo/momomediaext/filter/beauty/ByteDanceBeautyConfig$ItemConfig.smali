.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ItemConfig"
.end annotation


# instance fields
.field private id:Ljava/lang/String;

.field private key:Ljava/lang/String;

.field private key1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->key:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->key1:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->id:Ljava/lang/String;

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

.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->key:Ljava/lang/String;

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

.method public getKey1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->key1:Ljava/lang/String;

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
