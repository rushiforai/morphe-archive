.class public final synthetic Ll/y77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/y77;->b:Ll/aqq;

    iput-object p3, p0, Ll/y77;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/y77;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/y77;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/y77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/y77;->b:Ll/aqq;

    iget-object v2, p0, Ll/y77;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/y77;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/y77;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->G0(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    return-void
.end method
