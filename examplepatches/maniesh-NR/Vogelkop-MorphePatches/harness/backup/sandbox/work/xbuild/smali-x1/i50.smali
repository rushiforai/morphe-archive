.class public final Li50;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lqb7;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lqb7;

.field public w:I


# direct methods
.method public constructor <init>(Lqb7;Lnt5;)V
    .registers 3

    iput-object p1, p0, Li50;->v:Lqb7;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Li50;->u:Ljava/lang/Object;

    iget p1, p0, Li50;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Li50;->w:I

    iget-object p1, p0, Li50;->v:Lqb7;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, p0}, Lqb7;->o(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
