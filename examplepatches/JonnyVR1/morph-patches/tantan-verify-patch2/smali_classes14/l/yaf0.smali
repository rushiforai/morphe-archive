.class public final synthetic Ll/yaf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ibf0;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignInData;

.field public final synthetic d:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yaf0;->a:Ll/ibf0;

    iput-object p2, p0, Ll/yaf0;->b:Ll/y20;

    iput-object p3, p0, Ll/yaf0;->c:Lcom/p1/mobile/putong/data/SignInData;

    iput-object p4, p0, Ll/yaf0;->d:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yaf0;->a:Ll/ibf0;

    iget-object v1, p0, Ll/yaf0;->b:Ll/y20;

    iget-object v2, p0, Ll/yaf0;->c:Lcom/p1/mobile/putong/data/SignInData;

    iget-object p0, p0, Ll/yaf0;->d:Ljava/lang/Throwable;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ibf0;->l0(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method
