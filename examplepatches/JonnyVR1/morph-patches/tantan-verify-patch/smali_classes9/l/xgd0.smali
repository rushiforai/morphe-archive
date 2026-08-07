.class public final synthetic Ll/xgd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uhd0;


# direct methods
.method public synthetic constructor <init>(Ll/uhd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgd0;->a:Ll/uhd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xgd0;->a:Ll/uhd0;

    check-cast p1, Ll/ugd0;

    invoke-static {p0, p1}, Ll/uhd0;->a4(Ll/uhd0;Ll/ugd0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
