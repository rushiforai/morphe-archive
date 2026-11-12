.class public final Lup9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lt1;

.field public final b:Lpnc;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lt1;Lpnc;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lup9;->a:Lt1;

    iput-object p2, p0, Lup9;->b:Lpnc;

    new-instance p1, Lal7;

    const/16 p2, 0xd

    invoke-direct {p1, p0, p2}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lup9;->c:Lzyk;

    return-void
.end method
