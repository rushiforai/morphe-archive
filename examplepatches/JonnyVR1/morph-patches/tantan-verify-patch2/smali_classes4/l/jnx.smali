.class public final synthetic Ll/jnx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jnx;->a:Landroid/view/View;

    iput-object p2, p0, Ll/jnx;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jnx;->a:Landroid/view/View;

    iget-object p0, p0, Ll/jnx;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/xnx;->u(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
