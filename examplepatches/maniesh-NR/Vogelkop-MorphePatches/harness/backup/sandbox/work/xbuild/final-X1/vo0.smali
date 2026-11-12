.class public final Lvo0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Luo0;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lzpa;Luo0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo0;->a:Lzpa;

    iput-object p2, p0, Lvo0;->b:Luo0;

    new-instance p1, Lpa;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lvo0;->c:Lzyk;

    return-void
.end method
