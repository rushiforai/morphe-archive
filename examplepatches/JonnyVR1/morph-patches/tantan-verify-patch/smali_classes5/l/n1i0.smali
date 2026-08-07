.class public final synthetic Ll/n1i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/o1i0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/o1i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1i0;->a:Ll/o1i0;

    iput-object p2, p0, Ll/n1i0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n1i0;->a:Ll/o1i0;

    iget-object p0, p0, Ll/n1i0;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/o1i0;->f(Ll/o1i0;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
