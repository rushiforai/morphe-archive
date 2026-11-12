.class public final Ld2f;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/util/List;

.field public u:Ljava/util/ArrayList;

.field public v:Ljava/util/Iterator;

.field public w:Ljava/lang/Object;

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Le2f;

.field public z:I


# direct methods
.method public constructor <init>(Le2f;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ld2f;->y:Le2f;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ld2f;->x:Ljava/lang/Object;

    iget p1, p0, Ld2f;->z:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ld2f;->z:I

    iget-object p1, p0, Ld2f;->y:Le2f;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Le2f;->d(Ljava/util/List;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
