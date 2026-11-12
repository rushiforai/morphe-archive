.class public final Lh18;
.super Lzrj;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Le18;

.field public final synthetic c:Li18;

.field public final synthetic d:Z

.field public final synthetic e:Lorg/chromium/url/GURL;


# direct methods
.method public constructor <init>(Le18;Li18;ZLorg/chromium/url/GURL;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh18;->b:Le18;

    iput-object p2, p0, Lh18;->c:Li18;

    iput-boolean p3, p0, Lh18;->d:Z

    iput-object p4, p0, Lh18;->e:Lorg/chromium/url/GURL;

    return-void
.end method


# virtual methods
.method public final a(Lna3;I)V
    .registers 5

    check-cast p1, Lasj;

    const/4 p1, 0x4

    iget-object v0, p0, Lh18;->b:Le18;

    const/4 v1, 0x1

    if-ne p2, p1, :cond_b

    invoke-virtual {v0, v1}, Le18;->b(Z)V

    :cond_b
    invoke-virtual {v0}, Le18;->a()V

    iget-boolean p1, p0, Lh18;->a:Z

    if-nez p1, :cond_36

    iput-boolean v1, p0, Lh18;->a:Z

    iget-object p1, p0, Lh18;->c:Li18;

    iget-object v0, p1, Li18;->b:Lx5f;

    if-ne p2, v1, :cond_37

    sget-object p2, Lfq0;->b:Lfq0;

    invoke-virtual {v0, p2}, Lx5f;->U(Lfq0;)V

    iget-boolean p2, p0, Lh18;->d:Z

    if-eqz p2, :cond_36

    iget-object p1, p1, Li18;->c:Lhd;

    iget-object p0, p0, Lh18;->e:Lorg/chromium/url/GURL;

    iget-object p0, p0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    iget-boolean p2, p1, Lhd;->b:Z

    if-eqz p2, :cond_36

    new-instance p2, Lu5f;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p1, p2}, Lhd;->t(Lkotlin/jvm/functions/Function1;)V

    :cond_36
    return-void

    :cond_37
    sget-object p0, Lfq0;->c:Lfq0;

    invoke-virtual {v0, p0}, Lx5f;->U(Lfq0;)V

    return-void
.end method

.method public final bridge synthetic b(Lna3;)V
    .registers 2

    check-cast p1, Lasj;

    invoke-virtual {p0, p1}, Lh18;->c(Lasj;)V

    return-void
.end method

.method public final c(Lasj;)V
    .registers 3

    iget-object v0, p0, Lh18;->c:Li18;

    iget-object v0, v0, Li18;->e:Lci7;

    iget-object p1, p1, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {v0, p1}, Lci7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lh18;->b:Le18;

    const/4 v0, 0x1

    iput-boolean v0, p0, Le18;->d:Z

    xor-int/2addr p1, v0

    invoke-virtual {p0, p1}, Le18;->b(Z)V

    iget-boolean p1, p0, Le18;->g:Z

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Le18;->a()V

    :cond_20
    return-void
.end method
