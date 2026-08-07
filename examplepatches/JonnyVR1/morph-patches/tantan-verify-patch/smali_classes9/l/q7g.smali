.class public final synthetic Ll/q7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q7g;->a:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7g;->a:Ll/pcj;

    check-cast p1, Ll/v5g;

    invoke-static {p0, p1}, Ll/x7g;->s(Ll/pcj;Ll/v5g;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
