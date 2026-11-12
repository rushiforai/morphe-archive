.class public final synthetic Lc2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ler9;


# instance fields
.field public final synthetic a:Ls5l;


# direct methods
.method public synthetic constructor <init>(Ls5l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc2l;->a:Ls5l;

    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    move-object v1, p1

    check-cast v1, Lu3l;

    move-object v2, p2

    check-cast v2, Lb3c;

    move-object v4, p3

    check-cast v4, Ljava/util/Set;

    move-object v5, p4

    check-cast v5, Lp6l;

    move-object v6, p5

    check-cast v6, Landroidx/recyclerview/widget/i;

    new-instance v0, Ls2l;

    iget-object p0, p0, Lc2l;->a:Ls5l;

    invoke-virtual {p0}, Ls5l;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-direct/range {v0 .. v6}, Ls2l;-><init>(Lu3l;Lb3c;ZLjava/util/Set;Lp6l;Landroidx/recyclerview/widget/i;)V

    return-object v0
.end method
