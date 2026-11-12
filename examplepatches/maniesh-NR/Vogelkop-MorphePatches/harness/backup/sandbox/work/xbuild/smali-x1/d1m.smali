.class public final Ld1m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lyzl;

.field public u:Z

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lg1m;

.field public x:I


# direct methods
.method public constructor <init>(Lg1m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ld1m;->w:Lg1m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Ld1m;->v:Ljava/lang/Object;

    iget p1, p0, Ld1m;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ld1m;->x:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Ld1m;->w:Lg1m;

    invoke-virtual {v1, p1, v0, p0}, Lg1m;->b(Lyzl;ZLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
