.class public Ll/gf2;
.super Ll/g1e;
.source "SourceFile"

# interfaces
.implements Ll/f3m;
.implements Ll/d3m;


# instance fields
.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/z2m;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, v0}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/gf2;->j:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public E()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gf2;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/gf2;->j:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/gf2;->j:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/g1e;->show()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public a()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gf2;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gf2;->k:Ll/z2m;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/gf2;->k:Ll/z2m;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Ll/al80;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gf2;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public i(Ll/z2m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gf2;->k:Ll/z2m;

    .line 2
    .line 3
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gf2;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
