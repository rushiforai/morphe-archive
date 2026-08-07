.class public final synthetic Ll/u37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u37;->a:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u37;->a:Ljava/util/Map;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->E0(Ljava/util/Map;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
