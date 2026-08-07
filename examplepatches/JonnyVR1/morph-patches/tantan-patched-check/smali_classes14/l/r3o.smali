.class public final synthetic Ll/r3o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/y3o;


# direct methods
.method public synthetic constructor <init>(Ll/y3o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r3o;->a:Ll/y3o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r3o;->a:Ll/y3o;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/y3o;->U2(Ll/y3o;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
