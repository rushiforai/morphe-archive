.class public final synthetic Ll/rx6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tx6;


# direct methods
.method public synthetic constructor <init>(Ll/tx6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rx6;->a:Ll/tx6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rx6;->a:Ll/tx6;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/tx6;->b3(Ll/tx6;Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
