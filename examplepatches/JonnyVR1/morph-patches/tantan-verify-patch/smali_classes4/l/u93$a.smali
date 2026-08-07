.class public Ll/u93$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/a$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u93;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public final synthetic b:Ll/u93;


# direct methods
.method public constructor <init>(Ll/u93;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u93$a;->b:Ll/u93;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/u93$a;->release()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/u93$a;->b:Ll/u93;

    .line 19
    .line 20
    iget-object v1, v1, Ll/n63;->b:Ll/sa3;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ll/sa3;->j(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/u93$a;->a:Landroid/view/View;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u93$a;->b:Ll/u93;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n63;->b:Ll/sa3;

    .line 4
    .line 5
    iget-object p0, p0, Ll/u93$a;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/sa3;->e(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
