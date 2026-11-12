.class public final Lxi9;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:J

.field public u:J

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lzi9;

.field public x:I


# direct methods
.method public constructor <init>(Lzi9;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lxi9;->w:Lzi9;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lxi9;->v:Ljava/lang/Object;

    iget p1, p0, Lxi9;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lxi9;->x:I

    iget-object p1, p0, Lxi9;->w:Lzi9;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1, p0}, Lzi9;->a(JLnt5;)Ljava/io/Serializable;

    move-result-object p0

    return-object p0
.end method
