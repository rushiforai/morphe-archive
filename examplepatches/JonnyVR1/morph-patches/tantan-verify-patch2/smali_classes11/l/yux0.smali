.class public final synthetic Ll/yux0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/iux0;

.field public synthetic b:Landroid/os/Bundle;

.field public synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/iux0;Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yux0;->a:Ll/iux0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yux0;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yux0;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yux0;->a:Ll/iux0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yux0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object p0, p0, Ll/yux0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/iux0;->Y2(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
