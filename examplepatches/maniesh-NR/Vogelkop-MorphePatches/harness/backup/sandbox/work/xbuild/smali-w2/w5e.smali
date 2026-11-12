.class public final Lw5e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La2e;


# instance fields
.field public final a:Lzyk;


# direct methods
.method public constructor <init>(Lj3i;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lq4b;

    const/16 v1, 0x1b

    invoke-direct {v0, p1, v1}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lw5e;->a:Lzyk;

    return-void
.end method
