.class final Lnicoid/network238/kotlin/sequences/GeneratorSequence;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# instance fields
.field private final getInitialValue:Lnicoid/network238/kotlin/jvm/functions/Function0;

.field private final getNextValue:Lnicoid/network238/kotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Lnicoid/network238/kotlin/jvm/functions/Function1;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 603
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getInitialValue:Lnicoid/network238/kotlin/jvm/functions/Function0;

    iput-object p2, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getNextValue:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-void
.end method

.method public static final synthetic access$getGetInitialValue$p(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)Lnicoid/network238/kotlin/jvm/functions/Function0;
    .registers 1

    .line 603
    iget-object p0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getInitialValue:Lnicoid/network238/kotlin/jvm/functions/Function0;

    return-object p0
.end method

.method public static final synthetic access$getGetNextValue$p(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)Lnicoid/network238/kotlin/jvm/functions/Function1;
    .registers 1

    .line 603
    iget-object p0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getNextValue:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-object p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 604
    new-instance v0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;-><init>(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)V

    return-object v0
.end method
