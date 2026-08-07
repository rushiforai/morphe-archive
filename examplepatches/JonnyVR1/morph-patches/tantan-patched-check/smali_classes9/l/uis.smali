.class public final synthetic Ll/uis;
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

    iput-object p1, p0, Ll/uis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uis;->a:Ll/bjs;

    check-cast p1, Ll/eyj;

    invoke-static {p0, p1}, Ll/bjs;->A4(Ll/bjs;Ll/eyj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
