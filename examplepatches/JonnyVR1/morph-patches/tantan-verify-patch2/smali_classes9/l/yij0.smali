.class public final synthetic Ll/yij0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jjj0;


# direct methods
.method public synthetic constructor <init>(Ll/jjj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yij0;->a:Ll/jjj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yij0;->a:Ll/jjj0;

    check-cast p1, Ll/hf4;

    invoke-static {p0, p1}, Ll/jjj0;->U3(Ll/jjj0;Ll/hf4;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
