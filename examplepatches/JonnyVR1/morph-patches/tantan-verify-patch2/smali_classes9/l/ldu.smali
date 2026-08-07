.class public final synthetic Ll/ldu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/udu;


# direct methods
.method public synthetic constructor <init>(Ll/udu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ldu;->a:Ll/udu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldu;->a:Ll/udu;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/udu;->h(Ll/udu;Ll/jsv;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
