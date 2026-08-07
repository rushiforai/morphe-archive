.class public final synthetic Ll/yq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/br8;


# direct methods
.method public synthetic constructor <init>(Ll/br8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yq8;->a:Ll/br8;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yq8;->a:Ll/br8;

    invoke-static {p0}, Ll/br8;->c3(Ll/br8;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
