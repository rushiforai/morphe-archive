.class public abstract Lnicoid/network238/kotlin/time/ComparableTimeMark$DefaultImpls;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/time/ComparableTimeMark;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation


# direct methods
.method public static compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    invoke-interface {p0, p1}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->minus-UwyO8pc(Lnicoid/network238/kotlin/time/ComparableTimeMark;)J

    move-result-wide p0

    sget-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p0

    return p0
.end method
