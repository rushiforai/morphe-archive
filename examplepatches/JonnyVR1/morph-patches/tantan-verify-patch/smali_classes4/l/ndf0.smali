.class public Ll/ndf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

.field public b:Lcom/p1/mobile/putong/core/data/Privilege;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/data/PayMethod;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/mdf0;
    .locals 4

    .line 1
    new-instance v0, Ll/mdf0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ndf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ndf0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    iget-boolean v3, p0, Ll/ndf0;->c:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/ndf0;->d:Lcom/p1/mobile/putong/data/PayMethod;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Ll/mdf0;-><init>(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ZLcom/p1/mobile/putong/data/PayMethod;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/ndf0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ndf0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ll/ndf0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ndf0;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/data/PayMethod;)Ll/ndf0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ndf0;->d:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Ll/ndf0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ndf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    return-object p0
.end method
