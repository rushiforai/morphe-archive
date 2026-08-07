.class public Lorg/junit/runner/manipulation/Sorter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lorg/junit/runner/Description;",
        ">;"
    }
.end annotation


# static fields
.field public static final NULL:Lorg/junit/runner/manipulation/Sorter;


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/junit/runner/manipulation/Sorter;

    .line 2
    .line 3
    new-instance v1, Lorg/junit/runner/manipulation/Sorter$1;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/junit/runner/manipulation/Sorter$1;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lorg/junit/runner/manipulation/Sorter;-><init>(Ljava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/junit/runner/manipulation/Sorter;->NULL:Lorg/junit/runner/manipulation/Sorter;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "Lorg/junit/runner/Description;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/junit/runner/manipulation/Sorter;->comparator:Ljava/util/Comparator;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lorg/junit/runner/manipulation/Sortable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/junit/runner/manipulation/Sortable;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Lorg/junit/runner/manipulation/Sortable;->sort(Lorg/junit/runner/manipulation/Sorter;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lorg/junit/runner/Description;

    .line 2
    .line 3
    check-cast p2, Lorg/junit/runner/Description;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lorg/junit/runner/manipulation/Sorter;->compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I
    .locals 0

    .line 10
    iget-object p0, p0, Lorg/junit/runner/manipulation/Sorter;->comparator:Ljava/util/Comparator;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
