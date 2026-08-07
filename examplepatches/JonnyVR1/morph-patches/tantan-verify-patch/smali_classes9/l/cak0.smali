.class public final synthetic Ll/cak0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/tak0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/tak0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cak0;->a:Ll/tak0;

    iput-object p2, p0, Ll/cak0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cak0;->a:Ll/tak0;

    iget-object p0, p0, Ll/cak0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/tak0;->p4(Ll/tak0;Ljava/lang/String;)V

    return-void
.end method
