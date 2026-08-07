.class public final synthetic Ll/oc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sc10;


# direct methods
.method public synthetic constructor <init>(Ll/sc10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oc10;->a:Ll/sc10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oc10;->a:Ll/sc10;

    check-cast p1, Ll/v7t;

    invoke-static {p0, p1}, Ll/sc10;->J3(Ll/sc10;Ll/v7t;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
