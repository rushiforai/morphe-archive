.class public abstract Lquk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lquk;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public static a(Ldwh;Ldeg;Lnt5;)Ljava/lang/Object;
    .registers 5

    new-instance v0, Lnh4;

    invoke-static {p2}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p2

    const/4 v1, 0x1

    invoke-direct {v0, v1, p2}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {v0}, Lnh4;->s()V

    new-instance p2, Lnwa;

    const/4 v1, 0x3

    invoke-direct {p2, v0, v1}, Lnwa;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lquk;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2}, Ldwh;->f(Lacl;)V

    new-instance p0, Lm91;

    const/16 v1, 0xc

    invoke-direct {p0, p2, p1, v1}, Lm91;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lnh4;->u(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    return-object p0
.end method

.method public static b(Ldwh;Ldeg;Landroid/widget/ImageView;Lnt5;)Ljava/lang/Object;
    .registers 6

    new-instance v0, Lnh4;

    invoke-static {p3}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p3

    const/4 v1, 0x1

    invoke-direct {v0, v1, p3}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {v0}, Lnh4;->s()V

    new-instance p3, Lshf;

    invoke-direct {p3, v0, p1, p2}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, p2, p3}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    new-instance p0, Lm91;

    const/16 p3, 0xd

    invoke-direct {p0, p1, p2, p3}, Lm91;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lnh4;->u(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    return-object p0
.end method
