.class public final synthetic Ll/wu70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/av70;


# direct methods
.method public synthetic constructor <init>(Ll/av70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wu70;->a:Ll/av70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wu70;->a:Ll/av70;

    check-cast p1, Ll/hv70;

    invoke-static {p0, p1}, Ll/av70;->N3(Ll/av70;Ll/hv70;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
