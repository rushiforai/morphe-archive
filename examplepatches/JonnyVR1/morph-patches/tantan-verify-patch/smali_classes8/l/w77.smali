.class public final synthetic Ll/w77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w77;->a:Ljava/util/Map;

    iput-object p2, p0, Ll/w77;->b:Ll/aqq;

    iput-object p3, p0, Ll/w77;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w77;->a:Ljava/util/Map;

    iget-object v1, p0, Ll/w77;->b:Ll/aqq;

    iget-object p0, p0, Ll/w77;->c:Ljava/lang/String;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->x(Ljava/util/Map;Ll/aqq;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method
