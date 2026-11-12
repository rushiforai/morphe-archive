.class public final Li9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqw1;


# instance fields
.field public final synthetic a:Lj9k;


# direct methods
.method public constructor <init>(Lj9k;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li9k;->a:Lj9k;

    return-void
.end method


# virtual methods
.method public final a(Lpw1;)V
    .registers 9

    iget-object p0, p0, Li9k;->a:Lj9k;

    invoke-virtual {p0}, Lj9k;->d()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Lj9k;->e:Li9k;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    sget-object v2, Lxw1;->b:Lvzk;

    iget-object v2, v2, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Li7f;

    invoke-virtual {v2, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iput-object v1, p0, Lj9k;->e:Li9k;

    :cond_19
    sget-object v0, Lrw1;->a:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Low1;

    invoke-virtual {p1, v2}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_58

    const-string v3, "__cb_"

    const-string v4, ""

    invoke-static {v2, v3, v4}, Lkotlin/text/StringsKt;->e0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x6

    const-string v5, "__"

    const/4 v6, 0x0

    invoke-static {v2, v5, v6, v6, v3}, Lkotlin/text/StringsKt;->L(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v3

    const/4 v5, -0x1

    if-eq v3, v5, :cond_4a

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :cond_4a
    invoke-static {v4}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_59

    :cond_58
    move-object v2, v1

    :cond_59
    if-eqz v2, :cond_21

    move-object v1, v2

    :cond_5c
    if-eqz v1, :cond_68

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_68

    invoke-virtual {p0, v1}, Lj9k;->e(Ljava/lang/String;)V

    return-void

    :cond_68
    invoke-virtual {p0}, Lj9k;->c()V

    return-void
.end method
