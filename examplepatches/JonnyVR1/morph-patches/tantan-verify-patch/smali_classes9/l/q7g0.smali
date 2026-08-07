.class public final synthetic Ll/q7g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t7g0;


# direct methods
.method public synthetic constructor <init>(Ll/t7g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q7g0;->a:Ll/t7g0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7g0;->a:Ll/t7g0;

    check-cast p1, Ll/w7g0;

    invoke-static {p0, p1}, Ll/t7g0;->K3(Ll/t7g0;Ll/w7g0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
