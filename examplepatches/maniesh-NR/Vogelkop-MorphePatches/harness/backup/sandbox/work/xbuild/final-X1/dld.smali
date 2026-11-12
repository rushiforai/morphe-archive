.class public final Ldld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llig;


# instance fields
.field public final synthetic a:Lgld;


# direct methods
.method public constructor <init>(Lgld;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldld;->a:Lgld;

    return-void
.end method


# virtual methods
.method public final b(J)V
    .registers 3

    iget-object p0, p0, Ldld;->a:Lgld;

    iget-object p0, p0, Lgld;->B:Lpgh;

    if-eqz p0, :cond_8

    iput-wide p1, p0, Lpgh;->f:J

    :cond_8
    return-void
.end method

.method public final d(ZZ)V
    .registers 3

    iget-object p0, p0, Ldld;->a:Lgld;

    iget-object p0, p0, Lgld;->B:Lpgh;

    if-eqz p0, :cond_8

    iput-boolean p1, p0, Lpgh;->g:Z

    :cond_8
    return-void
.end method

.method public final f(ZZ)V
    .registers 3

    iget-object p0, p0, Ldld;->a:Lgld;

    iget-object p0, p0, Lgld;->B:Lpgh;

    if-eqz p0, :cond_8

    iput-boolean p2, p0, Lpgh;->h:Z

    :cond_8
    return-void
.end method

.method public final j(ZZZ)V
    .registers 4

    iget-object p0, p0, Ldld;->a:Lgld;

    iget-object p0, p0, Lgld;->B:Lpgh;

    if-eqz p0, :cond_11

    iput-boolean p2, p0, Lpgh;->i:Z

    iput-boolean p3, p0, Lpgh;->j:Z

    if-nez p2, :cond_11

    if-nez p3, :cond_11

    const/4 p1, 0x0

    iput p1, p0, Lpgh;->e:I

    :cond_11
    return-void
.end method
