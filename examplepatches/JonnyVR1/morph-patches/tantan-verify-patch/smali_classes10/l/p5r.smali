.class public final synthetic Ll/p5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r5r;


# direct methods
.method public synthetic constructor <init>(Ll/r5r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5r;->a:Ll/r5r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5r;->a:Ll/r5r;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/r5r;->W0(Ll/r5r;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
