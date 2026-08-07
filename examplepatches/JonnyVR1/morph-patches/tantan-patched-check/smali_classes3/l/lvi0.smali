.class public final synthetic Ll/lvi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvi0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    iput-object p2, p0, Ll/lvi0;->b:Ll/bqq;

    iput-boolean p3, p0, Ll/lvi0;->c:Z

    iput-object p4, p0, Ll/lvi0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/lvi0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lvi0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    iget-object v1, p0, Ll/lvi0;->b:Ll/bqq;

    iget-boolean v2, p0, Ll/lvi0;->c:Z

    iget-object v3, p0, Ll/lvi0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/lvi0;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ljava/lang/Boolean;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->l(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
