.class public final synthetic Ll/ywe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gxe;


# direct methods
.method public synthetic constructor <init>(Ll/gxe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ywe;->a:Ll/gxe;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywe;->a:Ll/gxe;

    check-cast p1, Lcom/p1/mobile/putong/data/Captcha;

    invoke-static {p0, p1}, Ll/gxe;->Q0(Ll/gxe;Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method
