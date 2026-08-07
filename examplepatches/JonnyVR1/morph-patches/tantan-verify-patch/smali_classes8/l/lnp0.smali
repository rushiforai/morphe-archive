.class public final synthetic Ll/lnp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lnp0;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object p2, p0, Ll/lnp0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/lnp0;->c:[I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lnp0;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iget-object v1, p0, Ll/lnp0;->b:Landroid/view/View;

    iget-object p0, p0, Ll/lnp0;->c:[I

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/qnp0;->X0([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;[ILl/gcg0;)V

    return-void
.end method
