.class public final synthetic Ll/fsc0;
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

    iput-object p1, p0, Ll/fsc0;->a:Ll/osc0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsc0;->a:Ll/osc0;

    check-cast p1, Ll/bsc0;

    invoke-static {p0, p1}, Ll/osc0;->O3(Ll/osc0;Ll/bsc0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
