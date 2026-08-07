.class public final synthetic Ll/kz70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rz70;


# direct methods
.method public synthetic constructor <init>(Ll/rz70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kz70;->a:Ll/rz70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kz70;->a:Ll/rz70;

    check-cast p1, Ll/gu70;

    invoke-static {p0, p1}, Ll/rz70;->z4(Ll/rz70;Ll/gu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
