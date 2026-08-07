.class public Landroidx/appcompat/widget/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a8f0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/b$e;,
        Landroidx/appcompat/widget/b$f;,
        Landroidx/appcompat/widget/b$g;,
        Landroidx/appcompat/widget/b$c;,
        Landroidx/appcompat/widget/b$d;
    }
.end annotation


# static fields
.field public static H:Ljava/lang/reflect/Method;

.field public static I:Ljava/lang/reflect/Method;


# instance fields
.field public final A:Landroidx/appcompat/widget/b$c;

.field public B:Ljava/lang/Runnable;

.field public final C:Landroid/os/Handler;

.field public final D:Landroid/graphics/Rect;

.field public E:Landroid/graphics/Rect;

.field public F:Z

.field public G:Landroid/widget/PopupWindow;

.field public a:Landroid/content/Context;

.field public b:Landroid/widget/ListAdapter;

.field public c:Landroidx/appcompat/widget/DropDownListView;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:I

.field public n:Z

.field public o:Z

.field public p:I

.field public q:Landroid/view/View;

.field public r:I

.field public s:Landroid/database/DataSetObserver;

.field public t:Landroid/view/View;

.field public u:Landroid/graphics/drawable/Drawable;

.field public v:Landroid/widget/AdapterView$OnItemClickListener;

.field public w:Landroid/widget/AdapterView$OnItemSelectedListener;

.field public final x:Landroidx/appcompat/widget/b$g;

.field public final y:Landroidx/appcompat/widget/b$f;

