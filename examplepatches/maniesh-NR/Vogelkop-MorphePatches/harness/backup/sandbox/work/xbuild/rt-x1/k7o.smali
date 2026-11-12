.class public final Lk7o;
.super Lp6o;
.source "SourceFile"


# instance fields
.field public final g:Ljava/util/Set;

.field public final h:Loyj;


# direct methods
.method public constructor <init>(Ljava/util/Set;Loyj;Lj6o;)V
    .registers 8

    new-instance v0, Llxh;

    const v1, 0x7f080753

    invoke-direct {v0, v1}, Llxh;-><init>(I)V

    new-instance v1, Lrxh;

    const v2, 0x7f140953

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lrxh;

    const v3, 0x7f140952

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {p0, v0, v1, v2, p3}, Lp6o;-><init>(Llxh;Lpxh;Lrxh;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lk7o;->g:Ljava/util/Set;

    iput-object p2, p0, Lk7o;->h:Loyj;

    return-void
.end method
