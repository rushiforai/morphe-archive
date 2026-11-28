.class final Lnicoid/network238/kotlin/sequences/EmptySequence;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;
.implements Lnicoid/network238/kotlin/sequences/DropTakeSequence;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/sequences/EmptySequence;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/sequences/EmptySequence;

    invoke-direct {v0}, Lnicoid/network238/kotlin/sequences/EmptySequence;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/sequences/EmptySequence;->INSTANCE:Lnicoid/network238/kotlin/sequences/EmptySequence;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public drop(I)Lnicoid/network238/kotlin/sequences/EmptySequence;
    .registers 2

    .line 46
    sget-object p1, Lnicoid/network238/kotlin/sequences/EmptySequence;->INSTANCE:Lnicoid/network238/kotlin/sequences/EmptySequence;

    return-object p1
.end method

.method public bridge synthetic drop(I)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 2

    .line 44
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/sequences/EmptySequence;->drop(I)Lnicoid/network238/kotlin/sequences/EmptySequence;

    move-result-object p1

    return-object p1
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 45
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptyIterator;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptyIterator;

    return-object v0
.end method
