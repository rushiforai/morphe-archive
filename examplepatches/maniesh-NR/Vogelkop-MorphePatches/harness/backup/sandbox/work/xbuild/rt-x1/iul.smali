.class public final Liul;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Lkul;

.field public v:I


# direct methods
.method public constructor <init>(Lkul;Lnt5;)V
    .registers 3

    iput-object p1, p0, Liul;->u:Lkul;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iput-object p1, p0, Liul;->t:Ljava/lang/Object;

    iget p1, p0, Liul;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Liul;->v:I

    const-wide/16 v0, 0x0

    const/4 p1, 0x0

    iget-object v2, p0, Liul;->u:Lkul;

    invoke-virtual {v2, v0, v1, p1, p0}, Lkul;->e(JILnt5;)Ljava/io/Serializable;

    move-result-object p0

    return-object p0
.end method
