.class public Ll/r1j;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Ll/td1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/td1;

    .line 3
    .line 4
    sput-object v0, Ll/r1j;->a:[Ll/td1;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a([Lcom/immomo/mediacore/audio/AudioVolumeWeight;)[Ll/td1;
    .locals 4

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    new-array v0, v0, [Ll/td1;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, p0

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/td1;

    .line 11
    .line 12
    aget-object v3, p0, v1

    .line 13
    .line 14
    invoke-direct {v2, v3}, Ll/td1;-><init>(Lcom/immomo/mediacore/audio/AudioVolumeWeight;)V

    .line 15
    .line 16
    .line 17
    aput-object v2, v0, v1

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-object v0

    .line 23
    :cond_1
    sget-object p0, Ll/r1j;->a:[Ll/td1;

    .line 24
    .line 25
    return-object p0
.end method

.method public static b(Ll/cgu;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cgu;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cgu;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/cgu;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/cgu;->c:Ljava/lang/String;

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    invoke-static {p0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 18
    .line 19
    invoke-static {p0}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    const/4 v7, 0x0

    .line 24
    invoke-direct/range {v0 .. v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
