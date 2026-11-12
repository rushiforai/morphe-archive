.class public final Ldii;
.super Lhji;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Ldx3;

.field public final synthetic c:Lqji;

.field public final synthetic d:[Landroid/print/PageRange;

.field public final synthetic e:Lwjh;

.field public final synthetic f:Lpii;


# direct methods
.method public constructor <init>(Lpii;Ldx3;Lqji;[Landroid/print/PageRange;Lwjh;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldii;->b:Ldx3;

    iput-object p3, p0, Ldii;->c:Lqji;

    iput-object p4, p0, Ldii;->d:[Landroid/print/PageRange;

    iput-object p5, p0, Ldii;->e:Lwjh;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldii;->f:Lpii;

    const/4 p1, 0x1

    iput-boolean p1, p0, Ldii;->a:Z

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 12

    const/4 p2, 0x0

    iput-boolean p2, p0, Ldii;->a:Z

    new-instance v0, Liii;

    iget-object p2, p0, Ldii;->f:Lpii;

    iget-object v3, p2, Lpii;->s:Lumi;

    new-instance v6, Lr9g;

    const/16 v1, 0x19

    iget-object v5, p0, Ldii;->d:[Landroid/print/PageRange;

    invoke-direct {v6, v5, v1}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iget-object v7, p0, Ldii;->e:Lwjh;

    iget-object v8, p2, Lpii;->t:Lx5f;

    iget-object v2, p0, Ldii;->b:Ldx3;

    iget-object v4, p0, Ldii;->c:Lqji;

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Liii;-><init>(Lmej;Ldx3;Lumi;Lqji;[Landroid/print/PageRange;Lr9g;Lwjh;Lx5f;)V

    return-object v0
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    iget-boolean p1, p0, Ldii;->a:Z

    if-eqz p1, :cond_9

    iget-object p0, p0, Ldii;->c:Lqji;

    invoke-virtual {p0}, Lqji;->b()V

    :cond_9
    return-void
.end method
