.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->bindZhimaAuth(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/bb50<",
        "Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->a:Ll/aqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0x190

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    const/16 v1, 0x1f4

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->a:Ll/aqq;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/aqq;->d()Ll/hqq;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 22
    .line 23
    iget p1, p1, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p1}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {v0, p0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->a:Ll/aqq;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->data:Lcom/p1/mobile/putong/data/AlipayAuthData;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AlipayAuthData;->alipayCertificationRequest:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->c:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0, v1, p1, v2, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->n(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onCompleted()V
    .locals 0

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->a:Ll/aqq;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {v0, p0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {v1}, Ll/aqq;->d()Ll/hqq;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->b:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "1000000"

    .line 36
    .line 37
    filled-new-array {v0}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;->a(Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
