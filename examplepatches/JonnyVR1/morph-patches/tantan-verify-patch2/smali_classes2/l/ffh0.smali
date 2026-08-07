.class public Ll/ffh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ffh0;->a:Ll/wk90;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ljava/lang/Void;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ffh0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ffh0$a;-><init>(Ll/ffh0;Ll/z06;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ffh0;->a:Ll/wk90;

    .line 7
    .line 8
    invoke-interface {p0, v0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
