.class Ll/erp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/erp0$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/erp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ll/jvl;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->n(Ljava/lang/String;Ljava/lang/String;Ll/jvl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
