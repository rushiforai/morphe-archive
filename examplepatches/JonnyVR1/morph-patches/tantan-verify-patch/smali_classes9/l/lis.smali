.class public final synthetic Ll/lis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lis;->a:Ll/bjs;

    check-cast p1, Ll/ywj;

    invoke-static {p0, p1}, Ll/bjs;->e4(Ll/bjs;Ll/ywj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
