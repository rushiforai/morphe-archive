.class public final synthetic Ll/bb3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/bb3;->a:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bb3;->a:Z

    check-cast p1, Lv/bottombar/VBottomBarDefaultItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c(ZLv/bottombar/VBottomBarDefaultItem;)V

    return-void
.end method
