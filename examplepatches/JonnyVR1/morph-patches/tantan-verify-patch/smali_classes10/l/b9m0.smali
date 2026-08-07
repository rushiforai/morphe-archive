.class public Ll/b9m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ram;


# instance fields
.field public final a:Ljava/lang/Boolean;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a9m0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a9m0;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b9m0;->b:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b9m0;->a:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-void
.end method
