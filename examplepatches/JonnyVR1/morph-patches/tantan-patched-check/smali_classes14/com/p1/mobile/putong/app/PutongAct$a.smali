.class public Lcom/p1/mobile/putong/app/PutongAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/il50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/app/PutongAct;->checkStatusBarHeight()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 4
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/dgq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/16 v0, 0x400

    .line 16
    .line 17
    and-int/2addr p1, v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 19
    .line 20
    if-ne p1, v0, :cond_0

    .line 21
    .line 22
    sget p1, Ll/ycc0;->g:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {v1, p1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 29
    .line 30
    sget v0, Ll/ycc0;->f:I

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/Integer;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {v0, v1, p1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    sget p1, Ll/ycc0;->g:I

    .line 67
    .line 68
    invoke-virtual {v1, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->a:Landroid/view/View;

    .line 75
    .line 76
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/app/PutongAct;->paddingToStatusBar(Landroid/view/View;Ll/dgq0;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct$a;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 80
    .line 81
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {p2, p1}, Ll/dgq0;->f(I)Ll/svm;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget p1, p1, Ll/svm;->d:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setPaddingToNavigationBar(I)V

    .line 92
    .line 93
    .line 94
    return-object p2
.end method
