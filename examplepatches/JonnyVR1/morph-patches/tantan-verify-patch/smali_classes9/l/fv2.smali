.class public final synthetic Ll/fv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nv2;


# direct methods
.method public synthetic constructor <init>(Ll/nv2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fv2;->a:Ll/nv2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv2;->a:Ll/nv2;

    check-cast p1, Ll/hx2;

    invoke-static {p0, p1}, Ll/nv2;->S3(Ll/nv2;Ll/hx2;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method
