.class public final synthetic Ll/ekq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Comparator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ekq;->a:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ekq;->a:Ljava/util/Comparator;

    check-cast p1, Ll/sq60;

    check-cast p2, Ll/sq60;

    invoke-static {p0, p1, p2}, Lcom/google/common/collect/Iterators$g;->a(Ljava/util/Comparator;Ll/sq60;Ll/sq60;)I

    move-result p0

    return p0
.end method
