.class public final Leoj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:La5l;

.field public final c:Livg;

.field public d:Lhoj;

.field public final e:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lumi;La5l;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leoj;->a:Lumi;

    iput-object p2, p0, Leoj;->b:La5l;

    new-instance p2, Livg;

    invoke-direct {p2, p1}, Livg;-><init>(Lumi;)V

    iput-object p2, p0, Leoj;->c:Livg;

    new-instance p1, Lioj;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lioj;-><init>(B)V

    iput-object p1, p0, Leoj;->d:Lhoj;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Leoj;->e:Ljava/util/ArrayList;

    return-void
.end method
