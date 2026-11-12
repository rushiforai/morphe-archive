.class public final Lsmk;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/util/List;

.field public u:Ljava/lang/String;

.field public v:Ljava/util/Iterator;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ltmk;

.field public y:I


# direct methods
.method public constructor <init>(Ltmk;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lsmk;->x:Ltmk;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lsmk;->w:Ljava/lang/Object;

    iget p1, p0, Lsmk;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lsmk;->y:I

    iget-object p1, p0, Lsmk;->x:Ltmk;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ltmk;->k(Ljava/util/List;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
