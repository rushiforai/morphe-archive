.class public final synthetic Ll/r67;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/bqq;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ljava/lang/String;Ll/bqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r67;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/r67;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/r67;->c:Ll/bqq;

    iput-object p4, p0, Ll/r67;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/r67;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/r67;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/r67;->c:Ll/bqq;

    iget-object v3, p0, Ll/r67;->d:Ljava/lang/String;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    move-object v5, p2

    check-cast v5, Ljava/lang/String;

    move-object v6, p3

    check-cast v6, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->Q(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ljava/lang/String;Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
