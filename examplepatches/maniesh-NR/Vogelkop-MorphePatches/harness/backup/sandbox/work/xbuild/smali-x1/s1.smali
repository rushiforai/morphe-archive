.class public final Ls1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls1;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ls1;->b:Z

    if-nez p3, :cond_d

    const/4 p1, 0x0

    iput-object p1, p0, Ls1;->c:Ljava/util/HashMap;

    return-void

    :cond_d
    new-instance p1, Ljava/util/HashMap;

    array-length p2, p3

    invoke-direct {p1, p2}, Ljava/util/HashMap;-><init>(I)V

    iput-object p1, p0, Ls1;->c:Ljava/util/HashMap;

    const/4 p1, 0x0

    :goto_16
    array-length p2, p3

    if-ge p1, p2, :cond_25

    iget-object p2, p0, Ls1;->c:Ljava/util/HashMap;

    aget-object v0, p3, p1

    aget-object v1, p4, p1

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p1, p1, 0x1

    goto :goto_16

    :cond_25
    return-void
.end method
