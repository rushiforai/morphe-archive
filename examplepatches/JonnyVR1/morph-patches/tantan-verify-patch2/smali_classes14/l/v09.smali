.class public final synthetic Ll/v09;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/d19;


# direct methods
.method public synthetic constructor <init>(Ll/d19;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v09;->a:Ll/d19;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v09;->a:Ll/d19;

    invoke-static {p0}, Ll/d19;->u3(Ll/d19;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
