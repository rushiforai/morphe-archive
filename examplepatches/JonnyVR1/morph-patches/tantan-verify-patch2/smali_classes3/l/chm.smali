.class public final synthetic Ll/chm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/chm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    iput-object p2, p0, Ll/chm;->b:Ll/aqq;

    iput-object p3, p0, Ll/chm;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/chm;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/chm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    iget-object v1, p0, Ll/chm;->b:Ll/aqq;

    iget-object v2, p0, Ll/chm;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/chm;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->r(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
