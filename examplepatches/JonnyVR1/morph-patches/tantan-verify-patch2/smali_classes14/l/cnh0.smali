.class public final synthetic Ll/cnh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mnh0;


# direct methods
.method public synthetic constructor <init>(Ll/mnh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cnh0;->a:Ll/mnh0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cnh0;->a:Ll/mnh0;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/mnh0;->n0(Ll/mnh0;Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
