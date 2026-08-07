.class public final synthetic Ll/oc70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ad70;


# direct methods
.method public synthetic constructor <init>(Ll/ad70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oc70;->a:Ll/ad70;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oc70;->a:Ll/ad70;

    invoke-static {p0}, Ll/ad70;->e0(Ll/ad70;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
