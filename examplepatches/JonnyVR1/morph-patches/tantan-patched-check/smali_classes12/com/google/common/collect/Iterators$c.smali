.class public Lcom/google/common/collect/Iterators$c;
.super Ll/wgj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterators;->B(Ljava/util/Iterator;Ll/adj;)Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wgj0<",
        "TF;TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic b:Ll/adj;


# direct methods
.method public constructor <init>(Ljava/util/Iterator;Ll/adj;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/common/collect/Iterators$c;->b:Ll/adj;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/wgj0;-><init>(Ljava/util/Iterator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Iterators$c;->b:Ll/adj;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/adj;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
