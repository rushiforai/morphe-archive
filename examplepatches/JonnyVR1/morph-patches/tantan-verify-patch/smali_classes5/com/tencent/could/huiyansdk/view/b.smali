.class public Lcom/tencent/could/huiyansdk/view/b;
.super Landroid/app/Dialog;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:I

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/view/b;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic a(Landroid/view/View;)V
    .locals 0

    .line 48
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 49
    iget p1, p0, Lcom/tencent/could/huiyansdk/view/b;->b:I

    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/b;->c:Ljava/lang/String;

    invoke-static {p1, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/view/b;Landroid/view/View;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/view/b;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Lcom/tencent/could/huiyansdk/R$layout;->txy_huiyan_dialog_error_info:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    sget v0, Lcom/tencent/could/huiyansdk/R$id;->txy_error_msg_text:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/widget/TextView;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/b;->a:Landroid/widget/TextView;

    .line 27
    .line 28
    sget p1, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_dialog_ok_btn:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/auq0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/auq0;-><init>(Lcom/tencent/could/huiyansdk/view/b;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method
