.class public final synthetic Ll/gsc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/osc0;


# direct methods
.method public synthetic constructor <init>(Ll/osc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gsc0;->a:Ll/osc0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsc0;->a:Ll/osc0;

    check-cast p1, Ll/ym3;

    invoke-static {p0, p1}, Ll/osc0;->S3(Ll/osc0;Ll/ym3;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
