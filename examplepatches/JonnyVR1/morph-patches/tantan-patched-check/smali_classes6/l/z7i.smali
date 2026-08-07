.class public final synthetic Ll/z7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/a8i;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/a8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z7i;->a:Ll/a8i;

    iput-object p2, p0, Ll/z7i;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z7i;->a:Ll/a8i;

    iget-object p0, p0, Ll/z7i;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/a8i;->o(Ll/a8i;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
