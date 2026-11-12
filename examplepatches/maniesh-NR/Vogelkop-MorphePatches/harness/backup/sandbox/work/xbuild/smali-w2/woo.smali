.class public Lwoo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvm;


# instance fields
.field public final a:Lvm;

.field public b:Z

.field public c:I

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lvm;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwoo;->a:Lvm;

    return-void
.end method


# virtual methods
.method public final C(Lcm;)V
    .registers 3

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lwoo;->e:Z

    iget-object p0, p0, Lwoo;->a:Lvm;

    invoke-interface {p0, p1}, Lvm;->C(Lcm;)V

    return-void
.end method

.method public final b()Z
    .registers 2

    iget-boolean v0, p0, Lwoo;->d:Z

    if-nez v0, :cond_a

    iget-boolean p0, p0, Lwoo;->e:Z

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final g()V
    .registers 3

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-nez v0, :cond_e

    iget v0, p0, Lwoo;->c:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lwoo;->c:I

    if-le v0, v1, :cond_f

    :cond_e
    return-void

    :cond_f
    iget-object p0, p0, Lwoo;->a:Lvm;

    invoke-interface {p0}, Lvm;->g()V

    return-void
.end method

.method public final onAdClicked()V
    .registers 2

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lwoo;->a:Lvm;

    invoke-interface {p0}, Lvm;->onAdClicked()V

    return-void
.end method

.method public final onAdDismissed()V
    .registers 2

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lwoo;->d:Z

    iget-object p0, p0, Lwoo;->a:Lvm;

    invoke-interface {p0}, Lvm;->onAdDismissed()V

    return-void
.end method

.method public final onAdOpened()V
    .registers 2

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-nez v0, :cond_a

    iget-boolean v0, p0, Lwoo;->b:Z

    if-eqz v0, :cond_b

    :cond_a
    return-void

    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lwoo;->b:Z

    iget-object p0, p0, Lwoo;->a:Lvm;

    invoke-interface {p0}, Lvm;->onAdOpened()V

    return-void
.end method
