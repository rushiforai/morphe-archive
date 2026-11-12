.class public final Louk;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/Throwable;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Ln1f;

.field public w:I


# direct methods
.method public constructor <init>(Ln1f;Lnt5;)V
    .registers 3

    iput-object p1, p0, Louk;->v:Ln1f;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Louk;->u:Ljava/lang/Object;

    iget p1, p0, Louk;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Louk;->w:I

    iget-object p1, p0, Louk;->v:Ln1f;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ln1f;->d(Ljava/lang/Throwable;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
