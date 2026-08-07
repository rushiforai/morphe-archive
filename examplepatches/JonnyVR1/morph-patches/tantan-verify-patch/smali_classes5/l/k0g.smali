.class public final synthetic Ll/k0g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l0g$a;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/l0g$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0g;->a:Ll/l0g$a;

    iput-object p2, p0, Ll/k0g;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k0g;->a:Ll/l0g$a;

    iget-object p0, p0, Ll/k0g;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/l0g;->F(Ll/l0g$a;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
