.class public final synthetic Ll/qzl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/k0m0;


# direct methods
.method public synthetic constructor <init>(Ll/k0m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzl0;->a:Ll/k0m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzl0;->a:Ll/k0m0;

    check-cast p1, Ll/vjj;

    invoke-static {p0, p1}, Ll/k0m0;->R3(Ll/k0m0;Ll/vjj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
