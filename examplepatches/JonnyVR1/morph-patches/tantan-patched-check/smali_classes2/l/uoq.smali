.class public final Ll/uoq;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001f\u0010\u000e\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0013\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u000b\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/uoq;",
        "",
        "<init>",
        "()V",
        "",
        "orientation",
        "a",
        "(I)I",
        "Ljava/io/InputStream;",
        "inputStream",
        "b",
        "(Ljava/io/InputStream;)I",
        "markerToFind",
        "",
        "e",
        "(Ljava/io/InputStream;I)Z",
        "marker",
        "c",
        "(I)Z",
        "d",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/uoq;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/uoq;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uoq;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/uoq;->INSTANCE:Ll/uoq;

    .line 7
    .line 8
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

.method public static final a(I)I
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ozi0;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final b(Ljava/io/InputStream;)I
    .locals 2
    .param p0    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    sget-object v1, Ll/uoq;->INSTANCE:Ll/uoq;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Ll/uoq;->d(Ljava/io/InputStream;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    invoke-static {p0, v1}, Ll/ozi0;->d(Ljava/io/InputStream;I)I

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return p0

    .line 19
    :catch_0
    return v0
.end method

.method public static final e(Ljava/io/InputStream;I)Z
    .locals 4
    .param p0    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p0, v0, v1}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/16 v3, 0xff

    .line 11
    .line 12
    if-ne v2, v3, :cond_4

    .line 13
    .line 14
    move v2, v3

    .line 15
    :goto_1
    if-ne v2, v3, :cond_1

    .line 16
    .line 17
    invoke-static {p0, v0, v1}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const/16 v3, 0xc0

    .line 23
    .line 24
    if-ne p1, v3, :cond_2

    .line 25
    .line 26
    sget-object v3, Ll/uoq;->INSTANCE:Ll/uoq;

    .line 27
    .line 28
    invoke-virtual {v3, v2}, Ll/uoq;->c(I)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    return v0

    .line 35
    :cond_2
    if-ne v2, p1, :cond_3

    .line 36
    .line 37
    return v0

    .line 38
    :cond_3
    if-eq v2, v0, :cond_0

    .line 39
    .line 40
    const/16 v0, 0xd8

    .line 41
    .line 42
    if-eq v2, v0, :cond_0

    .line 43
    .line 44
    const/16 v0, 0xd9

    .line 45
    .line 46
    if-eq v2, v0, :cond_4

    .line 47
    .line 48
    const/16 v0, 0xda

    .line 49
    .line 50
    if-eq v2, v0, :cond_4

    .line 51
    .line 52
    const/4 v0, 0x2

    .line 53
    invoke-static {p0, v0, v1}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    sub-int/2addr v1, v0

    .line 58
    int-to-long v0, v1

    .line 59
    invoke-virtual {p0, v0, v1}, Ljava/io/InputStream;->skip(J)J

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    return v1
.end method


# virtual methods
.method public final c(I)Z
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    :pswitch_0
    const/4 p0, 0x0

    .line 5
    return p0

    .line 6
    :pswitch_1
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    nop

    .line 9
    :pswitch_data_0
    .packed-switch 0xc0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public final d(Ljava/io/InputStream;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0xe1

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/uoq;->e(Ljava/io/InputStream;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    invoke-static {p1, p0, v0}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v2, v1, -0x2

    .line 16
    .line 17
    const/4 v3, 0x6

    .line 18
    if-le v2, v3, :cond_0

    .line 19
    .line 20
    const/4 v2, 0x4

    .line 21
    invoke-static {p1, v2, v0}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {p1, p0, v0}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    add-int/lit8 v1, v1, -0x8

    .line 30
    .line 31
    const p1, 0x45786966

    .line 32
    .line 33
    .line 34
    if-ne v2, p1, :cond_0

    .line 35
    .line 36
    if-nez p0, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    return v0
.end method
