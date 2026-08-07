.class public abstract Ll/nx2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/im4;


# instance fields
.field public a:Ll/im4;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nx2;->a:Ll/im4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/im4;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nx2;->a:Ll/im4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/im4;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public c(Ll/im4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nx2;->a:Ll/im4;

    .line 2
    .line 3
    return-void
.end method

.method public abstract d(Landroid/view/View;I)V
.end method

.method public abstract e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;
.end method

.method public abstract f()I
.end method

.method public abstract g(I)Ljava/lang/Object;
.end method

.method public abstract h(I)I
.end method

.method public abstract i(I)Ljava/lang/String;
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract l(Landroid/view/View;Z)V
.end method

.method public abstract m(Ll/txl0;)V
.end method
