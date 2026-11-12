.class public final Loze;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lfdk;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lsze;

.field public w:I


# direct methods
.method public constructor <init>(Lsze;Lnt5;)V
    .registers 3

    iput-object p1, p0, Loze;->v:Lsze;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Loze;->u:Ljava/lang/Object;

    iget p1, p0, Loze;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Loze;->w:I

    iget-object p1, p0, Loze;->v:Lsze;

    invoke-virtual {p1, p0}, Lsze;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
