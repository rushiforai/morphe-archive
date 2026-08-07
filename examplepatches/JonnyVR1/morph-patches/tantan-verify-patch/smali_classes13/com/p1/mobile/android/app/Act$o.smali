.class public Lcom/p1/mobile/android/app/Act$o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/il50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Ll/b30;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/b30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$o;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$o;->c:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/android/app/Act$o;->d:Ll/b30;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 5
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
    invoke-static {}, Ll/dgq0$l;->b()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2, p1}, Ll/dgq0;->p(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {}, Ll/dgq0$l;->b()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p2, v0}, Ll/dgq0;->f(I)Ll/svm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Ll/svm;->d:I

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/android/app/Act$o;->b:I

    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p2, v0}, Ll/dgq0;->f(I)Ll/svm;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v0, v0, Ll/svm;->d:I

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/android/app/Act$o;->a:I

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    if-eq v1, v0, :cond_1

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v3, v2

    .line 41
    :goto_0
    if-eqz v3, :cond_2

    .line 42
    .line 43
    sub-int v1, v0, v1

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iput v0, p0, Lcom/p1/mobile/android/app/Act$o;->a:I

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$o;->c:Landroid/view/View;

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    :cond_2
    if-eqz p1, :cond_3

    .line 57
    .line 58
    iget v1, p0, Lcom/p1/mobile/android/app/Act$o;->b:I

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    sget-object v4, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 63
    .line 64
    sub-int/2addr v1, v0

    .line 65
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v4, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$o;->d:Ll/b30;

    .line 73
    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget p0, p0, Lcom/p1/mobile/android/app/Act$o;->b:I

    .line 81
    .line 82
    sub-int/2addr p0, v0

    .line 83
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-interface {v1, p1, p0, v0, v2}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-object p2
.end method
