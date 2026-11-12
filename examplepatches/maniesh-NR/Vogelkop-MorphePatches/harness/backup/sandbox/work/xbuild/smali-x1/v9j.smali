.class public final Lv9j;
.super Lh42;
.source "SourceFile"


# instance fields
.field public final n:Lu9j;

.field public final o:Lkze;

.field public p:Z


# direct methods
.method public constructor <init>(Lu9j;)V
    .registers 3

    invoke-direct {p0}, Lh42;-><init>()V

    iput-object p1, p0, Lv9j;->n:Lu9j;

    new-instance p1, Lkze;

    sget-object v0, Log;->a:Log;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lv9j;->o:Lkze;

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 4

    invoke-super {p0}, Lh42;->l()V

    iget-boolean v0, p0, Lv9j;->p:Z

    iget-object v1, p0, Lv9j;->o:Lkze;

    iget-object v2, p0, Lv9j;->n:Lu9j;

    if-nez v0, :cond_11

    const/4 v0, 0x1

    iput-boolean v0, p0, Lv9j;->p:Z

    invoke-interface {v2, v1}, Lu9j;->m(Lkze;)V

    :cond_11
    sget-object p0, Lng;->a:Lng;

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-interface {v2}, Lu9j;->j()V

    return-void
.end method

.method public final m()V
    .registers 2

    invoke-super {p0}, Lh42;->m()V

    iget-object v0, p0, Lv9j;->n:Lu9j;

    invoke-interface {v0}, Lu9j;->onStopped()V

    iget-object p0, p0, Lv9j;->o:Lkze;

    sget-object v0, Log;->a:Log;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
