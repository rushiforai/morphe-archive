.class public final synthetic Llul;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(JI)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Llul;->a:J

    iput-byte p3, p0, Llul;->b:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-wide v0, p0, Llul;->a:J

    iget-byte p0, p0, Llul;->b:B

    check-cast p1, Losk;

    const-string v2, "SELECT * FROM activity WHERE lastAccess > ? ORDER BY lastAccess DESC, url ASC LIMIT ?"

    invoke-virtual {p1, v2}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p1

    const/4 v2, 0x1

    :try_start_d
    invoke-virtual {p1, v2, v0, v1}, Lwsk;->T0(IJ)V

    const/4 v0, 0x2

    int-to-long v1, p0

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    const-string p0, "url"

    invoke-static {p1, p0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result p0

    const-string v0, "lastAccess"

    invoke-static {p1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_26
    invoke-virtual {p1}, Lwsk;->n()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-virtual {p1, p0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0}, Lwsk;->getLong(I)J

    move-result-wide v3

    new-instance v5, Lih;

    invoke-direct {v5, v2, v3, v4}, Lih;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3c
    .catchall {:try_start_d .. :try_end_3c} :catchall_41

    goto :goto_26

    :cond_3d
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    return-object v1

    :catchall_41
    move-exception p0

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    throw p0
.end method
