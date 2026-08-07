.class public Lcom/tencent/could/huiyansdk/view/c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/view/c;->b(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/view/c;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/view/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/c$b;->a:Lcom/tencent/could/huiyansdk/view/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v0, "OcrConfirmDialog"

    .line 4
    .line 5
    const-string v1, "confirmBtn selected!"

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {p1, v2, v0, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/c$b;->a:Lcom/tencent/could/huiyansdk/view/c;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v1, "txy_comoon_share_data"

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "overseas_pro_confirm"

    .line 32
    .line 33
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 38
    .line 39
    .line 40
    :goto_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/c$b;->a:Lcom/tencent/could/huiyansdk/view/c;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/c$b;->a:Lcom/tencent/could/huiyansdk/view/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/c;->a:Lcom/tencent/could/huiyansdk/view/c$d;

    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    check-cast p0, Lcom/tencent/could/huiyansdk/fragments/b$a;

    .line 52
    .line 53
    const-string v0, "AuthingFragment"

    .line 54
    .line 55
    const-string v1, "Have Confirm info!"

    .line 56
    .line 57
    invoke-virtual {p1, v2, v0, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/b$a;->a:Lcom/tencent/could/huiyansdk/fragments/b;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/b;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method
