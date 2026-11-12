.class public final synthetic Lc5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:J

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(JZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p3, p0, Lc5f;->a:Z

    iput-wide p1, p0, Lc5f;->b:J

    iput-boolean p4, p0, Lc5f;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-boolean v0, p0, Lc5f;->a:Z

    if-eqz v0, :cond_d

    const-string v0, "user_sd_plus"

    goto :goto_f

    :cond_d
    const-string v0, "user"

    :goto_f
    iget-object v1, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->L()Lkq0;

    move-result-object v2

    iget-object p1, p1, Ltd0;->b:Lqd0;

    invoke-virtual {p1}, Lqd0;->C0()Lif0;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lesg;

    invoke-direct {p1, v1, v2}, Lesg;-><init>(Lzpa;Lkq0;)V

    iget-object p1, p1, Lesg;->c:Ljava/lang/Object;

    check-cast p1, Lkq0;

    const/4 v0, 0x1

    new-array v1, v0, [J

    const/4 v2, 0x0

    iget-wide v3, p0, Lc5f;->b:J

    aput-wide v3, v1, v2

    invoke-virtual {p1}, Lkq0;->y()Lhf0;

    move-result-object v2

    new-instance v3, La82;

    invoke-direct {v3, v1, v0}, La82;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    iget-boolean p0, p0, Lc5f;->c:Z

    const-wide/16 v1, 0x1

    if-eqz p0, :cond_49

    const/4 p0, 0x3

    invoke-virtual {p1, p0, v0, v1, v2}, Ljf0;->p(IIJ)V

    goto :goto_4d

    :cond_49
    const/4 p0, 0x5

    invoke-virtual {p1, p0, v0, v1, v2}, Ljf0;->p(IIJ)V

    :goto_4d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
