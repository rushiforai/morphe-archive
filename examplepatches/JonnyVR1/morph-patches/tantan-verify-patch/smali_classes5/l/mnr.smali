.class public final synthetic Ll/mnr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nnr;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mnr;->a:Ll/nnr;

    iput-object p2, p0, Ll/mnr;->b:Landroid/view/View;

    iput-object p3, p0, Ll/mnr;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mnr;->a:Ll/nnr;

    iget-object v1, p0, Ll/mnr;->b:Landroid/view/View;

    iget-object p0, p0, Ll/mnr;->c:Landroid/widget/TextView;

    check-cast p1, [I

    invoke-static {v0, v1, p0, p1}, Ll/nnr;->m(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;[I)V

    return-void
.end method
