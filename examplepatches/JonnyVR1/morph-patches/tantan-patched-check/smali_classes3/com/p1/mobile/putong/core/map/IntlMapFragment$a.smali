.class public Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hyl$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/map/IntlMapFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/txw;

.field public final synthetic b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;Ll/txw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->a:Ll/txw;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;)Ll/txw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->a:Ll/txw;

    return-object p0
.end method


# virtual methods
.method public remove()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->c4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->a:Ll/txw;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/txw;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
