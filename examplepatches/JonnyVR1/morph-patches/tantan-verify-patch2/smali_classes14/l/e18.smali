.class public final synthetic Ll/e18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e18;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/e18;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e18;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/e18;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e18;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/e18;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/e18;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/e18;->d:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->c7(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;ZLl/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
