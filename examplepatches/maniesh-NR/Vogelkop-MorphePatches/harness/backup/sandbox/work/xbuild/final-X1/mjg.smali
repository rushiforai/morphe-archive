.class public final synthetic Lmjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lod3;


# instance fields
.field public final synthetic a:Lokg;


# direct methods
.method public synthetic constructor <init>(Lokg;)V
    .registers 2

    iput-object p1, p0, Lmjg;->a:Lokg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Integer;Lqjd;)V
    .registers 4

    iget-object p0, p0, Lmjg;->a:Lokg;

    invoke-virtual {p0, p2}, Lokg;->c(Lqjd;)Legd;

    move-result-object p2

    if-eqz p2, :cond_1c

    iget p2, p2, Legd;->e:I

    const/high16 v0, -0x80000000

    if-eq p2, v0, :cond_1c

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p2, p0, Lokg;->c:Llkg;

    invoke-interface {p2, p1}, Llkg;->remove(I)V

    iget-object p0, p0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    :cond_1c
    return-void
.end method
