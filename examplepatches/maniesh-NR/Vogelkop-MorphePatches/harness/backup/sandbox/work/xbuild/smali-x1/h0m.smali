.class public final Lh0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lyzl;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lj0m;

.field public w:I


# direct methods
.method public constructor <init>(Lj0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lh0m;->v:Lj0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lh0m;->u:Ljava/lang/Object;

    iget p1, p0, Lh0m;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lh0m;->w:I

    iget-object p1, p0, Lh0m;->v:Lj0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lj0m;->c(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
