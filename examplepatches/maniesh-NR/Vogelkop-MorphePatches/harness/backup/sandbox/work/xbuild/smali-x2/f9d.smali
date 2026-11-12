.class public final Lf9d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lwv1;

.field public final b:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Lwv1;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf9d;->a:Lwv1;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lf9d;->b:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final a(Loup;)V
    .registers 8

    instance-of v0, p1, Ld9d;

    const/16 v1, 0x10

    iget-object v2, p0, Lf9d;->a:Lwv1;

    if-eqz v0, :cond_47

    check-cast p1, Ld9d;

    iget-object v0, p1, Ld9d;->f:Ljava/lang/String;

    iget-wide v3, p1, Ld9d;->g:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    new-instance v5, Lkotlin/Pair;

    invoke-direct {v5, v0, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lf9d;->b:Ljava/util/LinkedHashSet;

    invoke-interface {p0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_46

    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Bad adlist: size="

    const-string v0, ", name=\'"

    invoke-static {v3, v4, p1, v0, p0}, Lsko;->q(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\'"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v2, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorm;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1, p0}, Lx5f;->R(ILjava/lang/String;)V

    :cond_46
    return-void

    :cond_47
    instance-of p0, p1, Le9d;

    if-eqz p0, :cond_63

    check-cast p1, Le9d;

    iget-object p0, p1, Le9d;->f:Ljava/lang/String;

    const-string p1, "Fetch error: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, v2, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorm;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1, p0}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_63
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
