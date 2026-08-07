.class public final synthetic Ll/cni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cni;->a:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cni;->a:Ll/bm5;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->z(Ll/bm5;)V

    return-void
.end method
