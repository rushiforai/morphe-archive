.class public final synthetic Ll/h47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic c:Ll/hqq;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/facertification/RxFacertification$b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/putong/app/PutongAct;Ll/hqq;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/h47;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p3, p0, Ll/h47;->c:Ll/hqq;

    iput-object p4, p0, Ll/h47;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/h47;->e:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/h47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/h47;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object v2, p0, Ll/h47;->c:Ll/hqq;

    iget-object v3, p0, Ll/h47;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/h47;->e:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->e1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/putong/app/PutongAct;Ll/hqq;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/Throwable;)V

    return-void
.end method
