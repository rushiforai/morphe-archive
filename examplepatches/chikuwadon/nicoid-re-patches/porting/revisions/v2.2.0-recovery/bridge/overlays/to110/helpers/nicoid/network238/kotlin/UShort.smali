.class public abstract Lnicoid/network238/kotlin/UShort;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/UShort$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/UShort$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/UShort$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/UShort$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/UShort;->Companion:Lnicoid/network238/kotlin/UShort$Companion;

    return-void
.end method

.method public static constructor-impl(S)S
    .registers 1

    return p0
.end method
