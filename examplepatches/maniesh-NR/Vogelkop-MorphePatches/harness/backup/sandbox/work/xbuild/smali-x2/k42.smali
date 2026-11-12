.class public final Lk42;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lji;

.field public final b:Lji;

.field public final c:Lzyk;

.field public final d:Lh42;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lji;Lji;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk42;->a:Lji;

    iput-object p2, p0, Lk42;->b:Lji;

    new-instance p1, Lpa;

    const/16 p2, 0x1b

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk42;->c:Lzyk;

    new-instance p1, Lh42;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lh42;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lk42;->d:Lh42;

    return-void
.end method
