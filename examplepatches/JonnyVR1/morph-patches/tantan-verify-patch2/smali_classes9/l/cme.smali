.class public final synthetic Ll/cme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/hme;


# direct methods
.method public synthetic constructor <init>(Ll/hme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cme;->a:Ll/hme;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cme;->a:Ll/hme;

    invoke-static {p0}, Ll/hme;->c0(Ll/hme;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
