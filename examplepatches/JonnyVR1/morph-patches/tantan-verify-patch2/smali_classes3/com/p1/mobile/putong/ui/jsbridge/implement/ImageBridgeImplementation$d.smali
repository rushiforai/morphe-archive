.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->saveBase64ImageData(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->c:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->a:Ll/aqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->c:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->a:Ll/aqq;

    .line 4
    .line 5
    const-string v1, "refuse"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;->a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
