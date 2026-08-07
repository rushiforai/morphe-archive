.class public final synthetic Ll/tp20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vp20;


# direct methods
.method public synthetic constructor <init>(Ll/vp20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tp20;->a:Ll/vp20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tp20;->a:Ll/vp20;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/vp20;->f(Ll/vp20;Ll/jsv;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
