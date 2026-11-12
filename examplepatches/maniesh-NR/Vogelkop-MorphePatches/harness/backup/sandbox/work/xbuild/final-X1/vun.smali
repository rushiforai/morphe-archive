.class public final Lvun;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lp6l;

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lp6l;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lvun;->c:Ljava/util/ArrayList;

    iput-object p1, p0, Lvun;->a:Ljava/lang/String;

    iput-object p2, p0, Lvun;->b:Lp6l;

    return-void
.end method
