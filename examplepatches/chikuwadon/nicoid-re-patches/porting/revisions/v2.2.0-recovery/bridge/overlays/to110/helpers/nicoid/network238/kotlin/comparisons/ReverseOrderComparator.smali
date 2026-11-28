.class final Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;

    invoke-direct {v0}, Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;->INSTANCE:Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    invoke-interface {p2, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 323
    check-cast p1, Ljava/lang/Comparable;

    check-cast p2, Ljava/lang/Comparable;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/kotlin/comparisons/ReverseOrderComparator;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p1

    return p1
.end method

.method public final reversed()Ljava/util/Comparator;
    .registers 2

    .line 326
    sget-object v0, Lnicoid/network238/kotlin/comparisons/NaturalOrderComparator;->INSTANCE:Lnicoid/network238/kotlin/comparisons/NaturalOrderComparator;

    return-object v0
.end method
