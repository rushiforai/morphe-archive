.class public final synthetic Ll/bbd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ycd0;


# direct methods
.method public synthetic constructor <init>(Ll/ycd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bbd0;->a:Ll/ycd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbd0;->a:Ll/ycd0;

    check-cast p1, Ll/d3q;

    invoke-static {p0, p1}, Ll/cbd0;->g0(Ll/ycd0;Ll/d3q;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
