.class public final synthetic Ll/kwa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kwa0;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kwa0;->a:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    check-cast p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    invoke-static {p0, p1, p2}, Ll/owa0;->a0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)I

    move-result p0

    return p0
.end method
