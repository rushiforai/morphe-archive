.class public final synthetic Ll/m0y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/r0y;

.field public final synthetic b:Ll/zux;


# direct methods
.method public synthetic constructor <init>(Ll/r0y;Ll/zux;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m0y;->a:Ll/r0y;

    iput-object p2, p0, Ll/m0y;->b:Ll/zux;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m0y;->a:Ll/r0y;

    iget-object p0, p0, Ll/m0y;->b:Ll/zux;

    invoke-static {v0, p0}, Ll/r0y;->j0(Ll/r0y;Ll/zux;)V

    return-void
.end method
