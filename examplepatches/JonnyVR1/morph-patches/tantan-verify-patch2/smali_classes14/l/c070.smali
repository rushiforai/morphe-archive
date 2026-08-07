.class public final synthetic Ll/c070;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e070;


# direct methods
.method public synthetic constructor <init>(Ll/e070;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c070;->a:Ll/e070;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c070;->a:Ll/e070;

    check-cast p1, Lcom/p1/mobile/putong/account/data/CaptchaData;

    invoke-static {p0, p1}, Ll/e070;->i1(Ll/e070;Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method
