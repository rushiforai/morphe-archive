.class public final Lt0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lyzl;

.field public u:Lh46;

.field public v:Ljava/math/BigInteger;

.field public w:Z

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Lx0m;

.field public z:I


# direct methods
.method public constructor <init>(Lx0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lt0m;->y:Lx0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lt0m;->x:Ljava/lang/Object;

    iget p1, p0, Lt0m;->z:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lt0m;->z:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lt0m;->y:Lx0m;

    invoke-virtual {v1, p1, p1, v0, p0}, Lx0m;->c(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
