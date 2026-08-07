.class public final synthetic Ll/vis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vis;->a:Ll/bjs;

    check-cast p1, Ll/xpj;

    invoke-static {p0, p1}, Ll/bjs;->n4(Ll/bjs;Ll/xpj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
