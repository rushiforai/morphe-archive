.class public final synthetic Ll/uat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q260;


# direct methods
.method public synthetic constructor <init>(Ll/q260;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uat;->a:Ll/q260;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uat;->a:Ll/q260;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/vat;->L3(Ll/q260;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
