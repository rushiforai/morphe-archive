.class public final Lvz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lami;


# direct methods
.method public constructor <init>(Lami;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvz2;->a:Lami;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    new-instance p1, Lro9;

    iget-object p0, p0, Lvz2;->a:Lami;

    invoke-direct {p1, p0, p2}, Lro9;-><init>(Lami;Lb2l;)V

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lami;->w(Lro9;Z)V

    return-void
.end method
