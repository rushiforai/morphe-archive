.class public final Lb47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:Lc47;


# direct methods
.method public constructor <init>(Lc47;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb47;->a:Lc47;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 6

    iget-object p0, p0, Lb47;->a:Lc47;

    iget-object p1, p0, Lc47;->a:Lumi;

    new-instance v0, Lbl6;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    sget-object p0, Lpn7;->b:Lon7;

    sget-object p0, Luih;->a:Ltih;

    sget-wide v0, Lc47;->g:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sget-wide v2, Lc47;->h:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Luih;->b:Lk6;

    invoke-virtual {p0, v0, v1, v2, v3}, Luih;->o(JJ)J

    move-result-wide v0

    sget-object p0, Lun7;->d:Lun7;

    invoke-static {v0, v1, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    const/4 p0, 0x0

    invoke-static {p1, p0, v0, v1}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method
