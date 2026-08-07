.class public final synthetic Ll/qxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/x1d0$a;


# direct methods
.method public synthetic constructor <init>(Ll/x1d0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qxr;->a:Ll/x1d0$a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qxr;->a:Ll/x1d0$a;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->i(Ll/x1d0$a;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
