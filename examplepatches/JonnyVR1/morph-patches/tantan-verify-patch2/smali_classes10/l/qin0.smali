.class public final synthetic Ll/qin0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tin0;


# direct methods
.method public synthetic constructor <init>(Ll/tin0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qin0;->a:Ll/tin0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qin0;->a:Ll/tin0;

    check-cast p1, Ll/fik0;

    invoke-static {p0, p1}, Ll/tin0;->A6(Ll/tin0;Ll/fik0;)Ll/fik0$a;

    move-result-object p0

    return-object p0
.end method
