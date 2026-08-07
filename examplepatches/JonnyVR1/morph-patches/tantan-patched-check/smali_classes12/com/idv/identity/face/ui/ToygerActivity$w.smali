.class Lcom/idv/identity/face/ui/ToygerActivity$w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wrb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->i2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {v2}, Lcom/idv/identity/face/ui/ToygerActivity;->T0(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/os/Handler;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$w$b;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/ToygerActivity$w$b;-><init>(Lcom/idv/identity/face/ui/ToygerActivity$w;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {v2}, Lcom/idv/identity/face/ui/ToygerActivity;->B1()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/wdj0;->D()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->W0(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->X0(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 50
    .line 51
    sget v2, Lcom/idv/identity/base/R$string;->I:I

    .line 52
    .line 53
    sget v3, Lcom/idv/identity/base/R$string;->B:I

    .line 54
    .line 55
    sget v4, Lcom/idv/identity/base/R$string;->u:I

    .line 56
    .line 57
    new-instance v7, Lcom/idv/identity/face/ui/ToygerActivity$w$c;

    .line 58
    .line 59
    invoke-direct {v7, p0}, Lcom/idv/identity/face/ui/ToygerActivity$w$c;-><init>(Lcom/idv/identity/face/ui/ToygerActivity$w;)V

    .line 60
    .line 61
    .line 62
    const/4 v5, -0x1

    .line 63
    const-string v6, "CODE_OVER_TIME"

    .line 64
    .line 65
    invoke-virtual/range {v1 .. v7}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->T0(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/os/Handler;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$w$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity$w$a;-><init>(Lcom/idv/identity/face/ui/ToygerActivity$w;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 26
    .line 27
    iget p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->a:I

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Lcom/idv/identity/face/ui/ToygerActivity;->V0(Lcom/idv/identity/face/ui/ToygerActivity;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
