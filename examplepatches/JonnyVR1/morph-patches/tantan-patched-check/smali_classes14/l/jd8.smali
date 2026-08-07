.class public final synthetic Ll/jd8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/sd8;


# direct methods
.method public synthetic constructor <init>(Ll/sd8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jd8;->a:Ll/sd8;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jd8;->a:Ll/sd8;

    invoke-static {p0}, Ll/sd8;->c3(Ll/sd8;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
