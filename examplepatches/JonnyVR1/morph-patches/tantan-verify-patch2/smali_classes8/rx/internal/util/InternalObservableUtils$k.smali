.class public final Lrx/internal/util/InternalObservableUtils$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/util/InternalObservableUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "k"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/pcj<",
        "Ll/ax5<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:I


# direct methods
.method public constructor <init>(Lrx/c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/util/InternalObservableUtils$k;->a:Lrx/c;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/util/InternalObservableUtils$k;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lrx/c;ILrx/internal/util/InternalObservableUtils$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lrx/internal/util/InternalObservableUtils$k;-><init>(Lrx/c;I)V

    return-void
.end method


# virtual methods
.method public a()Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/InternalObservableUtils$k;->a:Lrx/c;

    .line 2
    .line 3
    iget p0, p0, Lrx/internal/util/InternalObservableUtils$k;->b:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lrx/c;->replay(I)Ll/ax5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/InternalObservableUtils$k;->a()Ll/ax5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
