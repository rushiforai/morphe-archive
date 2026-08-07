.class public final synthetic Ll/pp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wp;

.field public final synthetic b:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method public synthetic constructor <init>(Ll/wp;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pp;->a:Ll/wp;

    iput-object p2, p0, Ll/pp;->b:Landroid/view/inputmethod/InputMethodManager;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pp;->a:Ll/wp;

    iget-object p0, p0, Ll/pp;->b:Landroid/view/inputmethod/InputMethodManager;

    invoke-static {v0, p0, p1}, Ll/wp;->d(Ll/wp;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    return-void
.end method
