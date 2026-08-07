.class public Ll/ywu$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ywu;->k()Ll/r0u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ll/ywu;

.field final synthetic val$adapter:Ll/r0u;


# direct methods
.method public constructor <init>(Ll/ywu;Ll/r0u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ywu$a;->this$0:Ll/ywu;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ywu$a;->val$adapter:Ll/r0u;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu$a;->val$adapter:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->K(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
