.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildSource$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToLongFunction;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final applyAsLong(Ljava/lang/Object;)J
    .registers 2

    .line 0
    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->lambda$read$0(Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;)J

    move-result-wide p0

    return-wide p0
.end method
