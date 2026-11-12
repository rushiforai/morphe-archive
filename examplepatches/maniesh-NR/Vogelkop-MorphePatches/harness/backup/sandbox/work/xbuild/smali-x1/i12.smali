.class public final Li12;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lkotlin/jvm/functions/Function0;

.field public final c:Lulp;

.field public final d:Lqie;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lumi;)V
    .registers 3

    sget-object v0, Lh12;->a:Lh12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li12;->a:Lumi;

    iput-object v0, p0, Li12;->b:Lkotlin/jvm/functions/Function0;

    sget-object p1, Lu55;->Ro:Lulp;

    iput-object p1, p0, Li12;->c:Lulp;

    new-instance p1, Lqie;

    const/16 v0, 0x13

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Li12;->d:Lqie;

    new-instance p1, Lpa;

    const/16 v0, 0x18

    invoke-direct {p1, p0, v0}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Li12;->e:Lzyk;

    return-void
.end method
