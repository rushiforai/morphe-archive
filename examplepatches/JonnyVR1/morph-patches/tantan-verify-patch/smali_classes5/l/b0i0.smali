.class public final synthetic Ll/b0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/spq;


# direct methods
.method public synthetic constructor <init>(Ll/spq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0i0;->a:Ll/spq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b0i0;->a:Ll/spq;

    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-static {p0, p1}, Ll/wzh0$d;->d(Ll/spq;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
