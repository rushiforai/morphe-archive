.class public final Lcle;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Ls9i;

.field public v:I


# direct methods
.method public constructor <init>(Ls9i;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lcle;->u:Ls9i;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iput-object p1, p0, Lcle;->t:Ljava/lang/Object;

    iget p1, p0, Lcle;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcle;->v:I

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    iget-object v0, p0, Lcle;->u:Ls9i;

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Ls9i;->K(JJLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
