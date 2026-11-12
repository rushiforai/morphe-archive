.class public final synthetic Lkvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lecn;


# instance fields
.field public final synthetic a:Lnxo;


# direct methods
.method public synthetic constructor <init>(Lnxo;)V
    .registers 2

    iput-object p1, p0, Lkvo;->a:Lnxo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    iget-object p0, p0, Lkvo;->a:Lnxo;

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lnxo;->e()V

    return-void

    :cond_8
    invoke-virtual {p0}, Lnxo;->h()V

    return-void
.end method
