.class public final Lqw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnle;

.field public final b:Lpna;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lnle;Lpna;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqw;->a:Lnle;

    iput-object p2, p0, Lqw;->b:Lpna;

    new-instance p1, Lpa;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lqw;->c:Lzyk;

    return-void
.end method
