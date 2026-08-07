.class public final synthetic Ll/fpb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/fpb0;->a:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fpb0;->a:Z

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/uqb0;->U(ZLl/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
