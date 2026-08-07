.class public abstract Lorg/junit/runner/manipulation/Filter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ALL:Lorg/junit/runner/manipulation/Filter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/manipulation/Filter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/runner/manipulation/Filter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/junit/runner/manipulation/Filter;->ALL:Lorg/junit/runner/manipulation/Filter;

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

.method public static matchMethodDescription(Lorg/junit/runner/Description;)Lorg/junit/runner/manipulation/Filter;
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/manipulation/Filter$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/junit/runner/manipulation/Filter$2;-><init>(Lorg/junit/runner/Description;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lorg/junit/runner/manipulation/Filterable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p1, Lorg/junit/runner/manipulation/Filterable;

    .line 7
    .line 8
    invoke-interface {p1, p0}, Lorg/junit/runner/manipulation/Filterable;->filter(Lorg/junit/runner/manipulation/Filter;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public abstract describe()Ljava/lang/String;
.end method

.method public intersect(Lorg/junit/runner/manipulation/Filter;)Lorg/junit/runner/manipulation/Filter;
    .locals 1

    .line 1
    if-eq p1, p0, :cond_1

    .line 2
    .line 3
    sget-object v0, Lorg/junit/runner/manipulation/Filter;->ALL:Lorg/junit/runner/manipulation/Filter;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Lorg/junit/runner/manipulation/Filter$3;

    .line 9
    .line 10
    invoke-direct {v0, p0, p0, p1}, Lorg/junit/runner/manipulation/Filter$3;-><init>(Lorg/junit/runner/manipulation/Filter;Lorg/junit/runner/manipulation/Filter;Lorg/junit/runner/manipulation/Filter;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :goto_0
    return-object p0
.end method

.method public abstract shouldRun(Lorg/junit/runner/Description;)Z
.end method
