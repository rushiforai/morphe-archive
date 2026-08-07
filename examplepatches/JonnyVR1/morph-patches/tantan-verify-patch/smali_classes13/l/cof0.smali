.class public final synthetic Ll/cof0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/mof0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/mof0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cof0;->a:Ll/mof0;

    iput-boolean p2, p0, Ll/cof0;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cof0;->a:Ll/mof0;

    iget-boolean p0, p0, Ll/cof0;->b:Z

    invoke-static {v0, p0}, Ll/mof0;->e(Ll/mof0;Z)V

    return-void
.end method
