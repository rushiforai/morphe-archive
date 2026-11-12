.class public final Lw3i;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ln0f;

.field public u:Landroid/graphics/Bitmap;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lx3i;

.field public x:I


# direct methods
.method public constructor <init>(Lx3i;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lw3i;->w:Lx3i;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lw3i;->v:Ljava/lang/Object;

    iget p1, p0, Lw3i;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lw3i;->x:I

    iget-object p1, p0, Lw3i;->w:Lx3i;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lx3i;->b(Ln0f;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
