.class public final Ln9l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:Z

.field public final synthetic c:Lr9l;


# direct methods
.method public constructor <init>(Lr9l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln9l;->c:Lr9l;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ln9l;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Ln9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iget-boolean v2, p0, Ln9l;->b:Z

    if-ne v2, v0, :cond_d

    return-void

    :cond_d
    iget-object v0, p0, Ln9l;->c:Lr9l;

    iget-object v0, v0, Lr9l;->D:Lg4l;

    if-nez v2, :cond_1b

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {v0, v3, v2}, Lg4l;->a(Lg4l;Luz3;I)V

    iput-boolean v1, p0, Ln9l;->b:Z

    return-void

    :cond_1b
    invoke-static {v0}, Lg4l;->e(Lg4l;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Ln9l;->b:Z

    return-void
.end method
