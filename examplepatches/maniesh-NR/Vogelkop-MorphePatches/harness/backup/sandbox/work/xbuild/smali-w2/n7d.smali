.class public final Ln7d;
.super Lnt5;


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public u:I

.field public final synthetic v:Lz78;


# direct methods
.method public constructor <init>(Lz78;Lmt5;)V
    .registers 3

    iput-object p1, p0, Ln7d;->v:Lz78;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ln7d;->t:Ljava/lang/Object;

    iget p1, p0, Ln7d;->u:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ln7d;->u:I

    iget-object p1, p0, Ln7d;->v:Lz78;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lz78;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
