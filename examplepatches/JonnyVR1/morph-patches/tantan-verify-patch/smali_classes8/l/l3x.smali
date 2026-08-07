.class public final synthetic Ll/l3x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/k3x$b;

.field public final synthetic b:I

.field public final synthetic c:Ll/k3x$c;


# direct methods
.method public synthetic constructor <init>(Ll/k3x$b;ILl/k3x$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l3x;->a:Ll/k3x$b;

    iput p2, p0, Ll/l3x;->b:I

    iput-object p3, p0, Ll/l3x;->c:Ll/k3x$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l3x;->a:Ll/k3x$b;

    iget v1, p0, Ll/l3x;->b:I

    iget-object p0, p0, Ll/l3x;->c:Ll/k3x$c;

    invoke-static {v0, v1, p0, p1}, Ll/k3x$b;->y(Ll/k3x$b;ILl/k3x$c;Landroid/view/View;)V

    return-void
.end method
