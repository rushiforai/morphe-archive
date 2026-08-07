.class public final synthetic Ll/tie0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tie0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/tie0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/tie0;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tie0;->a:Landroid/view/View;

    iget-object v1, p0, Ll/tie0;->b:Landroid/view/View;

    iget-object p0, p0, Ll/tie0;->c:Landroid/view/View;

    check-cast p1, [I

    invoke-static {v0, v1, p0, p1}, Ll/vie0;->c(Landroid/view/View;Landroid/view/View;Landroid/view/View;[I)V

    return-void
.end method
