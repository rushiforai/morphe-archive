.class public final synthetic Ll/x64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d74;


# direct methods
.method public synthetic constructor <init>(Ll/d74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x64;->a:Ll/d74;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x64;->a:Ll/d74;

    check-cast p1, Ll/i84;

    invoke-static {p0, p1}, Ll/d74;->b4(Ll/d74;Ll/i84;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