.field public final z:Landroidx/appcompat/widget/b$e;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-class v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v2, 0x1c

    .line 6
    .line 7
    if-gt v1, v2, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    :try_start_0
    const-string v3, "setClipToScreenEnabled"

    .line 12
    .line 13
    new-array v4, v2, [Ljava/lang/Class;

    .line 14
    .line 15
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    aput-object v5, v4, v1

    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    sput-object v3, Landroidx/appcompat/widget/b;->H:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    :catch_0
    :try_start_1
    const-string v3, "setEpicenterBounds"

    .line 26
    .line 27
    new-array v2, v2, [Ljava/lang/Class;

    .line 28
    .line 29
    const-class v4, Landroid/graphics/Rect;

    .line 30
    .line 31
    aput-object v4, v2, v1

    .line 32
    .line 33
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Landroidx/appcompat/widget/b;->I:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    .line 39
    :catch_1
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 119
    sget v1, Ll/s8c0;->G:I

    invoke-direct {p0, p1, v0, v1}, Landroidx/appcompat/widget/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/AttrRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 118
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/appcompat/widget/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/AttrRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Landroidx/appcompat/widget/b;->d:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/appcompat/widget/b;->e:I

    .line 8
    .line 9
    const/16 v0, 0x3ea

    .line 10
    .line 11
    iput v0, p0, Landroidx/appcompat/widget/b;->h:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Landroidx/appcompat/widget/b;->j:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, p0, Landroidx/appcompat/widget/b;->m:I

    .line 18
    .line 19
    iput-boolean v1, p0, Landroidx/appcompat/widget/b;->n:Z

    .line 20
    .line 21
    iput-boolean v1, p0, Landroidx/appcompat/widget/b;->o:Z

    .line 22
    .line 23
    const v2, 0x7fffffff

    .line 24
    .line 25
    .line 26
    iput v2, p0, Landroidx/appcompat/widget/b;->p:I

    .line 27
    .line 28
    iput v1, p0, Landroidx/appcompat/widget/b;->r:I

    .line 29
    .line 30
    new-instance v2, Landroidx/appcompat/widget/b$g;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Landroidx/appcompat/widget/b$g;-><init>(Landroidx/appcompat/widget/b;)V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Landroidx/appcompat/widget/b;->x:Landroidx/appcompat/widget/b$g;

    .line 36
    .line 37
    new-instance v2, Landroidx/appcompat/widget/b$f;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Landroidx/appcompat/widget/b$f;-><init>(Landroidx/appcompat/widget/b;)V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Landroidx/appcompat/widget/b;->y:Landroidx/appcompat/widget/b$f;

    .line 43
    .line 44
    new-instance v2, Landroidx/appcompat/widget/b$e;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Landroidx/appcompat/widget/b$e;-><init>(Landroidx/appcompat/widget/b;)V

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Landroidx/appcompat/widget/b;->z:Landroidx/appcompat/widget/b$e;

    .line 50
    .line 51
    new-instance v2, Landroidx/appcompat/widget/b$c;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Landroidx/appcompat/widget/b$c;-><init>(Landroidx/appcompat/widget/b;)V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Landroidx/appcompat/widget/b;->A:Landroidx/appcompat/widget/b$c;

    .line 57
    .line 58
    new-instance v2, Landroid/graphics/Rect;

    .line 59
    .line 60
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 64
    .line 65
    iput-object p1, p0, Landroidx/appcompat/widget/b;->a:Landroid/content/Context;

    .line 66
    .line 67
    new-instance v2, Landroid/os/Handler;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Landroidx/appcompat/widget/b;->C:Landroid/os/Handler;

    .line 77
    .line 78
    sget-object v2, Ll/gic0;->p1:[I

    .line 79
    .line 80
    invoke-virtual {p1, p2, v2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget v3, Ll/gic0;->q1:I

    .line 85
    .line 86
    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    iput v3, p0, Landroidx/appcompat/widget/b;->f:I

    .line 91
    .line 92
    sget v3, Ll/gic0;->r1:I

    .line 93
    .line 94
    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iput v1, p0, Landroidx/appcompat/widget/b;->g:I

    .line 99
    .line 100
    if-eqz v1, :cond_0

    .line 101
    .line 102
    iput-boolean v0, p0, Landroidx/appcompat/widget/b;->i:Z

    .line 103
    .line 104
    :cond_0
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 105
    .line 106
    .line 107
    new-instance v1, Ll/ru0;

    .line 108
    .line 109
    invoke-direct {v1, p1, p2, p3, p4}, Ll/ru0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 110
    .line 111
    .line 112
    iput-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/b;->F:Z

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0
    .param p1    # Landroid/widget/PopupWindow$OnDismissListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0
    .param p1    # Landroid/widget/AdapterView$OnItemClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/b;->v:Landroid/widget/AdapterView$OnItemClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public E(Z)V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/widget/b;->l:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Landroidx/appcompat/widget/b;->k:Z

    .line 5
    .line 6
    return-void
.end method

.method public final F(Z)V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-gt v0, v1, :cond_1

    .line 6
    .line 7
    sget-object v0, Landroidx/appcompat/widget/b;->H:Ljava/lang/reflect/Method;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    new-array v1, v1, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v2, 0x0

    .line 21
    aput-object p1, v1, v2

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    :cond_0
    return-void

    .line 27
    :cond_1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/bpr;->a(Landroid/widget/PopupWindow;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public G(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/b;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public H(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/DropDownListView;->setListSelectionHidden(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChoiceMode()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    invoke-virtual {v0, p1, p0}, Landroid/widget/AbsListView;->setItemChecked(IZ)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public I(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/b;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/b;->g:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/appcompat/widget/b;->i:Z

    .line 5
    .line 6
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->u()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/appcompat/widget/b;->C:Landroid/os/Handler;

    .line 18
    .line 19
    iget-object p0, p0, Landroidx/appcompat/widget/b;->x:Landroidx/appcompat/widget/b$g;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/b;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Landroidx/appcompat/widget/b;->g:I

    .line 8
    .line 9
    return p0
.end method

.method public g()Landroid/widget/ListView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/b;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(Landroid/widget/ListAdapter;)V
    .locals 2
    .param p1    # Landroid/widget/ListAdapter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->s:Landroid/database/DataSetObserver;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/b$d;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/appcompat/widget/b$d;-><init>(Landroidx/appcompat/widget/b;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/appcompat/widget/b;->s:Landroid/database/DataSetObserver;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Landroidx/appcompat/widget/b;->b:Landroid/widget/ListAdapter;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v1, v0}, Landroid/widget/Adapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    iput-object p1, p0, Landroidx/appcompat/widget/b;->b:Landroid/widget/ListAdapter;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/appcompat/widget/b;->s:Landroid/database/DataSetObserver;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Landroid/widget/Adapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p1, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 30
    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p0, p0, Landroidx/appcompat/widget/b;->b:Landroid/widget/ListAdapter;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    return-void
.end method

.method public final m()I
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    if-nez v0, :cond_6

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/appcompat/widget/b;->a:Landroid/content/Context;

    .line 11
    .line 12
    new-instance v5, Landroidx/appcompat/widget/b$a;

    .line 13
    .line 14
    invoke-direct {v5, p0}, Landroidx/appcompat/widget/b$a;-><init>(Landroidx/appcompat/widget/b;)V

    .line 15
    .line 16
    .line 17
    iput-object v5, p0, Landroidx/appcompat/widget/b;->B:Ljava/lang/Runnable;

    .line 18
    .line 19
    iget-boolean v5, p0, Landroidx/appcompat/widget/b;->F:Z

    .line 20
    .line 21
    xor-int/2addr v5, v3

    .line 22
    invoke-virtual {p0, v0, v5}, Landroidx/appcompat/widget/b;->o(Landroid/content/Context;Z)Landroidx/appcompat/widget/DropDownListView;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    iput-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 27
    .line 28
    iget-object v6, p0, Landroidx/appcompat/widget/b;->u:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    if-eqz v6, :cond_0

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/DropDownListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 36
    .line 37
    iget-object v6, p0, Landroidx/appcompat/widget/b;->b:Landroid/widget/ListAdapter;

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 40
    .line 41
    .line 42
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 43
    .line 44
    iget-object v6, p0, Landroidx/appcompat/widget/b;->v:Landroid/widget/AdapterView$OnItemClickListener;

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 50
    .line 51
    invoke-virtual {v5, v3}, Landroid/view/View;->setFocusable(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 55
    .line 56
    invoke-virtual {v5, v3}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 60
    .line 61
    new-instance v6, Landroidx/appcompat/widget/b$b;

    .line 62
    .line 63
    invoke-direct {v6, p0}, Landroidx/appcompat/widget/b$b;-><init>(Landroidx/appcompat/widget/b;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v6}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 70
    .line 71
    iget-object v6, p0, Landroidx/appcompat/widget/b;->z:Landroidx/appcompat/widget/b$e;

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v5, p0, Landroidx/appcompat/widget/b;->w:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 77
    .line 78
    if-eqz v5, :cond_1

    .line 79
    .line 80
    iget-object v6, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 81
    .line 82
    invoke-virtual {v6, v5}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v5, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 86
    .line 87
    iget-object v6, p0, Landroidx/appcompat/widget/b;->q:Landroid/view/View;

    .line 88
    .line 89
    if-eqz v6, :cond_5

    .line 90
    .line 91
    new-instance v7, Landroid/widget/LinearLayout;

    .line 92
    .line 93
    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 97
    .line 98
    .line 99
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 100
    .line 101
    const/high16 v8, 0x3f800000    # 1.0f

    .line 102
    .line 103
    invoke-direct {v0, v2, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 104
    .line 105
    .line 106
    iget v8, p0, Landroidx/appcompat/widget/b;->r:I

    .line 107
    .line 108
    if-eqz v8, :cond_3

    .line 109
    .line 110
    if-eq v8, v3, :cond_2

    .line 111
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v5, "Invalid hint position "

    .line 115
    .line 116
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget v5, p0, Landroidx/appcompat/widget/b;->r:I

    .line 120
    .line 121
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v5, "ListPopupWindow"

    .line 129
    .line 130
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_2
    invoke-virtual {v7, v5, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_3
    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v7, v5, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    .line 146
    .line 147
    :goto_0
    iget v0, p0, Landroidx/appcompat/widget/b;->e:I

    .line 148
    .line 149
    if-ltz v0, :cond_4

    .line 150
    .line 151
    move v5, v1

    .line 152
    goto :goto_1

    .line 153
    :cond_4
    move v0, v4

    .line 154
    move v5, v0

    .line 155
    :goto_1
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    invoke-virtual {v6, v0, v4}, Landroid/view/View;->measure(II)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 167
    .line 168
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    iget v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 173
    .line 174
    add-int/2addr v5, v6

    .line 175
    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 176
    .line 177
    add-int/2addr v5, v0

    .line 178
    move v0, v5

    .line 179
    move-object v5, v7

    .line 180
    goto :goto_2

    .line 181
    :cond_5
    move v0, v4

    .line 182
    :goto_2
    iget-object v6, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 183
    .line 184
    invoke-virtual {v6, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_6
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 189
    .line 190
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Landroid/view/ViewGroup;

    .line 195
    .line 196
    iget-object v0, p0, Landroidx/appcompat/widget/b;->q:Landroid/view/View;

    .line 197
    .line 198
    if-eqz v0, :cond_7

    .line 199
    .line 200
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 205
    .line 206
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iget v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 211
    .line 212
    add-int/2addr v0, v6

    .line 213
    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 214
    .line 215
    add-int/2addr v0, v5

    .line 216
    goto :goto_3

    .line 217
    :cond_7
    move v0, v4

    .line 218
    :goto_3
    iget-object v5, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 219
    .line 220
    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    iget-object v6, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 225
    .line 226
    if-eqz v5, :cond_8

    .line 227
    .line 228
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 229
    .line 230
    .line 231
    iget-object v5, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 232
    .line 233
    iget v6, v5, Landroid/graphics/Rect;->top:I

    .line 234
    .line 235
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 236
    .line 237
    add-int/2addr v5, v6

    .line 238
    iget-boolean v7, p0, Landroidx/appcompat/widget/b;->i:Z

    .line 239
    .line 240
    if-nez v7, :cond_9

    .line 241
    .line 242
    neg-int v6, v6

    .line 243
    iput v6, p0, Landroidx/appcompat/widget/b;->g:I

    .line 244
    .line 245
    goto :goto_4

    .line 246
    :cond_8
    invoke-virtual {v6}, Landroid/graphics/Rect;->setEmpty()V

    .line 247
    .line 248
    .line 249
    move v5, v4

    .line 250
    :cond_9
    :goto_4
    iget-object v6, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 251
    .line 252
    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 253
    .line 254
    .line 255
    move-result v6

    .line 256
    const/4 v7, 0x2

    .line 257
    if-ne v6, v7, :cond_a

    .line 258
    .line 259
    goto :goto_5

    .line 260
    :cond_a
    move v3, v4

    .line 261
    :goto_5
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    iget v6, p0, Landroidx/appcompat/widget/b;->g:I

    .line 266
    .line 267
    invoke-virtual {p0, v4, v6, v3}, Landroidx/appcompat/widget/b;->q(Landroid/view/View;IZ)I

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    iget-boolean v4, p0, Landroidx/appcompat/widget/b;->n:Z

    .line 272
    .line 273
    if-nez v4, :cond_f

    .line 274
    .line 275
    iget v4, p0, Landroidx/appcompat/widget/b;->d:I

    .line 276
    .line 277
    if-ne v4, v2, :cond_b

    .line 278
    .line 279
    goto :goto_8

    .line 280
    :cond_b
    iget v4, p0, Landroidx/appcompat/widget/b;->e:I

    .line 281
    .line 282
    const/4 v6, -0x2

    .line 283
    if-eq v4, v6, :cond_d

    .line 284
    .line 285
    const/high16 v1, 0x40000000    # 2.0f

    .line 286
    .line 287
    if-eq v4, v2, :cond_c

    .line 288
    .line 289
    invoke-static {v4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    :goto_6
    move v7, v1

    .line 294
    goto :goto_7

    .line 295
    :cond_c
    iget-object v2, p0, Landroidx/appcompat/widget/b;->a:Landroid/content/Context;

    .line 296
    .line 297
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 306
    .line 307
    iget-object v4, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 308
    .line 309
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 310
    .line 311
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 312
    .line 313
    add-int/2addr v6, v4

    .line 314
    sub-int/2addr v2, v6

    .line 315
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    goto :goto_6

    .line 320
    :cond_d
    iget-object v2, p0, Landroidx/appcompat/widget/b;->a:Landroid/content/Context;

    .line 321
    .line 322
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 331
    .line 332
    iget-object v4, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 333
    .line 334
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 335
    .line 336
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 337
    .line 338
    add-int/2addr v6, v4

    .line 339
    sub-int/2addr v2, v6

    .line 340
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    goto :goto_6

    .line 345
    :goto_7
    iget-object v6, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 346
    .line 347
    sub-int v10, v3, v0

    .line 348
    .line 349
    const/4 v11, -0x1

    .line 350
    const/4 v8, 0x0

    .line 351
    const/4 v9, -0x1

    .line 352
    invoke-virtual/range {v6 .. v11}, Landroidx/appcompat/widget/DropDownListView;->d(IIIII)I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    if-lez v1, :cond_e

    .line 357
    .line 358
    iget-object v2, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 359
    .line 360
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    iget-object p0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 365
    .line 366
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 367
    .line 368
    .line 369
    move-result p0

    .line 370
    add-int/2addr v2, p0

    .line 371
    add-int/2addr v5, v2

    .line 372
    add-int/2addr v0, v5

    .line 373
    :cond_e
    add-int/2addr v1, v0

    .line 374
    return v1

    .line 375
    :cond_f
    :goto_8
    add-int/2addr v3, v5

    .line 376
    return v3
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/DropDownListView;->setListSelectionHidden(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public o(Landroid/content/Context;Z)Landroidx/appcompat/widget/DropDownListView;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance p0, Landroidx/appcompat/widget/DropDownListView;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/DropDownListView;-><init>(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public p()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->t:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q(Landroid/view/View;IZ)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;IZ)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public s()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 13

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    iget v3, p0, Landroidx/appcompat/widget/b;->h:I

    .line 12
    .line 13
    invoke-static {v2, v3}, Ll/kl80;->b(Landroid/widget/PopupWindow;I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, -0x2

    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, -0x1

    .line 26
    if-eqz v2, :cond_c

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Ll/kkl0;->O(Landroid/view/View;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    goto/16 :goto_c

    .line 39
    .line 40
    :cond_0
    iget v2, p0, Landroidx/appcompat/widget/b;->e:I

    .line 41
    .line 42
    if-ne v2, v6, :cond_1

    .line 43
    .line 44
    move v2, v6

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    if-ne v2, v4, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    :cond_2
    :goto_0
    iget v7, p0, Landroidx/appcompat/widget/b;->d:I

    .line 57
    .line 58
    if-ne v7, v6, :cond_7

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move v0, v6

    .line 64
    :goto_1
    iget-object v4, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 65
    .line 66
    if-eqz v1, :cond_5

    .line 67
    .line 68
    iget v1, p0, Landroidx/appcompat/widget/b;->e:I

    .line 69
    .line 70
    if-ne v1, v6, :cond_4

    .line 71
    .line 72
    move v1, v6

    .line 73
    goto :goto_2

    .line 74
    :cond_4
    move v1, v5

    .line 75
    :goto_2
    invoke-virtual {v4, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 79
    .line 80
    invoke-virtual {v1, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_5
    iget v1, p0, Landroidx/appcompat/widget/b;->e:I

    .line 85
    .line 86
    if-ne v1, v6, :cond_6

    .line 87
    .line 88
    move v1, v6

    .line 89
    goto :goto_3

    .line 90
    :cond_6
    move v1, v5

    .line 91
    :goto_3
    invoke-virtual {v4, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 95
    .line 96
    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 97
    .line 98
    .line 99
    goto :goto_4

    .line 100
    :cond_7
    if-ne v7, v4, :cond_8

    .line 101
    .line 102
    goto :goto_4

    .line 103
    :cond_8
    move v0, v7

    .line 104
    :goto_4
    iget-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 105
    .line 106
    iget-boolean v4, p0, Landroidx/appcompat/widget/b;->o:Z

    .line 107
    .line 108
    if-nez v4, :cond_9

    .line 109
    .line 110
    iget-boolean v4, p0, Landroidx/appcompat/widget/b;->n:Z

    .line 111
    .line 112
    if-nez v4, :cond_9

    .line 113
    .line 114
    goto :goto_5

    .line 115
    :cond_9
    move v3, v5

    .line 116
    :goto_5
    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v7, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    iget v9, p0, Landroidx/appcompat/widget/b;->f:I

    .line 126
    .line 127
    iget v10, p0, Landroidx/appcompat/widget/b;->g:I

    .line 128
    .line 129
    if-gez v2, :cond_a

    .line 130
    .line 131
    move v11, v6

    .line 132
    goto :goto_6

    .line 133
    :cond_a
    move v11, v2

    .line 134
    :goto_6
    if-gez v0, :cond_b

    .line 135
    .line 136
    move v12, v6

    .line 137
    goto :goto_7

    .line 138
    :cond_b
    move v12, v0

    .line 139
    :goto_7
    invoke-virtual/range {v7 .. v12}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_c
    iget v1, p0, Landroidx/appcompat/widget/b;->e:I

    .line 144
    .line 145
    if-ne v1, v6, :cond_d

    .line 146
    .line 147
    move v1, v6

    .line 148
    goto :goto_8

    .line 149
    :cond_d
    if-ne v1, v4, :cond_e

    .line 150
    .line 151
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    :cond_e
    :goto_8
    iget v2, p0, Landroidx/appcompat/widget/b;->d:I

    .line 160
    .line 161
    if-ne v2, v6, :cond_f

    .line 162
    .line 163
    move v0, v6

    .line 164
    goto :goto_9

    .line 165
    :cond_f
    if-ne v2, v4, :cond_10

    .line 166
    .line 167
    goto :goto_9

    .line 168
    :cond_10
    move v0, v2

    .line 169
    :goto_9
    iget-object v2, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 170
    .line 171
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, v3}, Landroidx/appcompat/widget/b;->F(Z)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 183
    .line 184
    iget-boolean v1, p0, Landroidx/appcompat/widget/b;->o:Z

    .line 185
    .line 186
    if-nez v1, :cond_11

    .line 187
    .line 188
    iget-boolean v1, p0, Landroidx/appcompat/widget/b;->n:Z

    .line 189
    .line 190
    if-nez v1, :cond_11

    .line 191
    .line 192
    goto :goto_a

    .line 193
    :cond_11
    move v3, v5

    .line 194
    :goto_a
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 198
    .line 199
    iget-object v1, p0, Landroidx/appcompat/widget/b;->y:Landroidx/appcompat/widget/b$f;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 202
    .line 203
    .line 204
    iget-boolean v0, p0, Landroidx/appcompat/widget/b;->l:Z

    .line 205
    .line 206
    if-eqz v0, :cond_12

    .line 207
    .line 208
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 209
    .line 210
    iget-boolean v1, p0, Landroidx/appcompat/widget/b;->k:Z

    .line 211
    .line 212
    invoke-static {v0, v1}, Ll/kl80;->a(Landroid/widget/PopupWindow;Z)V

    .line 213
    .line 214
    .line 215
    :cond_12
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 216
    .line 217
    const/16 v1, 0x1c

    .line 218
    .line 219
    if-gt v0, v1, :cond_13

    .line 220
    .line 221
    sget-object v0, Landroidx/appcompat/widget/b;->I:Ljava/lang/reflect/Method;

    .line 222
    .line 223
    if-eqz v0, :cond_14

    .line 224
    .line 225
    :try_start_0
    iget-object v1, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 226
    .line 227
    iget-object v2, p0, Landroidx/appcompat/widget/b;->E:Landroid/graphics/Rect;

    .line 228
    .line 229
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    .line 235
    .line 236
    goto :goto_b

    .line 237
    :catch_0
    move-exception v0

    .line 238
    const-string v1, "ListPopupWindow"

    .line 239
    .line 240
    const-string v2, "Could not invoke setEpicenterBounds on PopupWindow"

    .line 241
    .line 242
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 243
    .line 244
    .line 245
    goto :goto_b

    .line 246
    :cond_13
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 247
    .line 248
    iget-object v1, p0, Landroidx/appcompat/widget/b;->E:Landroid/graphics/Rect;

    .line 249
    .line 250
    invoke-static {v0, v1}, Ll/apr;->a(Landroid/widget/PopupWindow;Landroid/graphics/Rect;)V

    .line 251
    .line 252
    .line 253
    :cond_14
    :goto_b
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 254
    .line 255
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->p()Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    iget v2, p0, Landroidx/appcompat/widget/b;->f:I

    .line 260
    .line 261
    iget v3, p0, Landroidx/appcompat/widget/b;->g:I

    .line 262
    .line 263
    iget v4, p0, Landroidx/appcompat/widget/b;->m:I

    .line 264
    .line 265
    invoke-static {v0, v1, v2, v3, v4}, Ll/kl80;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 269
    .line 270
    invoke-virtual {v0, v6}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 271
    .line 272
    .line 273
    iget-boolean v0, p0, Landroidx/appcompat/widget/b;->F:Z

    .line 274
    .line 275
    if-eqz v0, :cond_15

    .line 276
    .line 277
    iget-object v0, p0, Landroidx/appcompat/widget/b;->c:Landroidx/appcompat/widget/DropDownListView;

    .line 278
    .line 279
    invoke-virtual {v0}, Landroidx/appcompat/widget/DropDownListView;->isInTouchMode()Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-eqz v0, :cond_16

    .line 284
    .line 285
    :cond_15
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->n()V

    .line 286
    .line 287
    .line 288
    :cond_16
    iget-boolean v0, p0, Landroidx/appcompat/widget/b;->F:Z

    .line 289
    .line 290
    if-nez v0, :cond_17

    .line 291
    .line 292
    iget-object v0, p0, Landroidx/appcompat/widget/b;->C:Landroid/os/Handler;

    .line 293
    .line 294
    iget-object p0, p0, Landroidx/appcompat/widget/b;->A:Landroidx/appcompat/widget/b$c;

    .line 295
    .line 296
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 297
    .line 298
    .line 299
    :cond_17
    :goto_c
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/appcompat/widget/b;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->q:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/appcompat/widget/b;->q:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public v(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/b;->t:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public w(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/b;->G:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/b;->D:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    add-int/2addr v1, v0

    .line 21
    add-int/2addr v1, p1

    .line 22
    iput v1, p0, Landroidx/appcompat/widget/b;->e:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/b;->I(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public y(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/b;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public z(Landroid/graphics/Rect;)V
    .locals 1
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput-object v0, p0, Landroidx/appcompat/widget/b;->E:Landroid/graphics/Rect;

    .line 11
    .line 12
    return-void
.end method
