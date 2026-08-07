.class public final enum Lorg/junit/runners/MethodSorters;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/junit/runners/MethodSorters;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/junit/runners/MethodSorters;

.field public static final enum DEFAULT:Lorg/junit/runners/MethodSorters;

.field public static final enum JVM:Lorg/junit/runners/MethodSorters;

.field public static final enum NAME_ASCENDING:Lorg/junit/runners/MethodSorters;


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/junit/runners/MethodSorters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    sget-object v2, Lorg/junit/internal/MethodSorter;->NAME_ASCENDING:Ljava/util/Comparator;

    .line 5
    .line 6
    const-string v3, "NAME_ASCENDING"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lorg/junit/runners/MethodSorters;-><init>(Ljava/lang/String;ILjava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/junit/runners/MethodSorters;->NAME_ASCENDING:Lorg/junit/runners/MethodSorters;

    .line 12
    .line 13
    new-instance v1, Lorg/junit/runners/MethodSorters;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    const-string v4, "JVM"

    .line 18
    .line 19
    invoke-direct {v1, v4, v2, v3}, Lorg/junit/runners/MethodSorters;-><init>(Ljava/lang/String;ILjava/util/Comparator;)V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lorg/junit/runners/MethodSorters;->JVM:Lorg/junit/runners/MethodSorters;

    .line 23
    .line 24
    new-instance v2, Lorg/junit/runners/MethodSorters;

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    sget-object v4, Lorg/junit/internal/MethodSorter;->DEFAULT:Ljava/util/Comparator;

    .line 28
    .line 29
    const-string v5, "DEFAULT"

    .line 30
    .line 31
    invoke-direct {v2, v5, v3, v4}, Lorg/junit/runners/MethodSorters;-><init>(Ljava/lang/String;ILjava/util/Comparator;)V

    .line 32
    .line 33
    .line 34
    sput-object v2, Lorg/junit/runners/MethodSorters;->DEFAULT:Lorg/junit/runners/MethodSorters;

    .line 35
    .line 36
    filled-new-array {v0, v1, v2}, [Lorg/junit/runners/MethodSorters;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Lorg/junit/runners/MethodSorters;->$VALUES:[Lorg/junit/runners/MethodSorters;

    .line 41
    .line 42
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "Ljava/lang/reflect/Method;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/junit/runners/MethodSorters;->comparator:Ljava/util/Comparator;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/junit/runners/MethodSorters;
    .locals 1

    .line 1
    const-class v0, Lorg/junit/runners/MethodSorters;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/junit/runners/MethodSorters;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final values()[Lorg/junit/runners/MethodSorters;
    .locals 1

    .line 1
    sget-object v0, Lorg/junit/runners/MethodSorters;->$VALUES:[Lorg/junit/runners/MethodSorters;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/junit/runners/MethodSorters;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/junit/runners/MethodSorters;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getComparator()Ljava/util/Comparator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/runners/MethodSorters;->comparator:Ljava/util/Comparator;

    .line 2
    .line 3
    return-object p0
.end method
