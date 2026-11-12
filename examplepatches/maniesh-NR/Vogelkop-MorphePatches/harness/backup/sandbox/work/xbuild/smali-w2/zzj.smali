.class public final Lzzj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvnj;

.field public final b:Ljava/util/LinkedHashSet;

.field public final c:Ljava/util/LinkedHashSet;

.field public final d:Lwq8;

.field public final e:Lyzj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lvnj;->j:I

    return-void
.end method

.method public constructor <init>(Lvnj;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzzj;->a:Lvnj;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lzzj;->b:Ljava/util/LinkedHashSet;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lzzj;->c:Ljava/util/LinkedHashSet;

    new-instance p1, Lwq8;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lwq8;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lzzj;->d:Lwq8;

    new-instance p1, Lyzj;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lyzj;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lzzj;->e:Lyzj;

    return-void
.end method

.method public static a(Lhq8;)Lknj;
    .registers 7

    new-instance v0, Lknj;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz7h;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Llnj;

    sget-object v3, Lmnj;->c:Lmnj;

    invoke-virtual {p0}, Lhq8;->e()J

    move-result-wide v4

    invoke-direct {v2, v3, v4, v5}, Llnj;-><init>(Lmnj;J)V

    invoke-direct {v0, v1, v2}, Lknj;-><init>(Ljava/lang/String;Llnj;)V

    return-object v0
.end method


# virtual methods
.method public final b(Ltq8;)V
    .registers 6

    iget-object v0, p0, Lzzj;->b:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    iget-object v1, p0, Lzzj;->d:Lwq8;

    invoke-virtual {p1, v1}, Ltq8;->t(Lsq8;)V

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_17
    :goto_17
    if-ge v1, v0, :cond_35

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v3

    if-nez v3, :cond_17

    iget-object v3, p0, Lzzj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    iget-object v3, p0, Lzzj;->e:Lyzj;

    invoke-virtual {v2, v3}, Lhq8;->b(Lgq8;)V

    goto :goto_17

    :cond_35
    return-void
.end method
