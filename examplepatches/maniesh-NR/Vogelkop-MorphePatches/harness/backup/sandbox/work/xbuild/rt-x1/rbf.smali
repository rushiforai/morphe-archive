.class public final Lrbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrwf;


# instance fields
.field public final synthetic a:Lvbf;


# direct methods
.method public constructor <init>(Lvbf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrbf;->a:Lvbf;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    iget-object p0, p0, Lrbf;->a:Lvbf;

    iget-object p1, p0, Lvbf;->f:Lswf;

    invoke-virtual {p1}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0}, Lvbf;->q()V

    iget-object p0, p0, Lvbf;->t:Ltbf;

    iput-object p1, p0, Ltbf;->e:Ljava/util/List;

    return-void
.end method
