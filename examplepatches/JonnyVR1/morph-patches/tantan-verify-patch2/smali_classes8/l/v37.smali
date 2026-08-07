.class public final synthetic Ll/v37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v37;->a:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v37;->a:Ljava/util/Map;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->L0(Ljava/util/Map;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroup;)I

    move-result p0

    return p0
.end method
