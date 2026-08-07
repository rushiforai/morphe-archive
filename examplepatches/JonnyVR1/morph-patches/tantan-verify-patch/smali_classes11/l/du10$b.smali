.class Ll/du10$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mediasdk/utils/NetUtil$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/du10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/du10;


# direct methods
.method public constructor <init>(Ll/du10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10$b;->a:Ll/du10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onNetworkChanged()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/mm/mediasdk/utils/NetUtil;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/du10$b;->a:Ll/du10;

    .line 8
    .line 9
    invoke-static {p0}, Ll/du10;->T(Ll/du10;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
