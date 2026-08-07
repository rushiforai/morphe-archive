.class public final synthetic Ll/i0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/l0w;


# direct methods
.method public synthetic constructor <init>(Ll/l0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i0w;->a:Ll/l0w;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0w;->a:Ll/l0w;

    check-cast p1, Ll/l0w$a;

    invoke-static {p0, p1}, Ll/l0w;->d(Ll/l0w;Ll/l0w$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
