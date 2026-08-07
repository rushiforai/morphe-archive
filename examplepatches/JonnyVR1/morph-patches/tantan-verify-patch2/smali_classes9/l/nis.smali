.class public final synthetic Ll/nis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Ll/kpj;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    invoke-direct {p0, p1, p2}, Ll/kpj;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;)V

    return-object p0
.end method
