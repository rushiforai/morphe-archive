.class public final synthetic Ll/lax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jax$d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/BreakIce;


# direct methods
.method public synthetic constructor <init>(Ll/jax$d;Lcom/p1/mobile/putong/core/data/BreakIce;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lax;->a:Ll/jax$d;

    iput-object p2, p0, Ll/lax;->b:Lcom/p1/mobile/putong/core/data/BreakIce;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lax;->a:Ll/jax$d;

    iget-object p0, p0, Ll/lax;->b:Lcom/p1/mobile/putong/core/data/BreakIce;

    invoke-static {v0, p0, p1}, Ll/jax$d;->E(Ll/jax$d;Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V

    return-void
.end method
