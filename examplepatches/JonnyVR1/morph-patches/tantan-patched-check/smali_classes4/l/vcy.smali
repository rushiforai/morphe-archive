.class public final synthetic Ll/vcy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/common/base/Optional;

    check-cast p2, Lcom/google/common/base/Optional;

    invoke-static {p1, p2}, Ll/idy;->i0(Lcom/google/common/base/Optional;Lcom/google/common/base/Optional;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
