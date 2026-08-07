.class public final synthetic Ll/voh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/voh0;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voh0;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;->c(Ljava/lang/String;)V

    return-void
.end method
