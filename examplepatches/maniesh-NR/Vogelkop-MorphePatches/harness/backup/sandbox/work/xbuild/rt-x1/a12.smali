.class public final La12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ld12;


# static fields
.field public static final c:Lqie;


# instance fields
.field public final a:Ltcl;

.field public final b:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    sput-object v0, La12;->c:Lqie;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltcl;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, La12;->a:Ltcl;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "web-aria-storage"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, La12;->b:Lb59;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;Lvr9;)V
    .registers 5

    new-instance v0, Lz02;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lz02;-><init>(Lvr9;B)V

    new-instance p2, Lw02;

    invoke-direct {p2, p0, p1, v1}, Lw02;-><init>(La12;Ljava/util/ArrayList;B)V

    invoke-virtual {p0, p2, v0}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 5

    new-instance v0, Lv02;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Lv02;-><init>(Ljava/lang/Runnable;B)V

    new-instance p2, Lx02;

    const/4 v1, 0x0

    invoke-direct {p2, p0, p1, v1}, Lx02;-><init>(La12;Ljava/lang/String;B)V

    invoke-virtual {p0, p2, v0}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final c(Lra;)V
    .registers 4

    new-instance v0, Ly02;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ly02;-><init>(La12;B)V

    invoke-virtual {p0, v0, p1}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    new-instance v0, Lx02;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lx02;-><init>(La12;Ljava/lang/String;B)V

    invoke-virtual {p0, v0, p2}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final f(Ljava/util/ArrayList;Lra;)V
    .registers 5

    new-instance v0, Lw02;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lw02;-><init>(La12;Ljava/util/ArrayList;B)V

    invoke-virtual {p0, v0, p2}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    new-instance v0, Lv02;

    const/4 v1, 0x2

    invoke-direct {v0, p3, v1}, Lv02;-><init>(Ljava/lang/Runnable;B)V

    new-instance p3, Lhv;

    const/4 v1, 0x1

    invoke-direct {p3, p0, p1, p2, v1}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p3, v0}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final h()V
    .registers 1

    return-void
.end method

.method public final i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object p0, p0, La12;->a:Ltcl;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lp01;

    const/4 v1, 0x2

    invoke-direct {p0, p1, v1}, Lp01;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {v0, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Lra;

    const/4 v0, 0x6

    invoke-direct {p1, p2, v0}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    sget-object p1, La12;->c:Lqie;

    invoke-virtual {p0, p1}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method
