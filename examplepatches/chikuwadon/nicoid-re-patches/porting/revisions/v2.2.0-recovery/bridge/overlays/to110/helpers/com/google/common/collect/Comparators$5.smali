.class public final synthetic Lcom/google/common/collect/Comparators$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Ljava/util/Optional;

    invoke-static {p1}, Lcom/google/common/collect/Comparators;->lambda$emptiesLast$0(Ljava/util/Optional;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
