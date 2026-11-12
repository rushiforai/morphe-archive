.class public final Lau0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lxt0;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lxt0;Lzpa;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lau0;->a:Lzpa;

    iput-object p1, p0, Lau0;->b:Lxt0;

    new-instance p1, Lpa;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lau0;->c:Lzyk;

    return-void
.end method
