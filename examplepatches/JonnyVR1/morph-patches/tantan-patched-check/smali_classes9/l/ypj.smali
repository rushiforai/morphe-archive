.class public final synthetic Ll/ypj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ypj;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypj;->a:Ll/bjs;

    invoke-virtual {p0}, Ll/bjs;->F4()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
