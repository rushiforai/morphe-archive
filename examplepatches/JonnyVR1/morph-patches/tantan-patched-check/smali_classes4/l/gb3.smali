.class public final synthetic Ll/gb3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/bottombar/VBottomBarDefaultItem;


# direct methods
.method public synthetic constructor <init>(Lv/bottombar/VBottomBarDefaultItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gb3;->a:Lv/bottombar/VBottomBarDefaultItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gb3;->a:Lv/bottombar/VBottomBarDefaultItem;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->i(Lv/bottombar/VBottomBarDefaultItem;)V

    return-void
.end method
