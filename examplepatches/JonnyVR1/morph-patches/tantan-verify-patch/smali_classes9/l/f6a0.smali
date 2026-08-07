.class public final synthetic Ll/f6a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/g6a0;


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f6a0;->a:Ll/g6a0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f6a0;->a:Ll/g6a0;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/g6a0;->g1(Ll/g6a0;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
