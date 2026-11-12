.class public final synthetic Lyqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbqb;


# instance fields
.field public final synthetic a:Lurc;


# direct methods
.method public synthetic constructor <init>(Lurc;)V
    .registers 2

    iput-object p1, p0, Lyqc;->a:Lurc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final n(Ltw7;)V
    .registers 3

    iget-object p0, p0, Lyqc;->a:Lurc;

    iget-object p0, p0, Lurc;->g:Lode;

    invoke-virtual {p1}, Ltw7;->a()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lepc;

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_15

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_15
    return-void
.end method
