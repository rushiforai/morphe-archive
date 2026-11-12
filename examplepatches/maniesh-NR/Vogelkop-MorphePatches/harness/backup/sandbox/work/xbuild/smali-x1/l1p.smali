.class public abstract Ll1p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lsa7;

.field public static final b:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lsa7;

    invoke-direct {v0}, Lsa7;-><init>()V

    monitor-enter v0

    const/16 v1, 0x14

    :try_start_8
    iput-byte v1, v0, Lsa7;->a:B
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_23

    monitor-exit v0

    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-static {v0, v2, v2, v2, v1}, Lsa7;->c(Lsa7;Lokhttp3/internal/connection/RealCall$AsyncCall;Lokhttp3/internal/connection/RealCall;Lokhttp3/internal/connection/RealCall$AsyncCall;I)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lsa7;->d(I)V

    sput-object v0, Ll1p;->a:Lsa7;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ll1p;->b:Ljava/util/Set;

    return-void

    :catchall_23
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V
    .registers 13

    sget-object v0, Ll1p;->b:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    new-instance p0, Lwr9;

    const/16 p2, 0x18

    invoke-direct {p0, p4, p1, p2}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void

    :cond_13
    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    if-eqz p3, :cond_69

    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_69

    const/4 v0, 0x0

    :try_start_24
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2c} :catch_2d

    goto :goto_2e

    :catch_2d
    move-object v1, v0

    :goto_2e
    if-eqz v1, :cond_69

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_69

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_3a
    :goto_3a
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_69

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_3a

    :try_start_4d
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_61} :catch_62

    goto :goto_63

    :catch_62
    move-object v2, v0

    :goto_63
    if-eqz v2, :cond_3a

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_69
    const/4 v3, 0x0

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Ljava/lang/String;

    new-instance v1, Ld5a;

    move-object v2, p1

    move-object v6, p2

    move-object v5, p4

    invoke-direct/range {v1 .. v7}, Ld5a;-><init>(Ljava/io/File;ILjava/util/ArrayList;Ln1p;Ll5b;Ljava/lang/String;)V

    new-instance p0, Lcno;

    const/16 p1, 0x8

    invoke-direct {p0, v6, p1}, Lcno;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lp9p;

    const/16 p2, 0xa

    invoke-direct {p1, v6, p2}, Lp9p;-><init>(Ljava/lang/Object;B)V

    invoke-static {v7, p0, p1, v1}, Ldap;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;

    return-void
.end method
