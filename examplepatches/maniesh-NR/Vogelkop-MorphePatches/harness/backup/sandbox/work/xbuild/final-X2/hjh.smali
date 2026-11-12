.class public final Lhjh;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Landroid/graphics/Bitmap;

.field public u:Lcom/opera/hype/image/editor/EditImage;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lxbf;

.field public x:I


# direct methods
.method public constructor <init>(Lxbf;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lhjh;->w:Lxbf;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lhjh;->v:Ljava/lang/Object;

    iget p1, p0, Lhjh;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lhjh;->x:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lhjh;->w:Lxbf;

    invoke-virtual {v1, p1, v0, p1, p0}, Lxbf;->x(Landroid/graphics/Point;FLqnn;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
