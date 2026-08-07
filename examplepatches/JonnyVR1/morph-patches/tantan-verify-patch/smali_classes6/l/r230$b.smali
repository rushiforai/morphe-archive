.class public Ll/r230$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r230;->n(Landroid/view/View;IILl/r230$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/r230$g;

.field public final synthetic c:Ll/r230;


# direct methods
.method public constructor <init>(Ll/r230;Landroid/view/View;Ll/r230$g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r230$b;->c:Ll/r230;

    .line 2
    .line 3
    iput-object p2, p0, Ll/r230$b;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/r230$b;->b:Ll/r230$g;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/r230$b;->c:Ll/r230;

    .line 2
    .line 3
    iget-object v1, p0, Ll/r230$b;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/r230;->j(Ll/r230;Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/r230$b;->c:Ll/r230;

    .line 10
    .line 11
    iget-object v2, p0, Ll/r230$b;->a:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/r230;->i(Ll/r230;Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Ll/r230$b;->c:Ll/r230;

    .line 18
    .line 19
    invoke-static {v2, v0}, Ll/r230;->k(Ll/r230;I)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Ll/r230$b;->c:Ll/r230;

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/r230;->k(Ll/r230;I)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, p0, Ll/r230$b;->c:Ll/r230;

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-static {v2, v3}, Ll/r230;->g(Ll/r230;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/r230$b;->b:Ll/r230$g;

    .line 40
    .line 41
    new-instance v2, Ll/q3d0;

    .line 42
    .line 43
    invoke-direct {v2, v0, v1}, Ll/q3d0;-><init>(II)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p0, v2}, Ll/r230$g;->a(Ll/q3d0;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
