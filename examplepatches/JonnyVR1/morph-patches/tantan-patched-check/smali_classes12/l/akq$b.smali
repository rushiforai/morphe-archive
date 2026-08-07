.class public Ll/akq$b;
.super Ll/xvi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/akq;->s(Ljava/lang/Iterable;Ll/adj;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xvi<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic b:Ljava/lang/Iterable;

.field public final synthetic c:Ll/adj;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;Ll/adj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/akq$b;->b:Ljava/lang/Iterable;

    .line 2
    .line 3
    iput-object p2, p0, Ll/akq$b;->c:Ll/adj;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/xvi;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/akq$b;->b:Ljava/lang/Iterable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/akq$b;->c:Ll/adj;

    .line 8
    .line 9
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterators;->B(Ljava/util/Iterator;Ll/adj;)Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
