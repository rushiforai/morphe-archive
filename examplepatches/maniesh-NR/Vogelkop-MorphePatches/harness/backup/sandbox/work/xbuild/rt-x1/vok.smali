.class public final Lvok;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/util/List;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/util/List;

.field public final e:Lrgh;


# direct methods
.method public constructor <init>(ILjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lvok;->a:I

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lvok;->b:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [Ljava/lang/String;

    const/4 v0, 0x0

    move v1, v0

    :goto_19
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_56

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_34

    aput-object v2, p1, v1

    const-string v2, "*"

    aput-object v2, p2, v1

    goto :goto_53

    :cond_34
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, p1, v1

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, p2, v1

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_53

    aget-object v2, p2, v1

    const/4 v3, 0x1

    invoke-static {v3, v0, v2}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, p2, v1

    :cond_53
    :goto_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_56
    new-instance p3, Landroid/util/Pair;

    invoke-direct {p3, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Lrgh;

    new-instance p2, Lyv4;

    iget-object v0, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/String;

    const/4 v1, 0x5

    invoke-direct {p2, v1}, Lyv4;-><init>(B)V

    iput-object v0, p2, Lyv4;->c:Ljava/lang/Object;

    iget-object p3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p3, [Ljava/lang/String;

    new-instance v0, Ltxi;

    const/16 v1, 0x19

    invoke-direct {v0, p2, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Lrgh;->a:Ljava/lang/Object;

    iput-object p3, p1, Lrgh;->b:Ljava/lang/Object;

    iput-object p1, p0, Lvok;->e:Lrgh;

    iput-object p4, p0, Lvok;->c:Ljava/lang/String;

    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lvok;->d:Ljava/util/List;

    return-void
.end method
