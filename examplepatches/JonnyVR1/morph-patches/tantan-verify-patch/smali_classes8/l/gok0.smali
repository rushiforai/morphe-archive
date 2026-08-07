.class public final synthetic Ll/gok0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/bottombar/VBottomBar;


# direct methods
.method public synthetic constructor <init>(Lv/bottombar/VBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gok0;->a:Lv/bottombar/VBottomBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gok0;->a:Lv/bottombar/VBottomBar;

    invoke-static {p0}, Lv/bottombar/VBottomBar;->a(Lv/bottombar/VBottomBar;)V

    return-void
.end method
