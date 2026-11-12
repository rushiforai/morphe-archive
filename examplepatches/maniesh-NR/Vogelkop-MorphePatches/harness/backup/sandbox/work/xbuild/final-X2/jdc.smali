.class public final Ljdc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llcc;


# instance fields
.field public final synthetic a:Le1i;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Le1i;

.field public final synthetic d:Lf1i;

.field public final synthetic e:Lkotlin/jvm/functions/Function0;

.field public final synthetic f:Lkotlin/jvm/functions/Function0;


# direct methods
.method public constructor <init>(Le1i;Lkotlin/jvm/functions/Function0;Le1i;Lf1i;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljdc;->a:Le1i;

    iput-object p2, p0, Ljdc;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Ljdc;->c:Le1i;

    iput-object p4, p0, Ljdc;->d:Lf1i;

    iput-object p5, p0, Ljdc;->e:Lkotlin/jvm/functions/Function0;

    iput-object p6, p0, Ljdc;->f:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 1

    iget-object p0, p0, Ljdc;->a:Le1i;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Le1i;->invoke()Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method public final onDestroy()V
    .registers 1

    iget-object p0, p0, Ljdc;->f:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final onPause()V
    .registers 1

    iget-object p0, p0, Ljdc;->d:Lf1i;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lf1i;->invoke()Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method public final onResume()V
    .registers 1

    iget-object p0, p0, Ljdc;->c:Le1i;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Le1i;->invoke()Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method public final onStart()V
    .registers 1

    iget-object p0, p0, Ljdc;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final onStop()V
    .registers 1

    iget-object p0, p0, Ljdc;->e:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method
