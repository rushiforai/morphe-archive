.class public Ll/mtf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mtf0$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/view/View;

.field public b:I

.field public c:Ll/mtf0$a;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mtf0;->a:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/itf0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/itf0;-><init>(Ll/mtf0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/mtf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mtf0;->b()V

    return-void
.end method

.method public static c(Landroid/view/View;Ll/mtf0$a;)V
    .locals 1

    .line 1
    new-instance v0, Ll/mtf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mtf0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/mtf0;->d(Ll/mtf0$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/mtf0;->a:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Ll/mtf0;->b:I

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iput v0, p0, Ll/mtf0;->b:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-ne v1, v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sub-int v2, v1, v0

    .line 26
    .line 27
    const/16 v3, 0xc8

    .line 28
    .line 29
    if-le v2, v3, :cond_3

    .line 30
    .line 31
    iget-object v2, p0, Ll/mtf0;->c:Ll/mtf0$a;

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    sub-int/2addr v1, v0

    .line 36
    invoke-interface {v2, v1}, Ll/mtf0$a;->b(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iput v0, p0, Ll/mtf0;->b:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    sub-int v2, v0, v1

    .line 43
    .line 44
    if-le v2, v3, :cond_5

    .line 45
    .line 46
    iget-object v2, p0, Ll/mtf0;->c:Ll/mtf0$a;

    .line 47
    .line 48
    if-eqz v2, :cond_4

    .line 49
    .line 50
    sub-int v1, v0, v1

    .line 51
    .line 52
    invoke-interface {v2, v1}, Ll/mtf0$a;->a(I)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iput v0, p0, Ll/mtf0;->b:I

    .line 56
    .line 57
    :cond_5
    :goto_0
    return-void
.end method

.method public final d(Ll/mtf0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mtf0;->c:Ll/mtf0$a;

    .line 2
    .line 3
    return-void
.end method
