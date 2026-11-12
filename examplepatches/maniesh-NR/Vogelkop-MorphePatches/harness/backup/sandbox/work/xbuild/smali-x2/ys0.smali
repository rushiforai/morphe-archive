.class public final Lys0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lws0;


# direct methods
.method public constructor <init>(Lzpa;Lws0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lys0;->a:Lzpa;

    iput-object p2, p0, Lys0;->b:Lws0;

    new-instance p1, Lxs0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lxs0;-><init>(Lys0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lxs0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lxs0;-><init>(Lys0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void
.end method
