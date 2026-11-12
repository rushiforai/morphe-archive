.class public final synthetic Lja1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lu5n;

.field public final synthetic b:J

.field public final synthetic c:Z

.field public final synthetic d:Lc8e;

.field public final synthetic e:Lk9f;


# direct methods
.method public synthetic constructor <init>(Lu5n;JZLc8e;Lk9f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lja1;->a:Lu5n;

    iput-wide p2, p0, Lja1;->b:J

    iput-boolean p4, p0, Lja1;->c:Z

    iput-object p5, p0, Lja1;->d:Lc8e;

    iput-object p6, p0, Lja1;->e:Lk9f;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_10

    move v0, v2

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    and-int/2addr p2, v2

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v0}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_3c

    sget-object p2, Lmi5;->t:Lhp7;

    iget-object v0, p0, Lja1;->a:Lu5n;

    invoke-virtual {p2, v0}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object p2

    new-instance v0, Lla1;

    iget-wide v1, p0, Lja1;->b:J

    iget-boolean v3, p0, Lja1;->c:Z

    iget-object v4, p0, Lja1;->d:Lc8e;

    iget-object v5, p0, Lja1;->e:Lk9f;

    invoke-direct/range {v0 .. v5}, Lla1;-><init>(JZLc8e;Lk9f;)V

    const p0, 0x4b1ac501    # 1.0142977E7f

    invoke-static {p0, v0, p1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object p0

    const/16 v0, 0x38

    invoke-static {p2, p0, p1, v0}, Lkfo;->c(Lk7h;Lkotlin/jvm/functions/Function2;Lih5;I)V

    goto :goto_3f

    :cond_3c
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_3f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
