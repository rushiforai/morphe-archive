.class public final synthetic Ll/fof0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mof0;


# direct methods
.method public synthetic constructor <init>(Ll/mof0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fof0;->a:Ll/mof0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fof0;->a:Ll/mof0;

    check-cast p1, Ll/dji$a;

    invoke-static {p0, p1}, Ll/mof0;->a(Ll/mof0;Ll/dji$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
