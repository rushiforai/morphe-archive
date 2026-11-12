.class public final Lc6d;
.super Lnt5;


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public u:I

.field public final synthetic v:Lyc1;


# direct methods
.method public constructor <init>(Lyc1;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lc6d;->v:Lyc1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lc6d;->t:Ljava/lang/Object;

    iget p1, p0, Lc6d;->u:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lc6d;->u:I

    iget-object p1, p0, Lc6d;->v:Lyc1;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lyc1;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
