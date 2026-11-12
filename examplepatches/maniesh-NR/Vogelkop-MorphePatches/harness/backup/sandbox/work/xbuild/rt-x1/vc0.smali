.class public final Lvc0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Luc0;


# direct methods
.method public constructor <init>(Lzpa;Luc0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvc0;->a:Lzpa;

    iput-object p2, p0, Lvc0;->b:Luc0;

    new-instance p1, Lpa;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void
.end method
