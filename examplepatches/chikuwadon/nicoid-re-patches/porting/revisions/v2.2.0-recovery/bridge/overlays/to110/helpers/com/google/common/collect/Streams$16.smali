.class public final synthetic Lcom/google/common/collect/Streams$16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiFunction;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    new-instance p0, Lcom/google/common/collect/Streams$TemporaryPair;

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/Streams$TemporaryPair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method
