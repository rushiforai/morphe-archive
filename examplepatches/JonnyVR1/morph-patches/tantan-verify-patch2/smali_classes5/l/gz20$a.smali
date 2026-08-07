.class public Ll/gz20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gz20;->P(Ll/pf60;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Z

.field public final synthetic c:Ll/gz20;


# direct methods
.method public constructor <init>(Ll/gz20;Landroid/view/View;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gz20$a;->c:Ll/gz20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/gz20$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    div-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    const/high16 v1, 0x41200000    # 10.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-int/2addr v0, v1

    .line 23
    int-to-float v0, v0

    .line 24
    iget-object v1, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    iget-object v2, p0, Ll/gz20$a;->c:Ll/gz20;

    .line 32
    .line 33
    invoke-static {v2}, Ll/gz20;->p(Ll/gz20;)Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/high16 v3, 0x40800000    # 4.0f

    .line 38
    .line 39
    invoke-static {v2, v3}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    int-to-float v2, v2

    .line 44
    add-float/2addr v1, v2

    .line 45
    iget-boolean v2, p0, Ll/gz20$a;->b:Z

    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/high16 v2, 0x40000000    # 2.0f

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    add-int/2addr v0, v2

    .line 62
    int-to-float v0, v0

    .line 63
    :cond_0
    iget-object v2, p0, Ll/gz20$a;->c:Ll/gz20;

    .line 64
    .line 65
    iget-object v2, v2, Ll/gz20;->m:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Landroid/view/View;->setX(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/gz20$a;->c:Ll/gz20;

    .line 71
    .line 72
    iget-object v0, v0, Ll/gz20;->m:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/gz20$a;->c:Ll/gz20;

    .line 78
    .line 79
    iget-object v0, v0, Ll/gz20;->m:Lv/VText;

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/gz20$a;->a:Landroid/view/View;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
