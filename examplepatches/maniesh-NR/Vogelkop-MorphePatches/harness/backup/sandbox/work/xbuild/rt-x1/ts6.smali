.class public final Lts6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:J

.field public u:Loi9;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lvs6;

.field public x:I


# direct methods
.method public constructor <init>(Lvs6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lts6;->w:Lvs6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iput-object p1, p0, Lts6;->v:Ljava/lang/Object;

    iget p1, p0, Lts6;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lts6;->x:I

    const-wide/16 v0, 0x0

    const/4 p1, 0x0

    iget-object v2, p0, Lts6;->w:Lvs6;

    invoke-virtual {v2, v0, v1, p1, p0}, Lvs6;->c(JLoi9;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
