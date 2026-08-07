.class public final synthetic Ll/g5b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/h5b0;


# direct methods
.method public synthetic constructor <init>(Ll/h5b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5b0;->a:Ll/h5b0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g5b0;->a:Ll/h5b0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/h5b0;->i(Ll/h5b0;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
