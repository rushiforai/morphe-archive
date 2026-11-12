.class public final Lfg7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrf7;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ll76;

.field public d:J

.field public e:J

.field public f:Z

.field public g:I

.field public final h:Lig;


# direct methods
.method public constructor <init>(Lrf7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfg7;->b:Ljava/util/ArrayList;

    new-instance v0, Ll76;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ll76;-><init>(I)V

    iput-object v0, p0, Lfg7;->c:Ll76;

    new-instance v0, Lig;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfg7;->h:Lig;

    iput-object p1, p0, Lfg7;->a:Lrf7;

    new-instance v0, Lag;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lag;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lrf7;->b(Lqf7;)V

    return-void
.end method

.method public static c(Lre7;)Z
    .registers 2

    invoke-virtual {p0}, Lre7;->p()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lre7;->q()Z

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final a(Lbg;)V
    .registers 6

    iget-object v0, p0, Lfg7;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_21

    invoke-virtual {p0}, Lfg7;->b()V

    iget-boolean v0, p0, Lfg7;->f:Z

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    iput v0, p0, Lfg7;->g:I

    iget-object v0, p0, Lfg7;->h:Lig;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lig;->run()V

    :cond_21
    iget-boolean v0, p0, Lfg7;->f:Z

    if-eqz v0, :cond_2c

    iget-wide v0, p0, Lfg7;->d:J

    iget-wide v2, p0, Lfg7;->e:J

    invoke-virtual {p1, v0, v1, v2, v3}, Lbg;->b(JJ)V

    :cond_2c
    return-void
.end method

.method public final b()V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lfg7;->f:Z

    iget-object v0, p0, Lfg7;->a:Lrf7;

    iget-object v0, v0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-static {v1}, Lfg7;->c(Lre7;)Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-virtual {v1}, Lre7;->m()Z

    move-result v1

    if-eqz v1, :cond_f

    const/4 v0, 0x1

    iput-boolean v0, p0, Lfg7;->f:Z

    :cond_2a
    return-void
.end method
