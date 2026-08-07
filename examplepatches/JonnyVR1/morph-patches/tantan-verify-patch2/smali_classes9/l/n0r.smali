.class public final synthetic Ll/n0r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w0r;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/w0r;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n0r;->a:Ll/w0r;

    iput-object p2, p0, Ll/n0r;->b:Landroid/view/View;

    iput-object p3, p0, Ll/n0r;->c:Landroid/view/View;

    iput-object p4, p0, Ll/n0r;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n0r;->a:Ll/w0r;

    iget-object v1, p0, Ll/n0r;->b:Landroid/view/View;

    iget-object v2, p0, Ll/n0r;->c:Landroid/view/View;

    iget-object p0, p0, Ll/n0r;->d:Landroid/view/View;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, p0, p1}, Ll/w0r;->t(Ll/w0r;Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method
