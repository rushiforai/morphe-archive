.class public final synthetic Ll/zqn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yrn0;


# direct methods
.method public synthetic constructor <init>(Ll/yrn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zqn0;->a:Ll/yrn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zqn0;->a:Ll/yrn0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/yrn0;->M3(Ll/yrn0;Ljava/lang/Boolean;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method
