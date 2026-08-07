.class public final synthetic Ll/xmm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fmm;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmm;->a:Ll/fmm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xmm;->a:Ll/fmm;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {p0, p1}, Ll/ymm;->F(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
