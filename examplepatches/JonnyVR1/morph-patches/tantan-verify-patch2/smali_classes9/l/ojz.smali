.class public final synthetic Ll/ojz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojz;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojz;->a:Ll/clz;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/clz;->e1(Ll/clz;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
