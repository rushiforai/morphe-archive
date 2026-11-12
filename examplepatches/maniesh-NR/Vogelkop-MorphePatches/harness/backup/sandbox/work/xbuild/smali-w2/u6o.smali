.class public final Lu6o;
.super Lnt5;


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public u:I

.field public final synthetic v:Lc78;


# direct methods
.method public constructor <init>(Lc78;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lu6o;->v:Lc78;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lu6o;->t:Ljava/lang/Object;

    iget p1, p0, Lu6o;->u:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lu6o;->u:I

    iget-object p1, p0, Lu6o;->v:Lc78;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lc78;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
