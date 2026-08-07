.class public Ll/jvp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jvp0;->p(Lcom/p1/mobile/share_sdk/content/Content;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/j5f$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/jvp0;


# direct methods
.method public constructor <init>(Ll/jvp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jvp0$a;->a:Ll/jvp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/j5f$e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jvp0$a;->a:Ll/jvp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jvp0;->a(Ll/jvp0;)Ll/g3f0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jvp0$a;->a:Ll/jvp0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/j5f$e;->c:Lcom/tencent/mm/opensdk/modelbase/BaseResp;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jvp0;->a(Ll/jvp0;)Ll/g3f0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, p1, v0}, Ll/jvp0;->b(Ll/jvp0;Lcom/tencent/mm/opensdk/modelbase/BaseResp;Ll/g3f0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j5f$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jvp0$a;->a(Ll/j5f$e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
