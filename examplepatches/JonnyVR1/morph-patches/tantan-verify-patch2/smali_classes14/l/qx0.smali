.class public final synthetic Ll/qx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/EditText;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:F

.field public final synthetic e:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Ll/jl80;Lcom/p1/mobile/android/app/Act;FLandroid/view/inputmethod/InputMethodManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qx0;->a:Landroid/widget/EditText;

    iput-object p2, p0, Ll/qx0;->b:Ll/jl80;

    iput-object p3, p0, Ll/qx0;->c:Lcom/p1/mobile/android/app/Act;

    iput p4, p0, Ll/qx0;->d:F

    iput-object p5, p0, Ll/qx0;->e:Landroid/view/inputmethod/InputMethodManager;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qx0;->a:Landroid/widget/EditText;

    iget-object v1, p0, Ll/qx0;->b:Ll/jl80;

    iget-object v2, p0, Ll/qx0;->c:Lcom/p1/mobile/android/app/Act;

    iget v3, p0, Ll/qx0;->d:F

    iget-object v4, p0, Ll/qx0;->e:Landroid/view/inputmethod/InputMethodManager;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/tx0;->i(Landroid/widget/EditText;Ll/jl80;Lcom/p1/mobile/android/app/Act;FLandroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    return-void
.end method
