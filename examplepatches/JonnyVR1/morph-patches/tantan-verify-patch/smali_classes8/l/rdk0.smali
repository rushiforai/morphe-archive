.class public final synthetic Ll/rdk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rdk0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/rdk0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rdk0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/rdk0;->b:Ll/xc00;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->g0(Ljava/lang/String;Ll/xc00;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
