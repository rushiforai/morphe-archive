.class public abstract Ll/a7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dsl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/dsl;"
    }
.end annotation


# instance fields
.field public a:Ll/l6c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l6c<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/l6c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/a7;->a:Ll/l6c;

    .line 2
    .line 3
    return-void
.end method

.method public b()Ll/l6c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/l6c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a7;->a:Ll/l6c;

    .line 2
    .line 3
    return-object p0
.end method
