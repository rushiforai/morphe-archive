.class public Ll/h0e;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a([Lcom/idv/identity/platform/config/DeviceSetting;)Lcom/idv/identity/platform/config/DeviceSetting;
    .locals 5

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    array-length v1, p0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_1

    .line 12
    .line 13
    aget-object v3, p0, v2

    .line 14
    .line 15
    invoke-virtual {v3}, Lcom/idv/identity/platform/config/DeviceSetting;->getMinApiLevel()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-lt v0, v4, :cond_0

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/idv/identity/platform/config/DeviceSetting;->getMaxApiLevel()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-gt v0, v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v3, 0x0

    .line 32
    :goto_1
    if-nez v3, :cond_2

    .line 33
    .line 34
    new-instance p0, Lcom/idv/identity/platform/config/DeviceSetting;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/idv/identity/platform/config/DeviceSetting;-><init>()V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    return-object v3
.end method
