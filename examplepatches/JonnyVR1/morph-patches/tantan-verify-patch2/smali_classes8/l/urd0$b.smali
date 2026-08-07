.class public final Ll/urd0$b;
.super Ll/f950;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/urd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/f950<",
        "Ljava/util/Queue<",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f950;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic b()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/urd0$b;->e()Lrx/internal/util/unsafe/SpmcArrayQueue;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Lrx/internal/util/unsafe/SpmcArrayQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/util/unsafe/SpmcArrayQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lrx/internal/util/unsafe/SpmcArrayQueue;

    .line 2
    .line 3
    sget v0, Ll/urd0;->g:I

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lrx/internal/util/unsafe/SpmcArrayQueue;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
