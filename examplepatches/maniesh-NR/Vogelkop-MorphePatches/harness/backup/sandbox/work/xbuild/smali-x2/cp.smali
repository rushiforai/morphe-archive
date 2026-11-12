.class public final Lcp;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final a:Lmq;

.field public final b:I

.field public final c:Ljava/util/List;


# direct methods
.method public constructor <init>(Lmq;ILjava/util/List;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcp;->a:Lmq;

    iput p2, p0, Lcp;->b:I

    iput-object p3, p0, Lcp;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 5

    new-instance p2, Ldp;

    iget v0, p0, Lcp;->b:I

    iget-object v1, p0, Lcp;->c:Ljava/util/List;

    iget-object p0, p0, Lcp;->a:Lmq;

    invoke-direct {p2, p1, p0, v0, v1}, Ldp;-><init>(Lmej;Lmq;ILjava/util/List;)V

    return-object p2
.end method
