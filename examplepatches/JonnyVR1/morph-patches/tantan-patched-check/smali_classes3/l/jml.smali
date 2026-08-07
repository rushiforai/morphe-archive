.class public final synthetic Ll/jml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jml;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    iput-object p2, p0, Ll/jml;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jml;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/jml;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/jml;->e:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jml;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    iget-object v1, p0, Ll/jml;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/jml;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/jml;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/jml;->e:Ll/aqq;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;->d(Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
