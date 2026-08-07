.class public final synthetic Ll/q0x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r0x;


# direct methods
.method public synthetic constructor <init>(Ll/r0x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0x;->a:Ll/r0x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0x;->a:Ll/r0x;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/r0x;->j(Ll/r0x;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
