.class public Ll/ewi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public d:I


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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static b(Ll/v2i0;)Ll/ewi;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/data/Media;",
            ">(",
            "Ll/v2i0<",
            "Ljava/io/File;",
            "TT;>;)",
            "Ll/ewi;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ewi;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ewi;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/v2i0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/v2i0;->a:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Ljava/io/File;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Ll/ewi;->a:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Ll/v2i0;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Ljava/io/File;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Ll/ewi;->b:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v1, "Unkown"

    .line 36
    .line 37
    iput-object v1, v0, Ll/ewi;->a:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, ""

    .line 40
    .line 41
    iput-object v1, v0, Ll/ewi;->b:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v1, Ljava/lang/Exception;

    .line 44
    .line 45
    const-string v2, "MediaPickerBaseAct: can not find parent foler!!"

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    new-instance v1, Ll/vg60;

    .line 54
    .line 55
    iget-object v2, p0, Ll/v2i0;->b:Ljava/util/Collection;

    .line 56
    .line 57
    new-instance v3, Ll/dwi;

    .line 58
    .line 59
    invoke-direct {v3}, Ll/dwi;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-direct {v1, v2, v3}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, v0, Ll/ewi;->c:Ll/vg60;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/v2i0;->a()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    iput p0, v0, Ll/ewi;->d:I

    .line 77
    .line 78
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    :try_start_0
    move-object v1, p1

    .line 6
    check-cast v1, Ll/ewi;

    .line 7
    .line 8
    iget-object v2, p0, Ll/ewi;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, v1, Ll/ewi;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return p0

    .line 17
    :catch_0
    move-exception v1

    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    if-eq p0, p1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v0, 0x1

    .line 25
    :goto_0
    return v0
.end method
