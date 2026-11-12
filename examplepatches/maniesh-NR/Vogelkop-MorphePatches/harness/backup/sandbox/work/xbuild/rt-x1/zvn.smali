.class public final Lzvn;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/Exception;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Ldwn;

.field public w:I


# direct methods
.method public constructor <init>(Ldwn;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lzvn;->v:Ldwn;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lzvn;->u:Ljava/lang/Object;

    iget p1, p0, Lzvn;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lzvn;->w:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lzvn;->v:Ldwn;

    invoke-virtual {v1, p1, v0, p0}, Ldwn;->c(ILjava/lang/Exception;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
