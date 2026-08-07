.class public final Ll/j560$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/j560;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:I


# direct methods
.method public constructor <init>(Ll/bb50;Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "TT;>;",
            "Lrx/c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/yqe0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j560$a;->a:Ll/bb50;

    .line 10
    .line 11
    iput-object p2, p0, Ll/j560$a;->b:Lrx/c;

    .line 12
    .line 13
    return-void
.end method
