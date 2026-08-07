.class public final synthetic Ll/slu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vlu;


# direct methods
.method public synthetic constructor <init>(Ll/vlu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/slu;->a:Ll/vlu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slu;->a:Ll/vlu;

    check-cast p1, Ll/eqj;

    invoke-static {p0, p1}, Ll/vlu;->d3(Ll/vlu;Ll/eqj;)Ll/e060;

    move-result-object p0

    return-object p0
.end method
