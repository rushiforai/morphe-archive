.class public final Lv6d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqq6;

.field public b:Lt6d;


# direct methods
.method public constructor <init>(Lqq6;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv6d;->a:Lqq6;

    sget-object p1, Lt6d;->a:Lt6d;

    iput-object p1, p0, Lv6d;->b:Lt6d;

    return-void
.end method


# virtual methods
.method public final a()Lt6d;
    .registers 3

    iget-object p0, p0, Lv6d;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv6d;

    iget-object v1, v1, Lv6d;->b:Lt6d;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_b

    :cond_22
    sget-object p0, Lt6d;->f:Lh58;

    invoke-virtual {p0, v0}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt6d;

    return-object p0
.end method

.method public final b(Lt6d;)V
    .registers 5

    iget-object v0, p0, Lv6d;->b:Lt6d;

    if-eq v0, p1, :cond_2d

    invoke-virtual {p0}, Lv6d;->a()Lt6d;

    move-result-object v0

    iput-object p1, p0, Lv6d;->b:Lt6d;

    sget-object v1, Lt6d;->a:Lt6d;

    iget-object v2, p0, Lv6d;->a:Lqq6;

    if-ne p1, v1, :cond_18

    iget-object p1, v2, Lqq6;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_18
    iget-object p1, v2, Lqq6;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_1f
    invoke-virtual {p0}, Lv6d;->a()Lt6d;

    move-result-object p0

    if-eq p0, v0, :cond_2d

    new-instance p1, Lu6d;

    invoke-direct {p1, p0}, Lu6d;-><init>(Lt6d;)V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    :cond_2d
    return-void
.end method
