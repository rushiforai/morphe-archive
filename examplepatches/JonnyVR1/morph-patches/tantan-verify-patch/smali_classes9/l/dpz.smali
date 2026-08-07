.class public final synthetic Ll/dpz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dpz;->a:Ll/tvz;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpz;->a:Ll/tvz;

    invoke-static {p0}, Ll/tvz;->nb(Ll/tvz;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
