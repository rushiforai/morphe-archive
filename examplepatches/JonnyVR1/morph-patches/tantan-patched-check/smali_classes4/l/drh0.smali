.class public Ll/drh0;
.super Ll/crh0;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static d:Ljava/lang/String;

.field private static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/drh0;->e:Ljava/util/List;

    .line 7
    .line 8
    const-string v0, "ro.mediatek.platform"

    .line 9
    .line 10
    filled-new-array {v0}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "android.os.SystemProperties"

    .line 15
    .line 16
    const-string v2, "get"

    .line 17
    .line 18
    invoke-static {v1, v2, v0}, Ll/bsh0;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    sput-object v0, Ll/drh0;->d:Ljava/lang/String;

    .line 25
    .line 26
    sget-object v0, Ll/drh0;->e:Ljava/util/List;

    .line 27
    .line 28
    const-string v19, "MT6570"

    .line 29
    .line 30
    const-string v20, "MT6761"

    .line 31
    .line 32
    const-string v1, "MT6571"

    .line 33
    .line 34
    const-string v2, "MT6595"

    .line 35
    .line 36
    const-string v3, "MT6795"

    .line 37
    .line 38
    const-string v4, "MT6572"

    .line 39
    .line 40
    const-string v5, "MT6752"

    .line 41
    .line 42
    const-string v6, "MT6582"

    .line 43
    .line 44
    const-string v7, "MT6735"

    .line 45
    .line 46
    const-string v8, "MT6592"

    .line 47
    .line 48
    const-string v9, "MT6753"

    .line 49
    .line 50
    const-string v10, "MT6589"

    .line 51
    .line 52
    const-string v11, "MT6755"

    .line 53
    .line 54
    const-string v12, "MT6735m"

    .line 55
    .line 56
    const-string v13, "MT6737T"

    .line 57
    .line 58
    const-string v14, "MT6580"

    .line 59
    .line 60
    const-string v15, "MT6750"

    .line 61
    .line 62
    const-string v16, "MT6750S"

    .line 63
    .line 64
    const-string v17, "MT6737"

    .line 65
    .line 66
    const-string v18, "MT6739"

    .line 67
    .line 68
    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/crh0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
