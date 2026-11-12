.class public final Lnth;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lpqh;

.field public u:Lpqh;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lkt5;

.field public x:I


# direct methods
.method public constructor <init>(Lkt5;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lnth;->w:Lkt5;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lnth;->v:Ljava/lang/Object;

    iget p1, p0, Lnth;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lnth;->x:I

    iget-object p1, p0, Lnth;->w:Lkt5;

    invoke-virtual {p1, p0}, Lkt5;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
