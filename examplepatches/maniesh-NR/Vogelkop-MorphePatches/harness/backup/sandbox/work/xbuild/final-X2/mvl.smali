.class public final Lmvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lpvl;


# direct methods
.method public constructor <init>(Lpvl;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmvl;->a:Lpvl;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    if-eqz p1, :cond_11

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    invoke-interface {p2}, Lb9l;->T()Lp6l;

    move-result-object p2

    if-eq p1, p2, :cond_11

    iget-object p0, p0, Lmvl;->a:Lpvl;

    invoke-virtual {p0}, Lpvl;->E()V

    :cond_11
    return-void
.end method
