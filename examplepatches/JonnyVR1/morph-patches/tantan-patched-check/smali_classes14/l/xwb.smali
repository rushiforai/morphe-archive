.class public final synthetic Ll/xwb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fxb;


# direct methods
.method public synthetic constructor <init>(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xwb;->a:Ll/fxb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwb;->a:Ll/fxb;

    check-cast p1, Lcom/p1/mobile/putong/data/MobileRespInfo;

    invoke-static {p0, p1}, Ll/fxb;->i0(Ll/fxb;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method
