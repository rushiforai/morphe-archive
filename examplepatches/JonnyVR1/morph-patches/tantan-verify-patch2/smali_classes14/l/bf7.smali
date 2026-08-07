.class public final synthetic Ll/bf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/School;

    check-cast p2, Lcom/p1/mobile/putong/core/data/School;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/api/d$a;->C(Lcom/p1/mobile/putong/core/data/School;Lcom/p1/mobile/putong/core/data/School;)I

    move-result p0

    return p0
.end method
