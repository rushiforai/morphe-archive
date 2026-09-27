.class public interface abstract Lkotlin/time/Clock;
.super Ljava/lang/Object;
.source "Clock.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/Clock$Companion;,
        Lkotlin/time/Clock$System;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008g\u0018\u0000 \u00052\u00020\u0001:\u0002\u0004\u0005J\n\u0010\u0002\u001a\u00020\u0003H\u00a6\u0080\u0004\u00ca\u0001\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00ca\u0001\u0010\u0008\n\u0012\u000c\u0008\u000b\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u000c\u00a8\u0006\u0006"
    }
    d2 = {
        "Lkotlin/time/Clock;",
        "",
        "now",
        "Lkotlin/time/Instant;",
        "System",
        "Companion",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.3",
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


# static fields
.field public static final Companion:Lkotlin/time/Clock$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lkotlin/time/Clock$Companion;->$$INSTANCE:Lkotlin/time/Clock$Companion;

    sput-object v0, Lkotlin/time/Clock;->Companion:Lkotlin/time/Clock$Companion;

    return-void
.end method


# virtual methods
.method public abstract now()Lkotlin/time/Instant;
.end method
