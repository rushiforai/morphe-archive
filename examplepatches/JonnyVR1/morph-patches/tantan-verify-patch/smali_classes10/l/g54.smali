.class public final synthetic Ll/g54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/n54;


# direct methods
.method public synthetic constructor <init>(Ll/n54;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g54;->a:Ll/n54;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g54;->a:Ll/n54;

    check-cast p1, Ll/x34;

    invoke-static {p0, p1}, Ll/n54;->K3(Ll/n54;Ll/x34;)Ll/q54;

    move-result-object p0

    return-object p0
.end method
