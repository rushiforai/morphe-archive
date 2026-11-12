.class public final Lcg2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lq2;

.field public final b:Lpv3;

.field public final c:Lcw3;

.field public final d:Lcw3;

.field public final e:Lcw3;

.field public final f:Lcw3;

.field public final g:Lpv3;

.field public final h:Lji;

.field public final i:Lkze;

.field public j:Lgg2;


# direct methods
.method public constructor <init>(Lndc;Lq2;Lpv3;Lcw3;Lcw3;Lcw3;Lcw3;Lpv3;Lji;Lkze;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcg2;->a:Lq2;

    iput-object p3, p0, Lcg2;->b:Lpv3;

    iput-object p4, p0, Lcg2;->c:Lcw3;

    iput-object p5, p0, Lcg2;->d:Lcw3;

    iput-object p6, p0, Lcg2;->e:Lcw3;

    iput-object p7, p0, Lcg2;->f:Lcw3;

    iput-object p8, p0, Lcg2;->g:Lpv3;

    iput-object p9, p0, Lcg2;->h:Lji;

    iput-object p10, p0, Lcg2;->i:Lkze;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance p2, Lob;

    const/4 p3, 0x3

    invoke-direct {p2, p0, p3}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method
