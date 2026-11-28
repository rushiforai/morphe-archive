.class public abstract Lnicoid/network238/kotlin/ULong;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/ULong$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/ULong$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/ULong$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/ULong$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/ULong;->Companion:Lnicoid/network238/kotlin/ULong$Companion;

    return-void
.end method

.method public static constructor-impl(J)J
    .registers 2

    return-wide p0
.end method
