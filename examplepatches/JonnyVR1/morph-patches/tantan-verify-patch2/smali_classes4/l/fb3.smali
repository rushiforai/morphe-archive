.class public final synthetic Ll/fb3;
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

    iput-object p1, p0, Ll/fb3;->a:Lv/bottombar/VBottomBarDefaultItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fb3;->a:Lv/bottombar/VBottomBarDefaultItem;

    invoke-virtual {p0}, Lv/bottombar/VBottomBarDefaultItem;->b()V

    return-void
.end method
