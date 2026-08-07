.class public final synthetic Ll/x9q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ccq0;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x9q0;->a:Ll/ccq0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9q0;->a:Ll/ccq0;

    check-cast p1, Lcom/p1/mobile/putong/data/MobileRespInfo;

    invoke-static {p0, p1}, Ll/ccq0;->O0(Ll/ccq0;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method
