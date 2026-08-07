.class public final synthetic Ll/cax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jax;


# direct methods
.method public synthetic constructor <init>(Ll/jax;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cax;->a:Ll/jax;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cax;->a:Ll/jax;

    invoke-static {p0, p1}, Ll/jax;->p(Ll/jax;Landroid/view/View;)V

    return-void
.end method
