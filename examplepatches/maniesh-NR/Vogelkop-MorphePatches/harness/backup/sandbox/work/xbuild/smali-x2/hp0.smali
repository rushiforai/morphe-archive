.class public final Lhp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lz56;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lzpa;Lz56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhp0;->a:Lzpa;

    iput-object p2, p0, Lhp0;->b:Lz56;

    new-instance p1, Lpa;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhp0;->c:Lzyk;

    return-void
.end method
