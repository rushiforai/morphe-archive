.class public final synthetic Ll/l40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q40;


# direct methods
.method public synthetic constructor <init>(Ll/q40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l40;->a:Ll/q40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l40;->a:Ll/q40;

    check-cast p1, Ll/r40;

    invoke-static {p0, p1}, Ll/q40;->U2(Ll/q40;Ll/r40;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
