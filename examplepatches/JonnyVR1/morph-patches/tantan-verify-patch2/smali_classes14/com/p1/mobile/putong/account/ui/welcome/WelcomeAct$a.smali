.class public Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->debugItems()Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/String;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->b:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->c(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->a:Landroid/widget/TextView;

    .line 7
    .line 8
    new-instance v1, Ll/wxp0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/wxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final synthetic c(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->b:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    const-string p2, "clipboard"

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/content/ClipboardManager;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "\u5df2\u590d\u5236"

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;->b(Ljava/lang/String;)Lkotlin/Unit;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
