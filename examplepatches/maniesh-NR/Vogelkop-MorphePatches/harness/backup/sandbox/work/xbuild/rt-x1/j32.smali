.class public final Lj32;
.super Le32;
.source "SourceFile"


# instance fields
.field public final d:Lqii;

.field public final e:Ljava/lang/String;

.field public f:Z

.field public final g:Li32;

.field public final h:Lc32;


# direct methods
.method public constructor <init>(Lumi;Lcom/opera/android/Lazy;Ljava/lang/String;Lcv2;Lf9;)V
    .registers 7

    sget-object v0, Lngh;->a:Lr16;

    sget-object v0, Lqii;->d:Lqii;

    invoke-direct {p0, p4}, Le32;-><init>(Lcv2;)V

    iput-object v0, p0, Lj32;->d:Lqii;

    iput-object p3, p0, Lj32;->e:Ljava/lang/String;

    const/4 p3, 0x1

    iput-boolean p3, p0, Lj32;->f:Z

    new-instance p3, Li32;

    invoke-direct {p3, p1, p2, p0}, Li32;-><init>(Lumi;Lcom/opera/android/Lazy;Lj32;)V

    iput-object p3, p0, Lj32;->g:Li32;

    new-instance p1, Lc32;

    new-instance p2, Lq3;

    const/16 p4, 0x16

    invoke-direct {p2, p0, p5, p4}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lc32;-><init>(Lkotlin/jvm/functions/Function1;)V

    iput-object p1, p0, Lj32;->h:Lc32;

    invoke-virtual {p3}, Lldk;->h()V

    return-void
.end method
