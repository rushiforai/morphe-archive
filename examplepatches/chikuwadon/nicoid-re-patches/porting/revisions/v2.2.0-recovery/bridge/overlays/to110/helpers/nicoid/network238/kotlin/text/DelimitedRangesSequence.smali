.class final Lnicoid/network238/kotlin/text/DelimitedRangesSequence;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# instance fields
.field private final getNextMatch:Lnicoid/network238/kotlin/jvm/functions/Function2;

.field private final input:Ljava/lang/CharSequence;

.field private final limit:I

.field private final startIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;IILnicoid/network238/kotlin/jvm/functions/Function2;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1203
    iput-object p1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;

    .line 1204
    iput p2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->startIndex:I

    .line 1205
    iput p3, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->limit:I

    .line 1206
    iput-object p4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->getNextMatch:Lnicoid/network238/kotlin/jvm/functions/Function2;

    return-void
.end method

.method public static final synthetic access$getGetNextMatch$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Lnicoid/network238/kotlin/jvm/functions/Function2;
    .registers 1

    .line 1202
    iget-object p0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->getNextMatch:Lnicoid/network238/kotlin/jvm/functions/Function2;

    return-object p0
.end method

.method public static final synthetic access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;
    .registers 1

    .line 1202
    iget-object p0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static final synthetic access$getLimit$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)I
    .registers 1

    .line 1202
    iget p0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->limit:I

    return p0
.end method

.method public static final synthetic access$getStartIndex$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)I
    .registers 1

    .line 1202
    iget p0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->startIndex:I

    return p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 1209
    new-instance v0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;-><init>(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)V

    return-object v0
.end method
