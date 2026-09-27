.class final Lapp/yydarlinker/deepseekcaptions/ContextualUnitCorePolicy;
.super Ljava/lang/Object;
.source "ContextualUnitCorePolicy.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static shouldPassThroughUnresolvedActivation(ZZLjava/lang/String;Ljava/lang/String;)Z
    .registers 4

    if-eqz p0, :cond_1e

    if-eqz p1, :cond_1e

    if-eqz p2, :cond_10

    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_10
    if-eqz p3, :cond_1c

    .line 10
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method
