.class public final Ll/kye;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kye$a;,
        Ll/kye$b;
    }
.end annotation


# instance fields
.field public final a:Ll/kye$b;

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 1
    .param p1    # Landroid/widget/EditText;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/kye;->b:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/kye;->c:I

    .line 11
    .line 12
    const-string v0, "editText cannot be null"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/kye$a;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/kye$a;-><init>(Landroid/widget/EditText;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/kye;->a:Ll/kye$b;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/kye;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;
    .locals 1
    .param p1    # Landroid/text/method/KeyListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, "keyListener cannot be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kye;->a:Ll/kye$b;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/kye$b;->a(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/kye;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 0
    .param p1    # Landroid/view/inputmethod/InputConnection;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/inputmethod/EditorInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/kye;->a:Ll/kye$b;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/kye$b;->b(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public e(I)V
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iput p1, p0, Ll/kye;->c:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/kye;->a:Ll/kye$b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kye$b;->c(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .line 1
    const-string v0, "maxEmojiCount should be greater than 0"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/yn80;->d(ILjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    iput p1, p0, Ll/kye;->b:I

    .line 7
    .line 8
    iget-object p0, p0, Ll/kye;->a:Ll/kye$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/kye$b;->d(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
