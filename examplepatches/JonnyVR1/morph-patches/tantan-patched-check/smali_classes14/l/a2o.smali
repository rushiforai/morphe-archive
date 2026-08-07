.class public final synthetic Ll/a2o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/e2o;


# direct methods
.method public synthetic constructor <init>(Ll/e2o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2o;->a:Ll/e2o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2o;->a:Ll/e2o;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/e2o;->L(Ll/e2o;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
