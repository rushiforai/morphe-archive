.class public final synthetic Ll/kax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jax$b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/jax$b;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kax;->a:Ll/jax$b;

    iput-object p2, p0, Ll/kax;->b:Ljava/lang/String;

    iput p3, p0, Ll/kax;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kax;->a:Ll/jax$b;

    iget-object v1, p0, Ll/kax;->b:Ljava/lang/String;

    iget p0, p0, Ll/kax;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/jax$b;->E(Ll/jax$b;Ljava/lang/String;ILandroid/view/View;)V

    return-void
.end method
