.class public final synthetic Lcom/google/common/eventbus/SubscriberRegistry$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


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
    check-cast p1, Ljava/lang/Class;

    invoke-static {p1}, Lcom/google/common/eventbus/SubscriberRegistry;->$r8$lambda$M8lZzkPTyzsQ5_fAswrRAg5kTrw(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method
