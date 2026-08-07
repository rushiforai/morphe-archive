.class public final synthetic Ll/uyp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignInData;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uyp0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/uyp0;->b:Lcom/p1/mobile/putong/data/SignInData;

    iput-object p3, p0, Ll/uyp0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uyp0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/uyp0;->b:Lcom/p1/mobile/putong/data/SignInData;

    iget-object p0, p0, Ll/uyp0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/v3q0;->C1(Ll/v3q0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    return-void
.end method
