.class public final Lz9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljjm;
.implements Lkjm;


# instance fields
.field public final a:Lb2l;

.field public final b:I

.field public final c:Ljjm;

.field public final d:Z

.field public e:Lkjm;


# direct methods
.method public constructor <init>(Lb2l;ILjjm;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz9l;->a:Lb2l;

    iput p2, p0, Lz9l;->b:I

    iput-object p3, p0, Lz9l;->c:Ljjm;

    iput-boolean p4, p0, Lz9l;->d:Z

    return-void
.end method


# virtual methods
.method public final finish(Lhjm;)V
    .registers 2

    sget-object p1, Lhjm;->b:Lhjm;

    iget-object p0, p0, Lz9l;->c:Ljjm;

    invoke-interface {p0, p1}, Ljjm;->finish(Lhjm;)V

    return-void
.end method

.method public final getDefaultPriority()Lijm;
    .registers 1

    iget-object p0, p0, Lz9l;->c:Ljjm;

    invoke-interface {p0}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object p0

    return-object p0
.end method

.method public final o(Ljjm;Lhjm;)V
    .registers 3

    iget-object p1, p0, Lz9l;->e:Lkjm;

    invoke-interface {p1, p0, p2}, Lkjm;->o(Ljjm;Lhjm;)V

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 3

    iget-object v0, p0, Lz9l;->c:Ljjm;

    invoke-interface {v0, p0}, Ljjm;->setRequestDismisser(Lkjm;)V

    iput-object p1, p0, Lz9l;->e:Lkjm;

    return-void
.end method
