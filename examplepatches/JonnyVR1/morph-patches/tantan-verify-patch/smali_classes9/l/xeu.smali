.class public final synthetic Ll/xeu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yeu;


# direct methods
.method public synthetic constructor <init>(Ll/yeu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xeu;->a:Ll/yeu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xeu;->a:Ll/yeu;

    check-cast p1, Ljava/util/HashMap;

    invoke-static {p0, p1}, Ll/yeu;->S3(Ll/yeu;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method
