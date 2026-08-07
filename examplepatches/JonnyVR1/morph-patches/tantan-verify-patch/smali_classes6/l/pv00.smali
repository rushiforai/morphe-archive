.class public final synthetic Ll/pv00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uv00;


# direct methods
.method public synthetic constructor <init>(Ll/uv00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pv00;->a:Ll/uv00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pv00;->a:Ll/uv00;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/uv00;->h0(Ll/uv00;Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
