.class public final synthetic Ll/g47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic c:Z

.field public final synthetic d:Ll/hqq;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

.field public final synthetic h:Ll/kxf;

.field public final synthetic i:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/putong/app/PutongAct;ZLl/hqq;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/g47;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iput-boolean p3, p0, Ll/g47;->c:Z

    iput-object p4, p0, Ll/g47;->d:Ll/hqq;

    iput-object p5, p0, Ll/g47;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/g47;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/g47;->g:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    iput-object p8, p0, Ll/g47;->h:Ll/kxf;

    iput-object p9, p0, Ll/g47;->i:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p10, p0, Ll/g47;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/g47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/g47;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iget-boolean v2, p0, Ll/g47;->c:Z

    iget-object v3, p0, Ll/g47;->d:Ll/hqq;

    iget-object v4, p0, Ll/g47;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/g47;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/g47;->g:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    iget-object v7, p0, Ll/g47;->h:Ll/kxf;

    iget-object v8, p0, Ll/g47;->i:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object v9, p0, Ll/g47;->j:Ljava/lang/String;

    move-object v10, p1

    check-cast v10, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->X(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/putong/app/PutongAct;ZLl/hqq;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
