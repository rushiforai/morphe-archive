.class public final synthetic Ll/khm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;Ll/bqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/khm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;

    iput-object p2, p0, Ll/khm;->b:Ll/bqq;

    iput-object p3, p0, Ll/khm;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/khm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;

    iget-object v1, p0, Ll/khm;->b:Ll/bqq;

    iget-object p0, p0, Ll/khm;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->a(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
