.class public final synthetic Ll/os70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rs70;


# direct methods
.method public synthetic constructor <init>(Ll/rs70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/os70;->a:Ll/rs70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/os70;->a:Ll/rs70;

    check-cast p1, Ll/uu70;

    invoke-static {p0, p1}, Ll/rs70;->b4(Ll/rs70;Ll/uu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
