.class public interface abstract Lkotlin/time/TimeMark;
.super Ljava/lang/Object;
.source "TimeSource.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/TimeMark$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008g\u0018\u00002\u00020\u0001J\u0011\u0010\u0002\u001a\u00020\u0003H\u00a6\u0080\u0004\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0003H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0019\u0010\n\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0003H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\n\u0010\u000c\u001a\u00020\rH\u0096\u0080\u0004J\n\u0010\u000e\u001a\u00020\rH\u0096\u0080\u0004\u00ca\u0001\u000c\u0008\u0010\u0012\u0008\u0008\u0011\u0012\u0004\u0008\u0008(\u0012\u00ca\u0001\u0010\u0008\u0013\u0012\u000c\u0008\u0014\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0015\u00a8\u0006\u000f"
    }
    d2 = {
        "Lkotlin/time/TimeMark;",
        "",
        "elapsedNow",
        "Lkotlin/time/Duration;",
        "elapsedNow-UwyO8pc",
        "()J",
        "plus",
        "duration",
        "plus-LRDsOJo",
        "(J)Lkotlin/time/TimeMark;",
        "minus",
        "minus-LRDsOJo",
        "hasPassedNow",
        "",
        "hasNotPassedNow",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/time/ExperimentalTime;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract elapsedNow-UwyO8pc()J
.end method

.method public abstract hasNotPassedNow()Z
.end method

.method public abstract hasPassedNow()Z
.end method

.method public abstract minus-LRDsOJo(J)Lkotlin/time/TimeMark;
.end method

.method public abstract plus-LRDsOJo(J)Lkotlin/time/TimeMark;
.end method
