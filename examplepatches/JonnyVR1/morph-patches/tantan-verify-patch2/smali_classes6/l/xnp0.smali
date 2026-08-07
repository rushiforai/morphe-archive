.class public final synthetic Ll/xnp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xnp0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/xnp0;->b:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xnp0;->a:Landroid/view/View;

    iget-object p0, p0, Ll/xnp0;->b:Ll/gcg0;

    invoke-static {v0, p0}, Ll/ynp0;->a(Landroid/view/View;Ll/gcg0;)V

    return-void
.end method
