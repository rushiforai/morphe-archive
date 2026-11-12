.class public final Lqcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final synthetic a:Lydn;

.field public final synthetic b:Lysj;

.field public final synthetic c:Lgjm;


# direct methods
.method public constructor <init>(Lydn;Lysj;Lgjm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqcn;->a:Lydn;

    iput-object p2, p0, Lqcn;->b:Lysj;

    iput-object p3, p0, Lqcn;->c:Lgjm;

    return-void
.end method


# virtual methods
.method public final s()V
    .registers 5

    iget-object v0, p0, Lqcn;->a:Lydn;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_24

    new-instance v0, Lqt;

    new-instance v1, Lpkm;

    const/16 v2, 0x9

    iget-object v3, p0, Lqcn;->c:Lgjm;

    invoke-direct {v1, v3, v2}, Lpkm;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lqt;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lqcn;->b:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_24
    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method
