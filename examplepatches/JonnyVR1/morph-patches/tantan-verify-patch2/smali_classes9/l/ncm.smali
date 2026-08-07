.class public final synthetic Ll/ncm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tcm;


# direct methods
.method public synthetic constructor <init>(Ll/tcm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ncm;->a:Ll/tcm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ncm;->a:Ll/tcm;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatProfile;

    invoke-static {p0, p1}, Ll/tcm;->i0(Ll/tcm;Lcom/p1/mobile/putong/core/data/ChatProfile;)V

    return-void
.end method
