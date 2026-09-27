.class public final synthetic Lkotlin/time/TimeSource$WithComparableMarks$-CC;
.super Ljava/lang/Object;
.source "TimeSource.kt"


# direct methods
.method public static bridge synthetic $default$markNow(Lkotlin/time/TimeSource$WithComparableMarks;)Lkotlin/time/TimeMark;
    .registers 1
    .param p0, "_this"    # Lkotlin/time/TimeSource$WithComparableMarks;

    .line 36
    invoke-interface {p0}, Lkotlin/time/TimeSource$WithComparableMarks;->markNow()Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method
