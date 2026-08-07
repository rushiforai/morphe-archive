.class public final synthetic Ll/uoj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uoj0;->a:Ll/bqq;

    iput-object p2, p0, Ll/uoj0;->b:Lv/navigationbar/VNavigationBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uoj0;->a:Ll/bqq;

    iget-object p0, p0, Ll/uoj0;->b:Lv/navigationbar/VNavigationBar;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->h(Ll/bqq;Lv/navigationbar/VNavigationBar;)V

    return-void
.end method
