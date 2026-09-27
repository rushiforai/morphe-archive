.class public final synthetic Lkotlin/time/ComparableTimeMark$-CC;
.super Ljava/lang/Object;
.source "TimeSource.kt"


# direct methods
.method public static bridge synthetic $default$compareTo(Lkotlin/time/ComparableTimeMark;Ljava/lang/Object;)I
    .registers 2
    .param p0, "_this"    # Lkotlin/time/ComparableTimeMark;

    .line 200
    check-cast p1, Lkotlin/time/ComparableTimeMark;

    invoke-interface {p0, p1}, Lkotlin/time/ComparableTimeMark;->compareTo(Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic $default$minus-LRDsOJo(Lkotlin/time/ComparableTimeMark;J)Lkotlin/time/TimeMark;
    .registers 3
    .param p0, "_this"    # Lkotlin/time/ComparableTimeMark;

    .line 200
    invoke-interface {p0, p1, p2}, Lkotlin/time/ComparableTimeMark;->minus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method

.method public static bridge synthetic $default$plus-LRDsOJo(Lkotlin/time/ComparableTimeMark;J)Lkotlin/time/TimeMark;
    .registers 3
    .param p0, "_this"    # Lkotlin/time/ComparableTimeMark;

    .line 200
    invoke-interface {p0, p1, p2}, Lkotlin/time/ComparableTimeMark;->plus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method
