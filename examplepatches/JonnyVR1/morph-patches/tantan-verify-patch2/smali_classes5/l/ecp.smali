.class public final synthetic Ll/ecp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/fcp;

.field public final synthetic b:Ll/vg60;


# direct methods
.method public synthetic constructor <init>(Ll/fcp;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ecp;->a:Ll/fcp;

    iput-object p2, p0, Ll/ecp;->b:Ll/vg60;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ecp;->a:Ll/fcp;

    iget-object p0, p0, Ll/ecp;->b:Ll/vg60;

    invoke-static {v0, p0}, Ll/fcp;->a(Ll/fcp;Ll/vg60;)V

    return-void
.end method
