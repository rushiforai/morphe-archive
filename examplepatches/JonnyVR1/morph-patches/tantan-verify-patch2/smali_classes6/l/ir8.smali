.class public final synthetic Ll/ir8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ir8;->a:Ljava/util/List;

    iput-object p2, p0, Ll/ir8;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ir8;->a:Ljava/util/List;

    iget-object p0, p0, Ll/ir8;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/ms8;->C0(Ljava/util/List;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/util/List;)Lcom/p1/mobile/putong/data/BubbleInfo;

    move-result-object p0

    return-object p0
.end method
