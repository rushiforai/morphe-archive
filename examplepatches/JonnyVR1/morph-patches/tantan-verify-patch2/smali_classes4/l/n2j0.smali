.class public Ll/n2j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qa3;


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lcom/sunshine/engine/particle/SceneView;


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

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p2}, Ll/n2j0;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/n2j0;->b:Lv/VText;

    .line 9
    .line 10
    new-instance p2, Ll/m2j0;

    .line 11
    .line 12
    invoke-direct {p2, p1}, Ll/m2j0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2j0;->a:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Ll/n2j0;->a:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ll/n2j0;->a:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ne v1, p1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/n2j0;->a:Lv/VImage;

    .line 24
    .line 25
    xor-int/lit8 v2, p1, 0x1

    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/n2j0;->b:Lv/VText;

    .line 31
    .line 32
    invoke-static {v1, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/n2j0;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 36
    .line 37
    invoke-static {v1, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/n2j0;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/sunshine/engine/base/AnimView;->e()V

    .line 43
    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Ll/n2j0;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 48
    .line 49
    const-string v1, "animations/boost/config.xml"

    .line 50
    .line 51
    const-string v2, "animations/boost/pic"

    .line 52
    .line 53
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/n2j0;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/AnimView;->b(Z)Lcom/sunshine/engine/base/AnimView;

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2j0;->b:Lv/VText;

    .line 2
    .line 3
    const-string p2, "%sx"

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic e()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n2j0;->h()Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/o2j0;->b(Ll/n2j0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()Lcom/sunshine/engine/particle/SceneView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2j0;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    return-object p0
.end method
