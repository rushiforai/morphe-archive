.class public final synthetic Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;"
    method = "iterator$lambda$0"
    proto = "(Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;I)Lnicoid/network238/kotlin/text/MatchGroup;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1$0;->f$0:Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1$0;->f$0:Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->iterator$lambda$0(Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;I)Lnicoid/network238/kotlin/text/MatchGroup;

    move-result-object p1

    return-object p1
.end method
