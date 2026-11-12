.class public final Lb2f;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Le2f;

.field public v:I


# direct methods
.method public constructor <init>(Le2f;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lb2f;->u:Le2f;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lb2f;->t:Ljava/lang/Object;

    iget p1, p0, Lb2f;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lb2f;->v:I

    iget-object p1, p0, Lb2f;->u:Le2f;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Le2f;->b(Ljoc;Lnt5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0
.end method
