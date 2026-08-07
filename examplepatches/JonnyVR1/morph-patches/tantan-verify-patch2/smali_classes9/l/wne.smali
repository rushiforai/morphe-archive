.class public final synthetic Ll/wne;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/xne;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/xne;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wne;->a:Ll/xne;

    iput-boolean p2, p0, Ll/wne;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wne;->a:Ll/xne;

    iget-boolean p0, p0, Ll/wne;->b:Z

    invoke-static {v0, p0}, Ll/xne;->k0(Ll/xne;Z)V

    return-void
.end method
