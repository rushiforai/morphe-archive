.class public final synthetic Ll/nnp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:[I

.field public final synthetic c:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;[ILl/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nnp0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/nnp0;->b:[I

    iput-object p3, p0, Ll/nnp0;->c:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnp0;->a:Landroid/view/View;

    iget-object v1, p0, Ll/nnp0;->b:[I

    iget-object p0, p0, Ll/nnp0;->c:Ll/gcg0;

    invoke-static {v0, v1, p0}, Ll/qnp0;->R0(Landroid/view/View;[ILl/gcg0;)V

    return-void
.end method
