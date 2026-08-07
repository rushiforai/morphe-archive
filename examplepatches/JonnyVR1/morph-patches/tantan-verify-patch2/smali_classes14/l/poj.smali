.class public final synthetic Ll/poj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Date;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/poj;->a:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/poj;->a:Ljava/util/Date;

    check-cast p1, Ll/jjs;

    invoke-static {p0, p1}, Ll/dpj;->g(Ljava/util/Date;Ll/jjs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
