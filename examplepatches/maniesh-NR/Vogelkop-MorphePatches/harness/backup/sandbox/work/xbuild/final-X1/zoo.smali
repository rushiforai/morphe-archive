.class public final Lzoo;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final b:Ljom;


# direct methods
.method public constructor <init>(Lh9o;)V
    .registers 3

    invoke-direct {p0, p1}, Lejo;-><init>(Ljava/lang/Object;)V

    new-instance p1, Ljom;

    invoke-direct {p1, p0}, Ljom;-><init>(Lzoo;)V

    iput-object p1, p0, Lzoo;->b:Ljom;

    invoke-static {}, Lo8p;->a()Lndc;

    move-result-object p0

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->c:Lqcc;

    invoke-virtual {p0, v0}, Lqcc;->d(Lqcc;)Z

    invoke-static {}, Lo8p;->a()Lndc;

    move-result-object p0

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    invoke-static {}, Lo8p;->a()Lndc;

    move-result-object v0

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v1, p0, Lzoo;->b:Ljom;

    invoke-virtual {v0, v1}, Ltcc;->b(Lmdc;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lejo;->a:Ljava/lang/Object;

    return-void
.end method
