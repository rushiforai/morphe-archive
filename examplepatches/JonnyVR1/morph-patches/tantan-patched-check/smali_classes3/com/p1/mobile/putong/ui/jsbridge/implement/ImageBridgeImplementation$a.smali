.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->B(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->a:Ll/bqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->b(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public call()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->a:Ll/bqq;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v4, Ll/khm;

    .line 10
    .line 11
    invoke-direct {v4, p0, v1, v3}, Ll/khm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;Ll/bqq;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->y(Ll/bqq;Ljava/lang/String;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
