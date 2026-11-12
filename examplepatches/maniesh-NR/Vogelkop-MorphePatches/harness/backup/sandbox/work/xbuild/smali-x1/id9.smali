.class public final Lid9;
.super Lalo;
.source "SourceFile"


# instance fields
.field public final synthetic l:Ljd9;


# direct methods
.method public constructor <init>(Ljd9;)V
    .registers 3

    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lalo;-><init>(B)V

    iput-object p1, p0, Lid9;->l:Ljd9;

    return-void
.end method


# virtual methods
.method public final t()V
    .registers 2

    iget-object p0, p0, Lid9;->l:Ljd9;

    invoke-virtual {p0}, Lryl;->i0()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Ljd9;->y0()V

    invoke-virtual {p0}, Ljd9;->z0()V

    return-void
.end method
