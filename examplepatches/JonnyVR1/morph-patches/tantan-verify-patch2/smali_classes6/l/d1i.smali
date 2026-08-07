.class public final synthetic Ll/d1i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e1i;

.field public final synthetic b:I

.field public final synthetic c:Ll/uzh;


# direct methods
.method public synthetic constructor <init>(Ll/e1i;ILl/uzh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d1i;->a:Ll/e1i;

    iput p2, p0, Ll/d1i;->b:I

    iput-object p3, p0, Ll/d1i;->c:Ll/uzh;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d1i;->a:Ll/e1i;

    iget v1, p0, Ll/d1i;->b:I

    iget-object p0, p0, Ll/d1i;->c:Ll/uzh;

    invoke-static {v0, v1, p0, p1}, Ll/e1i;->y(Ll/e1i;ILl/uzh;Landroid/view/View;)V

    return-void
.end method
