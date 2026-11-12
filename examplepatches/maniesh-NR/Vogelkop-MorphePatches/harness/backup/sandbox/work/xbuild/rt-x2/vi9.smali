.class public final Lvi9;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljdj;

.field public u:Lwi9;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lwi9;

.field public x:I


# direct methods
.method public constructor <init>(Lwi9;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lvi9;->w:Lwi9;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lvi9;->v:Ljava/lang/Object;

    iget p1, p0, Lvi9;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lvi9;->x:I

    iget-object p1, p0, Lvi9;->w:Lwi9;

    invoke-virtual {p1, p0}, Lwi9;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
