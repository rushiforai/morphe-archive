.class public final synthetic Ll/lw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/data/DbLinks;

    check-cast p3, Landroid/util/SparseArray;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->k2(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;Landroid/util/SparseArray;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method
