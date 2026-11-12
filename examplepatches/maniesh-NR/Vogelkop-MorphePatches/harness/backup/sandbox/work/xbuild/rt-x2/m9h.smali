.class public final Lm9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk9h;


# instance fields
.field public final a:Lbtg;


# direct methods
.method public constructor <init>(Lbtg;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm9h;->a:Lbtg;

    return-void
.end method


# virtual methods
.method public final a([B[B)V
    .registers 6

    iget-object p0, p0, Lm9h;->a:Lbtg;

    iget-object p0, p0, Lbtg;->a:Ljava/util/HashMap;

    sget-object v0, Lbtg;->b:Lm54;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    array-length v1, p1

    const/4 v2, 0x5

    if-lt v1, v2, :cond_20

    array-length v1, p1

    if-le v2, v1, :cond_14

    array-length v2, p1

    :cond_14
    new-instance v1, Lm54;

    invoke-direct {v1, p1, v2}, Lm54;-><init>([BI)V

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    goto :goto_21

    :cond_20
    const/4 p0, 0x0

    :goto_21
    if-nez v0, :cond_2d

    if-nez p0, :cond_2b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_35

    :cond_2b
    move-object v0, p0

    goto :goto_35

    :cond_2d
    if-eqz p0, :cond_35

    new-instance v1, Le5d;

    invoke-direct {v1, p0, v0}, Le5d;-><init>(Ljava/util/List;Ljava/util/List;)V

    move-object v0, v1

    :cond_35
    :goto_35
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :catch_39
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll9h;

    :try_start_45
    iget-object v0, v0, Ll9h;->a:Lk9h;

    invoke-interface {v0, p1, p2}, Lk9h;->a([B[B)V
    :try_end_4a
    .catch Ljava/security/GeneralSecurityException; {:try_start_45 .. :try_end_4a} :catch_39

    return-void

    :cond_4b
    const-string p0, "invalid signature"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-void
.end method
