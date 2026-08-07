.class public final synthetic Ll/r44;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z44;


# direct methods
.method public synthetic constructor <init>(Ll/z44;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r44;->a:Ll/z44;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r44;->a:Ll/z44;

    check-cast p1, Ll/qvd;

    invoke-static {p0, p1}, Ll/z44;->K3(Ll/z44;Ll/qvd;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
