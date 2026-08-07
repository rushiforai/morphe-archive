.class public final synthetic Ll/r36;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s36;


# direct methods
.method public synthetic constructor <init>(Ll/s36;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r36;->a:Ll/s36;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r36;->a:Ll/s36;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/s36;->X3(Ljava/lang/String;)V

    return-void
.end method
