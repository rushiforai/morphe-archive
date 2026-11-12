.class public final Lojh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyo7;

.field public final b:Lpde;

.field public final c:Lsa2;

.field public d:Lsx8;


# direct methods
.method public constructor <init>(Lyo7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lojh;->a:Lyo7;

    new-instance p1, Lpde;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lojh;->b:Lpde;

    new-instance p1, Lsa2;

    const/4 v0, 0x6

    invoke-direct {p1, v0}, Lsa2;-><init>(B)V

    iput-object p1, p0, Lojh;->c:Lsa2;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    const/16 v0, 0x1f4

    if-lt p1, v0, :cond_6

    const/4 p1, 0x0

    goto :goto_8

    :cond_6
    const/16 p1, 0x8

    :goto_8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Lojh;->b:Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
