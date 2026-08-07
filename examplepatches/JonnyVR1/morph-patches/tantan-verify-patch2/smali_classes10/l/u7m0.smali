.class public final synthetic Ll/u7m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/y7m0;


# direct methods
.method public synthetic constructor <init>(Ll/y7m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u7m0;->a:Ll/y7m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7m0;->a:Ll/y7m0;

    check-cast p1, Ll/u7f;

    invoke-static {p0, p1}, Ll/y7m0;->L3(Ll/y7m0;Ll/u7f;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
