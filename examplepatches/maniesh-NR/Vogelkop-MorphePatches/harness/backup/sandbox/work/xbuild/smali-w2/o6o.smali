.class public final Lo6o;
.super Lp6o;
.source "SourceFile"


# instance fields
.field public final g:Lr7o;

.field public final h:Lgil;


# direct methods
.method public constructor <init>(Lr7o;Lgil;Lj6o;)V
    .registers 8

    iget-object v0, p1, Lr7o;->d:Llxh;

    iget-object v1, p1, Lr7o;->c:Lrxh;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Lsxh;

    const v3, 0x7f140951

    invoke-direct {v2, v3, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v1, Lrxh;

    const v3, 0x7f140950

    invoke-direct {v1, v3}, Lrxh;-><init>(I)V

    invoke-direct {p0, v0, v2, v1, p3}, Lp6o;-><init>(Llxh;Lpxh;Lrxh;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lo6o;->g:Lr7o;

    iput-object p2, p0, Lo6o;->h:Lgil;

    return-void
.end method
