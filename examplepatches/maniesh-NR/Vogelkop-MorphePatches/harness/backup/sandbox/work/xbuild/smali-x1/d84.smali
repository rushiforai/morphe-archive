.class public final Ld84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lysd;


# instance fields
.field public a:Lc84;


# virtual methods
.method public final l(I)V
    .registers 3

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lj7c;->a(II)Z

    move-result p1

    if-eqz p1, :cond_a

    const/4 p1, 0x0

    iput-object p1, p0, Ld84;->a:Lc84;

    :cond_a
    return-void
.end method
