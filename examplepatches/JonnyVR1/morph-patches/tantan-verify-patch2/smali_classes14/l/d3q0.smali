.class public final synthetic Ll/d3q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d3q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/d3q0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/d3q0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3q0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/d3q0;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/d3q0;->c:Ljava/lang/Runnable;

    check-cast p1, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;

    invoke-static {v0, v1, p0, p1}, Ll/v3q0;->u0(Ll/v3q0;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
