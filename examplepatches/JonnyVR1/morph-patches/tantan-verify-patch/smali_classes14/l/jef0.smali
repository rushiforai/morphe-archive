.class public final synthetic Ll/jef0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ref0;


# direct methods
.method public synthetic constructor <init>(Ll/ref0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jef0;->a:Ll/ref0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jef0;->a:Ll/ref0;

    check-cast p1, Lcom/p1/mobile/putong/data/MobileRespInfo;

    invoke-static {p0, p1}, Ll/ref0;->X0(Ll/ref0;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method
