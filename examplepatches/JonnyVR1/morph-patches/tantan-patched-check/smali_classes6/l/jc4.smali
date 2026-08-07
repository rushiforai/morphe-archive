.class public final synthetic Ll/jc4;
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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CameraFilter;

    check-cast p2, Lcom/p1/mobile/putong/feed/data/CameraFilter;

    invoke-static {p1, p2}, Ll/oc4;->c(Lcom/p1/mobile/putong/feed/data/CameraFilter;Lcom/p1/mobile/putong/feed/data/CameraFilter;)I

    move-result p0

    return p0
.end method
