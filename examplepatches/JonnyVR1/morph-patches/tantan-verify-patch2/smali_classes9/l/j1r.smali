.class public final synthetic Ll/j1r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w0r$j;

.field public final synthetic b:I

.field public final synthetic c:Ll/oze$a;


# direct methods
.method public synthetic constructor <init>(Ll/w0r$j;ILl/oze$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j1r;->a:Ll/w0r$j;

    iput p2, p0, Ll/j1r;->b:I

    iput-object p3, p0, Ll/j1r;->c:Ll/oze$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j1r;->a:Ll/w0r$j;

    iget v1, p0, Ll/j1r;->b:I

    iget-object p0, p0, Ll/j1r;->c:Ll/oze$a;

    invoke-static {v0, v1, p0, p1}, Ll/w0r$j;->z(Ll/w0r$j;ILl/oze$a;Landroid/view/View;)V

    return-void
.end method
