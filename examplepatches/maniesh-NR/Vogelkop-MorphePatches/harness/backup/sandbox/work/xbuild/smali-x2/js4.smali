.class public final Ljs4;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lqa6;

.field public u:Lpfe;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lls4;

.field public x:I


# direct methods
.method public constructor <init>(Lls4;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ljs4;->w:Lls4;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ljs4;->v:Ljava/lang/Object;

    iget p1, p0, Ljs4;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ljs4;->x:I

    iget-object p1, p0, Ljs4;->w:Lls4;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lls4;->a(Lqa6;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
