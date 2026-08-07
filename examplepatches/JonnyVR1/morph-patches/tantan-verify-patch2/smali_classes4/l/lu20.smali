.class public Ll/lu20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ku20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/ku20;)V
    .locals 0

    .line 1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 28
    .line 29
    sget v2, Ll/c9c0;->b:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 41
    .line 42
    sget p1, Ll/c9c0;->b:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void

    .line 52
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object v0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v1, Ll/dbc0;->uu:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    :cond_3
    iget-object p0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 74
    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->setGradientStatusBar()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    const/high16 p1, -0x1000000

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lu20;->a:Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

    .line 2
    .line 3
    sget v0, Ll/agc0;->v:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ku20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lu20;->a(Ll/ku20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
