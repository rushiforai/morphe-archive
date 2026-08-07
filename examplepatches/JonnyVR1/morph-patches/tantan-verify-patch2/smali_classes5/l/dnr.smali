.class public final synthetic Ll/dnr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nnr;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dnr;->a:Ll/nnr;

    iput-object p2, p0, Ll/dnr;->b:Landroid/view/View;

    iput-object p3, p0, Ll/dnr;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dnr;->a:Ll/nnr;

    iget-object v1, p0, Ll/dnr;->b:Landroid/view/View;

    iget-object p0, p0, Ll/dnr;->c:Landroid/widget/TextView;

    invoke-static {v0, v1, p0}, Ll/nnr;->e(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V

    return-void
.end method
