.class public final Lqde;
.super Lize;
.source "SourceFile"


# instance fields
.field public final l:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ll08;)V
    .registers 3

    invoke-direct {p0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lqde;->l:Ljava/util/ArrayList;

    return-void
.end method
