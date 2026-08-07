.class public final synthetic Ll/eke;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignInGrantType;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignInGrantType;Ljava/lang/Runnable;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eke;->a:Lcom/p1/mobile/putong/data/SignInGrantType;

    iput-object p2, p0, Ll/eke;->b:Ljava/lang/Runnable;

    iput-boolean p3, p0, Ll/eke;->c:Z

    iput-boolean p4, p0, Ll/eke;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eke;->a:Lcom/p1/mobile/putong/data/SignInGrantType;

    iget-object v1, p0, Ll/eke;->b:Ljava/lang/Runnable;

    iget-boolean v2, p0, Ll/eke;->c:Z

    iget-boolean p0, p0, Ll/eke;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ike;->d(Lcom/p1/mobile/putong/data/SignInGrantType;Ljava/lang/Runnable;ZZLcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
