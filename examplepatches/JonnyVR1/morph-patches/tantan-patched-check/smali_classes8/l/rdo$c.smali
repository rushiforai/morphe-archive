.class public Ll/rdo$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rdo;->U(Landroid/view/Menu;IZLl/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rdo;


# direct methods
.method public constructor <init>(Ll/rdo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rdo$c;->a:Ll/rdo;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rdo$c;->a:Ll/rdo;

    .line 2
    .line 3
    invoke-static {v0}, Ll/rdo;->s(Ll/rdo;)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/rdo$c;->a:Ll/rdo;

    .line 12
    .line 13
    invoke-static {v0}, Ll/rdo;->u(Ll/rdo;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/rdo$c;->a:Ll/rdo;

    .line 21
    .line 22
    invoke-static {v0}, Ll/rdo;->q(Ll/rdo;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    move v1, v2

    .line 36
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/rdo$c;->a:Ll/rdo;

    .line 40
    .line 41
    invoke-static {p0}, Ll/rdo;->p(Ll/rdo;)Ll/xco;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Ll/xco;->k:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return v2
.end method

.method public b(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
