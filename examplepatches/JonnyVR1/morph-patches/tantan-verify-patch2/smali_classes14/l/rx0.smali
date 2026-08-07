.class public final synthetic Ll/rx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rx0;->a:Ll/jl80;

    iput-object p2, p0, Ll/rx0;->b:Landroid/view/inputmethod/InputMethodManager;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rx0;->a:Ll/jl80;

    iget-object p0, p0, Ll/rx0;->b:Landroid/view/inputmethod/InputMethodManager;

    invoke-static {v0, p0, p1}, Ll/tx0;->a(Ll/jl80;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    return-void
.end method
