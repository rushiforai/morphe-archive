.class public final synthetic Ll/d3s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d3s;->a:Ll/aqq;

    iput-object p2, p0, Ll/d3s;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/d3s;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3s;->a:Ll/aqq;

    iget-object v1, p0, Ll/d3s;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/d3s;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/camera/upload/b$b;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveCameraBridgeImplementation;->d(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/camera/upload/b$b;)V

    return-void
.end method
