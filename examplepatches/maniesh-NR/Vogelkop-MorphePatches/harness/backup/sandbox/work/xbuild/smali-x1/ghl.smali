.class public final Lghl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgbc;

.field public final b:Ldil;

.field public final c:Lmil;

.field public final d:Z

.field public final e:Z

.field public final f:Lwjl;

.field public final g:Li9f;

.field public final h:Lokm;

.field public final i:Lqi6;

.field public final j:Llw5;

.field public final k:I


# direct methods
.method public constructor <init>(Lgbc;Ldil;Lmil;ZZLwjl;Li9f;Lokm;Lqi6;Llw5;I)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lghl;->a:Lgbc;

    iput-object p2, p0, Lghl;->b:Ldil;

    iput-object p3, p0, Lghl;->c:Lmil;

    iput-boolean p4, p0, Lghl;->d:Z

    iput-boolean p5, p0, Lghl;->e:Z

    iput-object p6, p0, Lghl;->f:Lwjl;

    iput-object p7, p0, Lghl;->g:Li9f;

    iput-object p8, p0, Lghl;->h:Lokm;

    iput-object p9, p0, Lghl;->i:Lqi6;

    iput-object p10, p0, Lghl;->j:Llw5;

    iput p11, p0, Lghl;->k:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 5

    iget-object v0, p0, Lghl;->a:Lgbc;

    iget-object v0, v0, Lgbc;->d:Lc37;

    check-cast p1, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Le49;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Lc37;->b(Ljava/util/List;)Lmil;

    move-result-object p1

    iget-object p0, p0, Lghl;->j:Llw5;

    invoke-virtual {p0, p1}, Llw5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
