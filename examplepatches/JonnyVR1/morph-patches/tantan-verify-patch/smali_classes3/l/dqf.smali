.class public final synthetic Ll/dqf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqf;->a:Ll/aqq;

    iput-object p2, p0, Ll/dqf;->b:Lv/navigationbar/VNavigationBar;

    iput-object p3, p0, Ll/dqf;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dqf;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dqf;->a:Ll/aqq;

    iget-object v1, p0, Ll/dqf;->b:Lv/navigationbar/VNavigationBar;

    iget-object v2, p0, Ll/dqf;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/dqf;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ExportedBridgeImplementation;->c(Ll/aqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
