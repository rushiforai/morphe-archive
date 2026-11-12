.class public final Lld0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lkd0;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lzpa;Lkd0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lld0;->a:Lzpa;

    iput-object p2, p0, Lld0;->b:Lkd0;

    new-instance p1, Lpa;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lld0;->c:Lzyk;

    return-void
.end method
