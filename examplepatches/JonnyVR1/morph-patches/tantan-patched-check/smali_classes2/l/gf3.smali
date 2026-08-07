.class public Ll/gf3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gf3$a;
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

.field public final b:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wk90;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;",
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
    iput-object p1, p0, Ll/gf3;->a:Ll/wk90;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gf3;->b:Ll/wk90;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic c(Ll/gf3;)Ll/wk90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gf3;->b:Ll/wk90;

    return-object p0
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
    new-instance v0, Ll/gf3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, p2, v1}, Ll/gf3$a;-><init>(Ll/gf3;Ll/z06;Ll/yk90;Ll/hf3;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/gf3;->a:Ll/wk90;

    .line 8
    .line 9
    invoke-interface {p0, v0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
