.class public final synthetic Ll/jmh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tmh0;


# direct methods
.method public synthetic constructor <init>(Ll/tmh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jmh0;->a:Ll/tmh0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmh0;->a:Ll/tmh0;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/tmh0;->j0(Ll/tmh0;Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
