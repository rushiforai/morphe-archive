.class public final synthetic Ll/f2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/j2n;


# direct methods
.method public synthetic constructor <init>(Ll/j2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2n;->a:Ll/j2n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2n;->a:Ll/j2n;

    check-cast p1, Ll/r40;

    invoke-static {p0, p1}, Ll/j2n;->V2(Ll/j2n;Ll/r40;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
