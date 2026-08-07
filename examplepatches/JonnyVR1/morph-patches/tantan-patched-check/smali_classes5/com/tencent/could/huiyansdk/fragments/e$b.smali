.class public Lcom/tencent/could/huiyansdk/fragments/e$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/fragments/e;->onPreviewSucceed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/e;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnCheck()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 53
    .line 54
    const/16 v0, 0x8

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e$b;->a:Lcom/tencent/could/huiyansdk/fragments/e;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
