.class public final Li0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lyzl;

.field public u:Luzl;

.field public v:Lhth;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lj0m;

.field public y:I


# direct methods
.method public constructor <init>(Lj0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Li0m;->x:Lj0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Li0m;->w:Ljava/lang/Object;

    iget p1, p0, Li0m;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Li0m;->y:I

    iget-object p1, p0, Li0m;->x:Lj0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lj0m;->d(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
