.class public Ll/vbd0$b;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vbd0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vbd0;


# direct methods
.method public constructor <init>(Ll/vbd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vbd0$b;->a:Ll/vbd0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0$b;->a:Ll/vbd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/vbd0;->b(Ll/vbd0;)Ll/cbd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/d3q;

    .line 16
    .line 17
    instance-of p1, p0, Ll/e9d0;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    check-cast p0, Ll/e9d0;

    .line 22
    .line 23
    iget p0, p0, Ll/e9d0;->c:I

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x2

    .line 27
    return p0
.end method
