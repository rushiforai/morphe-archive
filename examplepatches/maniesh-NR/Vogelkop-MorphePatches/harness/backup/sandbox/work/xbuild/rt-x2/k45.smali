.class public final Lk45;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpna;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/util/ArrayList;

.field public final d:Lnd3;


# direct methods
.method public constructor <init>(Lpna;Ljava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk45;->a:Lpna;

    iput-object p2, p0, Lk45;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lk45;->c:Ljava/util/ArrayList;

    new-instance p1, Lnd3;

    const/4 p2, 0x7

    invoke-direct {p1, p2}, Lnd3;-><init>(B)V

    iput-object p1, p0, Lk45;->d:Lnd3;

    return-void
.end method


# virtual methods
.method public final a(Lf45;Lkuk;)V
    .registers 4

    new-instance v0, Ljga;

    invoke-direct {v0, p1, p2}, Ljga;-><init>(Lf45;Lkuk;)V

    iget-object p0, p0, Lk45;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
