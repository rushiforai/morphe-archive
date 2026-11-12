.class public final Lkx1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:Lsfb;

.field public B:Ljava/util/LinkedHashMap;

.field public C:Ljava/lang/Long;

.field public D:Lehc;

.field public E:Lehc;

.field public F:Ljava/util/Iterator;

.field public synthetic G:Ljava/lang/Object;

.field public final synthetic H:Lole;

.field public I:I

.field public t:Lesk;

.field public u:Lqca;

.field public v:Lwth;

.field public w:Ljava/util/List;

.field public x:Ljava/util/List;

.field public y:Ljava/util/LinkedHashMap;

.field public z:Ljava/util/Iterator;


# direct methods
.method public constructor <init>(Lole;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lkx1;->H:Lole;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lkx1;->G:Ljava/lang/Object;

    iget p1, p0, Lkx1;->I:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lkx1;->I:I

    iget-object p1, p0, Lkx1;->H:Lole;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, p0}, Lole;->x(La12;Lesk;Lqca;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
