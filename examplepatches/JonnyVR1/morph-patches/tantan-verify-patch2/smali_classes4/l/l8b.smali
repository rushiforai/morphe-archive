.class public final synthetic Ll/l8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/p8b;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/p8b;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8b;->a:Ll/p8b;

    iput-object p2, p0, Ll/l8b;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l8b;->a:Ll/p8b;

    iget-object p0, p0, Ll/l8b;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/p8b;->g0(Ll/p8b;Ll/x20;)V

    return-void
.end method
