.class public Ll/t80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t80$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
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
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t80;->a:Ll/wk90;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t80;->a:Ll/wk90;

    .line 2
    .line 3
    new-instance v0, Ll/t80$a;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p1, v1}, Ll/t80$a;-><init>(Ll/z06;Ll/u80;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0, v0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
