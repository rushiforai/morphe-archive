.class public Lcn/qqtheme/framework/wheelview/ItemsRange;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private count:I

.field private first:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0, v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcn/qqtheme/framework/wheelview/ItemsRange;->first:I

    .line 5
    .line 6
    iput p2, p0, Lcn/qqtheme/framework/wheelview/ItemsRange;->count:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contains(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-gt p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/ItemsRange;->count:I

    .line 2
    .line 3
    return p0
.end method

.method public getFirst()I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/ItemsRange;->first:I

    .line 2
    .line 3
    return p0
.end method

.method public getLast()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    return v0
.end method
