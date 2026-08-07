.class final Ll/cr60;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field b:Ll/jcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jcg0<",
            "TT;>;"
        }
    .end annotation
.end field

.field c:Ll/cr60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cr60<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/jcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/jcg0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cr60;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cr60;->b:Ll/jcg0;

    .line 7
    .line 8
    return-void
.end method
