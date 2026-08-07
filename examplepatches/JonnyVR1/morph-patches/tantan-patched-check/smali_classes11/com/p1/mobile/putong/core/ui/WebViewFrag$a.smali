.class public Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/WebViewFrag;->T4()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->B:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->P4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->I:Ll/x20;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->I:Ll/x20;

    .line 84
    .line 85
    invoke-interface {p0}, Ll/x20;->call()V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
