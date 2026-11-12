.class public final Lzj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly55;

.field public final b:Lu56;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Ly55;Lu56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzj0;->a:Ly55;

    iput-object p2, p0, Lzj0;->b:Lu56;

    new-instance p1, Luj0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Luj0;-><init>(Lzj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Luj0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Luj0;-><init>(Lzj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzj0;->c:Lzyk;

    return-void
.end method
