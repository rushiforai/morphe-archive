.class public final synthetic Ll/f180;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/m180;


# direct methods
.method public synthetic constructor <init>(Ll/m180;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f180;->a:Ll/m180;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f180;->a:Ll/m180;

    check-cast p1, Ll/gu70;

    invoke-static {p0, p1}, Ll/m180;->x4(Ll/m180;Ll/gu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
