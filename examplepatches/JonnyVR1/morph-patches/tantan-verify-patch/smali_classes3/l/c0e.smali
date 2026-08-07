.class public final Ll/c0e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u0016\u0010\u0008\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Ll/c0e;",
        "",
        "<init>",
        "()V",
        "",
        "a",
        "()I",
        "I",
        "resultDeviceLevel",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/c0e;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static a:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c0e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c0e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c0e;->INSTANCE:Ll/c0e;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    sput v0, Ll/c0e;->a:I

    .line 10
    .line 11
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


# virtual methods
.method public final a()I
    .locals 4

    .line 1
    sget p0, Ll/c0e;->a:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    :try_start_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 8
    .line 9
    invoke-static {p0}, Ll/b0e;->k(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 17
    .line 18
    invoke-static {v2}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    move p0, v1

    .line 25
    :cond_1
    const/4 v2, 0x2

    .line 26
    if-eq p0, v0, :cond_2

    .line 27
    .line 28
    if-eq p0, v2, :cond_2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v3, 0x438

    .line 36
    .line 37
    if-lt p0, v3, :cond_3

    .line 38
    .line 39
    move p0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_3
    const/16 v2, 0x2d0

    .line 42
    .line 43
    if-lt p0, v2, :cond_4

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_4
    move p0, v1

    .line 48
    :goto_0
    if-ne p0, v0, :cond_5

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_5
    move v1, p0

    .line 52
    :goto_1
    sput v1, Ll/c0e;->a:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    :catch_0
    sget p0, Ll/c0e;->a:I

    .line 55
    .line 56
    return p0
.end method
