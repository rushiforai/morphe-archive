.class public final Ll3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field public final a:Lqie;

.field public final b:Ljava/lang/String;

.field public final c:Lkotlin/jvm/functions/Function2;

.field public final d:Lzyk;


# direct methods
.method public constructor <init>(Lqie;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll3g;->a:Lqie;

    iput-object p2, p0, Ll3g;->b:Ljava/lang/String;

    iput-object p3, p0, Ll3g;->c:Lkotlin/jvm/functions/Function2;

    new-instance p1, Ld8e;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ll3g;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 2

    iget-object p0, p0, Ll3g;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Losk;

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    :cond_11
    return-void
.end method
