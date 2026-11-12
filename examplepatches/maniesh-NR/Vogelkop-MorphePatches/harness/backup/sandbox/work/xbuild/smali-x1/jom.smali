.class public final Ljom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lzoo;


# direct methods
.method public constructor <init>(Lzoo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljom;->a:Lzoo;

    return-void
.end method


# virtual methods
.method public final onStart(Lndc;)V
    .registers 2

    iget-object p0, p0, Ljom;->a:Lzoo;

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lh9o;

    if-eqz p0, :cond_c

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lh9o;->c(Z)V

    :cond_c
    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 2

    iget-object p0, p0, Ljom;->a:Lzoo;

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lh9o;

    if-eqz p0, :cond_c

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lh9o;->c(Z)V

    :cond_c
    return-void
.end method
