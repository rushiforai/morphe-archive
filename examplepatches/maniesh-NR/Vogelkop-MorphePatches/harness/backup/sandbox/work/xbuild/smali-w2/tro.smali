.class public final Ltro;
.super Lwoo;
.source "SourceFile"

# interfaces
.implements Lidf;


# instance fields
.field public final f:Lidf;

.field public g:Z


# direct methods
.method public constructor <init>(Lvm;Lidf;)V
    .registers 3

    invoke-direct {p0, p1}, Lwoo;-><init>(Lvm;)V

    iput-object p2, p0, Ltro;->f:Lidf;

    return-void
.end method


# virtual methods
.method public final a(La36;)V
    .registers 3

    invoke-virtual {p0}, Lwoo;->b()Z

    move-result v0

    if-nez v0, :cond_a

    iget-boolean v0, p0, Ltro;->g:Z

    if-eqz v0, :cond_b

    :cond_a
    return-void

    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Ltro;->g:Z

    iget-object p0, p0, Ltro;->f:Lidf;

    invoke-interface {p0, p1}, Lidf;->a(La36;)V

    return-void
.end method
