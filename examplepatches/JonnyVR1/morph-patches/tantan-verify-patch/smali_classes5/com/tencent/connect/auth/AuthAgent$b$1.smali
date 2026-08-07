.class Lcom/tencent/connect/auth/AuthAgent$b$1;
.super Lcom/tencent/connect/auth/AuthAgent$b$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/connect/auth/AuthAgent$b;->a(Ljava/lang/String;Lcom/tencent/tauth/IUiListener;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/tauth/IUiListener;

.field final synthetic b:Ljava/lang/Object;

.field final synthetic c:Lcom/tencent/connect/auth/AuthAgent$b;


# direct methods
.method public constructor <init>(Lcom/tencent/connect/auth/AuthAgent$b;Landroid/app/Dialog;Lcom/tencent/tauth/IUiListener;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->c:Lcom/tencent/connect/auth/AuthAgent$b;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->a:Lcom/tencent/tauth/IUiListener;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/tencent/connect/auth/AuthAgent$b$a;-><init>(Lcom/tencent/connect/auth/AuthAgent$b;Landroid/app/Dialog;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->c:Lcom/tencent/connect/auth/AuthAgent$b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tencent/connect/auth/AuthAgent$b;->a()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/connect/auth/AuthAgent$b$a;->d:Landroid/app/Dialog;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/tencent/connect/auth/AuthAgent$b$a;->d:Landroid/app/Dialog;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->a:Lcom/tencent/tauth/IUiListener;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/connect/auth/AuthAgent$b$1;->b:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-interface {p1, p0}, Lcom/tencent/tauth/IUiListener;->onComplete(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
