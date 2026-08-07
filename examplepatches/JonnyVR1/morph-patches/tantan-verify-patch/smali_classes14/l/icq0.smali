.class public final synthetic Ll/icq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ccq0$e;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icq0;->a:Ll/ccq0$e;

    iput-object p2, p0, Ll/icq0;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iput-object p3, p0, Ll/icq0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/icq0;->a:Ll/ccq0$e;

    iget-object v1, p0, Ll/icq0;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iget-object p0, p0, Ll/icq0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {v0, v1, p0}, Ll/ccq0$e;->c(Ll/ccq0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method
