.class public final synthetic Ll/ke50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pe50;


# direct methods
.method public synthetic constructor <init>(Ll/pe50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ke50;->a:Ll/pe50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ke50;->a:Ll/pe50;

    check-cast p1, Ll/be50;

    invoke-static {p0, p1}, Ll/pe50;->O3(Ll/pe50;Ll/be50;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
