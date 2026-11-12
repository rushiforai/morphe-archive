.class public final Lm45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final a:Ljf2;

.field public final b:Ljava/lang/Object;

.field public final c:Lkotlin/jvm/functions/Function1;

.field public d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public constructor <init>(Ljf2;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm45;->a:Ljf2;

    iput-object p2, p0, Lm45;->b:Ljava/lang/Object;

    iput-object p3, p0, Lm45;->c:Lkotlin/jvm/functions/Function1;

    new-instance p1, Lnd3;

    const/16 p2, 0x8

    invoke-direct {p1, p2}, Lnd3;-><init>(B)V

    iput-object p1, p0, Lm45;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 1

    iget-object p0, p0, Lm45;->d:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method
