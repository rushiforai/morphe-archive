.class public final Lkqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/ArrayList;

.field public final d:Lipm;

.field public e:Lkqm;

.field public f:Z

.field public g:D

.field public h:D


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkqm;->a:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_15
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_22

    add-int/lit8 v0, v0, -0x1

    goto :goto_15

    :cond_22
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    :goto_25
    if-ge v2, v0, :cond_46

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v3, :cond_34

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_34
    const/16 v6, 0x8

    shl-long/2addr v4, v6

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide v6, 0x1fffffffffffffffL

    rem-long/2addr v4, v6

    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    :cond_46
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-object v1, p0, Lkqm;->c:Ljava/util/ArrayList;

    new-instance p1, Lipm;

    invoke-direct {p1, p2, p3, p4, p5}, Lipm;-><init>(JJ)V

    iput-object p1, p0, Lkqm;->d:Lipm;

    return-void
.end method


# virtual methods
.method public final b(Lkqm;)V
    .registers 2

    if-ne p1, p0, :cond_3

    return-void

    :cond_3
    iput-object p0, p1, Lkqm;->e:Lkqm;

    iget-object p0, p0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Lkqm;)Z
    .registers 6

    iget-object v0, p0, Lkqm;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p1, Lkqm;->c:Ljava/util/ArrayList;

    iget-object v3, p1, Lkqm;->a:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_38

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    iget-object p1, p1, Lkqm;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p1, v0}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_38

    iget-object p0, p0, Lkqm;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_38

    invoke-virtual {v3, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3a

    :cond_38
    const/4 p0, 0x0

    return p0

    :cond_3a
    return v2
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 1

    iget-object p0, p0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object p0

    return-object p0
.end method
