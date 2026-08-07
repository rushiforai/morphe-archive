.class public final synthetic Ll/wgm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wgm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    iput-object p2, p0, Ll/wgm;->b:Ll/aqq;

    iput-boolean p3, p0, Ll/wgm;->c:Z

    iput-object p4, p0, Ll/wgm;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wgm;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    iget-object v1, p0, Ll/wgm;->b:Ll/aqq;

    iget-boolean v2, p0, Ll/wgm;->c:Z

    iget-object p0, p0, Ll/wgm;->d:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->f(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
