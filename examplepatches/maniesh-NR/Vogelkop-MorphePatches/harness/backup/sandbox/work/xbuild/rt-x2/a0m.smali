.class public final La0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lzzl;

.field public u:Lpfe;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Ld0m;

.field public x:I


# direct methods
.method public constructor <init>(Ld0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, La0m;->w:Ld0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, La0m;->v:Ljava/lang/Object;

    iget p1, p0, La0m;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, La0m;->x:I

    iget-object p1, p0, La0m;->w:Ld0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ld0m;->a(Lzzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
