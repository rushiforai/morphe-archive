.class public final synthetic Ll/qf80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ig80;


# direct methods
.method public synthetic constructor <init>(Ll/ig80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qf80;->a:Ll/ig80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qf80;->a:Ll/ig80;

    check-cast p1, Ll/gyb;

    invoke-static {p0, p1}, Ll/ig80;->M3(Ll/ig80;Ll/gyb;)Ll/fyb;

    move-result-object p0

    return-object p0
.end method
