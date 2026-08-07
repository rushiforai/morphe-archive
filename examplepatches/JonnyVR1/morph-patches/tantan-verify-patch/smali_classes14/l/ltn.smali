.class public final synthetic Ll/ltn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/egj0;


# instance fields
.field public final synthetic a:Ll/qtn;


# direct methods
.method public synthetic constructor <init>(Ll/qtn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ltn;->a:Ll/qtn;

    return-void
.end method


# virtual methods
.method public final v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ltn;->a:Ll/qtn;

    invoke-static {p0}, Ll/qtn;->R2(Ll/qtn;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
