.class public Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;
.super Ll/pow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->buyFreeTrial(Ll/aqq;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic e:Ljava/lang/StringBuilder;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Landroid/webkit/WebView;

.field public final synthetic h:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/webkit/WebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->h:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->e:Ljava/lang/StringBuilder;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->f:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p6, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->g:Landroid/webkit/WebView;

    .line 8
    .line 9
    invoke-direct {p0, p2, p3}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic A()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->G4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Vs:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->e:Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "javascript:"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "(\'"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "-1"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, "\')"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->h:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->g:Landroid/webkit/WebView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->e:Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->P1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pow;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/pow;->c()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 5
    .line 6
    new-instance v1, Ll/j87;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/j87;-><init>()V

    .line 9
    .line 10
    .line 11
    const-wide/16 v2, 0xc8

    .line 12
    .line 13
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->e:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "javascript:"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->f:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, "(\'"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "0"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, "\')"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->h:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->g:Landroid/webkit/WebView;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$e;->e:Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->P1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->g0:Z

    .line 62
    .line 63
    return-void
.end method
