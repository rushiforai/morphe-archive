.class public final synthetic Ll/ri30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

.field public final synthetic c:Z

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ri30;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    iput-object p2, p0, Ll/ri30;->b:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    iput-boolean p3, p0, Ll/ri30;->c:Z

    iput p4, p0, Ll/ri30;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ri30;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    iget-object v1, p0, Ll/ri30;->b:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    iget-boolean v2, p0, Ll/ri30;->c:Z

    iget p0, p0, Ll/ri30;->d:I

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->k(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZILjava/lang/String;)V

    return-void
.end method
