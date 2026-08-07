.class public final synthetic Ll/cjs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/djs;


# direct methods
.method public synthetic constructor <init>(Ll/djs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cjs;->a:Ll/djs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjs;->a:Ll/djs;

    check-cast p1, Ll/ohs;

    invoke-static {p0, p1}, Ll/djs;->S3(Ll/djs;Ll/ohs;)Ll/coj;

    move-result-object p0

    return-object p0
.end method
