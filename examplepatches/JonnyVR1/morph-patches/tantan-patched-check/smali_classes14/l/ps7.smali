.class public final synthetic Ll/ps7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ps7;->a:Lcom/p1/mobile/putong/core/api/g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ps7;->a:Lcom/p1/mobile/putong/core/api/g;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/data/DbLinks;

    invoke-virtual {p0, p1, p2}, Ll/dy6;->Z2(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method
