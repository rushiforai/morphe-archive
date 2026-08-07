.class public final synthetic Ll/epj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Lv/navigationbar/VNavigationBar;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/epj0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;

    iput-object p2, p0, Ll/epj0;->b:Ll/bqq;

    iput-object p3, p0, Ll/epj0;->c:Lv/navigationbar/VNavigationBar;

    iput-object p4, p0, Ll/epj0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/epj0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;

    iget-object v1, p0, Ll/epj0;->b:Ll/bqq;

    iget-object v2, p0, Ll/epj0;->c:Lv/navigationbar/VNavigationBar;

    iget-object p0, p0, Ll/epj0;->d:Ljava/lang/String;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->c(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
