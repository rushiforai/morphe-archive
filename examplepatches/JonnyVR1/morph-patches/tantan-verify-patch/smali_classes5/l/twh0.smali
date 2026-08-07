.class public final synthetic Ll/twh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/wwh0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;


# direct methods
.method public synthetic constructor <init>(Ll/wwh0;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/twh0;->a:Ll/wwh0;

    iput-object p2, p0, Ll/twh0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/twh0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/twh0;->a:Ll/wwh0;

    iget-object v1, p0, Ll/twh0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/twh0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-static {v0, v1, p0}, Ll/wwh0;->s(Ll/wwh0;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
