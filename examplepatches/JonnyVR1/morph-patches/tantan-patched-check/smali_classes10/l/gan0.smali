.class public final synthetic Ll/gan0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/han0;


# direct methods
.method public synthetic constructor <init>(Ll/han0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gan0;->a:Ll/han0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gan0;->a:Ll/han0;

    check-cast p1, Ll/u7f;

    invoke-static {p0, p1}, Ll/han0;->K3(Ll/han0;Ll/u7f;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
