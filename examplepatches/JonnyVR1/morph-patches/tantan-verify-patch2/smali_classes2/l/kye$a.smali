.class public Ll/kye$a;
.super Ll/kye$b;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kye;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/widget/EditText;

.field public final b:Ll/lze;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 1
    .param p1    # Landroid/widget/EditText;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/kye$b;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kye$a;->a:Landroid/widget/EditText;

    .line 5
    .line 6
    new-instance v0, Ll/lze;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/lze;-><init>(Landroid/widget/EditText;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/kye$a;->b:Ll/lze;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/lye;->getInstance()Landroid/text/Editable$Factory;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;
    .locals 0
    .param p1    # Landroid/text/method/KeyListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of p0, p1, Ll/wye;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    new-instance p0, Ll/wye;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/wye;-><init>(Landroid/text/method/KeyListener;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public b(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 1
    .param p1    # Landroid/view/inputmethod/InputConnection;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/inputmethod/EditorInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Ll/uye;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    new-instance v0, Ll/uye;

    .line 7
    .line 8
    iget-object p0, p0, Ll/kye$a;->a:Landroid/widget/EditText;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Ll/uye;-><init>(Landroid/widget/TextView;Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kye$a;->b:Ll/lze;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lze;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kye$a;->b:Ll/lze;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lze;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
