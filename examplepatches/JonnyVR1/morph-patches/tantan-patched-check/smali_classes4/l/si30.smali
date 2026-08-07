.class public final synthetic Ll/si30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/si30;->a:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    iput p2, p0, Ll/si30;->b:I

    iput-boolean p3, p0, Ll/si30;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/si30;->a:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    iget v1, p0, Ll/si30;->b:I

    iget-boolean p0, p0, Ll/si30;->c:Z

    check-cast p1, Ll/bkj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;IZLl/bkj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
