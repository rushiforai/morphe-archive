.class public final synthetic Ll/upo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vpo0;


# direct methods
.method public synthetic constructor <init>(Ll/vpo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/upo0;->a:Ll/vpo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upo0;->a:Ll/vpo0;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/vpo0;->o(Ll/vpo0;Landroid/net/NetworkInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
