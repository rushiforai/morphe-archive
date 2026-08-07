.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->E(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "",
        "onGlobalLayout",
        "()V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

.field final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:Ll/dc60;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;IIILl/dc60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 4
    .line 5
    iput p3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->c:I

    .line 6
    .line 7
    iput p4, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->d:I

    .line 8
    .line 9
    iput p5, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->e:I

    .line 10
    .line 11
    iput-object p6, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->f:Ll/dc60;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static a(Ll/dc60;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/m960;->d()V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->u(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 14
    .line 15
    .line 16
    sget-object v2, Ll/kb60;->INSTANCE:Ll/kb60;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    iget v7, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->c:I

    .line 43
    .line 44
    iget v8, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->d:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->t(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Ll/svm;

    .line 49
    .line 50
    .line 51
    move-result-object v9

    .line 52
    iget v10, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->e:I

    .line 53
    .line 54
    invoke-virtual/range {v2 .. v10}, Ll/kb60;->b(IIIIIILl/svm;I)Ljava/util/Map;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->f:Ll/dc60;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/dc60;->c()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    move-object v3, v0

    .line 69
    check-cast v3, Landroid/graphics/PointF;

    .line 70
    .line 71
    if-nez v3, :cond_0

    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    sget-object v1, Ll/l960;->INSTANCE:Ll/l960;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 83
    .line 84
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 85
    .line 86
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->f:Ll/dc60;

    .line 87
    .line 88
    invoke-static {v0, v4}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->s(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    .line 99
    .line 100
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;->f:Ll/dc60;

    .line 105
    .line 106
    new-instance v7, Ll/cc60;

    .line 107
    .line 108
    invoke-direct {v7, p0}, Ll/cc60;-><init>(Ll/dc60;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual/range {v1 .. v7}, Ll/l960;->j(Landroid/view/View;Landroid/graphics/PointF;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;IILkotlin/jvm/functions/Function0;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
