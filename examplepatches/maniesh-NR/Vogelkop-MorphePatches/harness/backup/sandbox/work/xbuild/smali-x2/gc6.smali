.class public final Lgc6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/io/Serializable;

.field public u:Ljava/util/Iterator;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Li06;

.field public x:I


# direct methods
.method public constructor <init>(Li06;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lgc6;->w:Li06;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lgc6;->v:Ljava/lang/Object;

    iget p1, p0, Lgc6;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lgc6;->x:I

    iget-object p1, p0, Lgc6;->w:Li06;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Li06;->o(Ljava/util/List;Lud6;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
