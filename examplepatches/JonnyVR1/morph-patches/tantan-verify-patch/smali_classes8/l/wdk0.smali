.class public final synthetic Ll/wdk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/xc00;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iput-object p2, p0, Ll/wdk0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wdk0;->c:Ll/xc00;

    iput-object p4, p0, Ll/wdk0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/wdk0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wdk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iget-object v1, p0, Ll/wdk0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/wdk0;->c:Ll/xc00;

    iget-object v3, p0, Ll/wdk0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/wdk0;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ll/uxj0;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->w(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
