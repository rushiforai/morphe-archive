.class public final Ll/bvy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iuy0;


# instance fields
.field public final a:Ljava/util/List;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/avy0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bvy0;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/avy0;->c()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    new-instance p0, Ll/wvy0;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Ll/wvy0;-><init>(Landroid/content/Context;Ll/avy0;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
