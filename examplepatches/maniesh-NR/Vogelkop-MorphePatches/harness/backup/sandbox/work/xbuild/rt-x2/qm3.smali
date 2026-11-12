.class public final Lqm3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lqm3;


# instance fields
.field public final a:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lqm3;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v0, v1}, Lqm3;-><init>(Ljava/util/List;)V

    sput-object v0, Lqm3;->b:Lqm3;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqm3;->a:Ljava/util/List;

    return-void
.end method

.method public static a(Lml3;Lcom/opera/android/bookmarks/c;)Lqm3;
    .registers 10

    invoke-interface {p0}, Lml3;->h()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lqm3;->b:Lqm3;

    return-object p0

    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v2

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0}, Lml3;->h()Z

    move-result v6

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object v5

    new-instance v1, Lkkj;

    invoke-direct/range {v1 .. v6}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p0, p1}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p0

    :goto_2a
    if-eqz p0, :cond_4f

    invoke-interface {p0}, Lml3;->h()Z

    move-result v1

    if-nez v1, :cond_4f

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v3

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lml3;->h()Z

    move-result v7

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object v6

    new-instance v2, Lkkj;

    invoke-direct/range {v2 .. v7}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p0, p1}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p0

    goto :goto_2a

    :cond_4f
    new-instance p0, Lqm3;

    invoke-direct {p0, v0}, Lqm3;-><init>(Ljava/util/List;)V

    return-object p0
.end method


# virtual methods
.method public final b(Li53;)Lml3;
    .registers 7

    check-cast p1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    iget-object p0, p0, Lqm3;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_e
    if-ltz v0, :cond_2e

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkkj;

    iget-wide v2, v1, Ljkj;->a:J

    const/4 v4, 0x0

    invoke-static {v2, v3, p1, v4}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object v2

    instance-of v3, v2, Lml3;

    if-eqz v3, :cond_25

    check-cast v2, Lml3;

    move-object p1, v2

    goto :goto_2b

    :cond_25
    invoke-static {v1, p1}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object p1

    check-cast p1, Lml3;

    :goto_2b
    add-int/lit8 v0, v0, -0x1

    goto :goto_e

    :cond_2e
    return-object p1
.end method
