.class public final Lbwn;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:I

.field public u:Lpfe;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Ldwn;

.field public x:I


# direct methods
.method public constructor <init>(Ldwn;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lbwn;->w:Ldwn;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lbwn;->v:Ljava/lang/Object;

    iget p1, p0, Lbwn;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lbwn;->x:I

    iget-object p1, p0, Lbwn;->w:Ldwn;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ldwn;->e(ILnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
