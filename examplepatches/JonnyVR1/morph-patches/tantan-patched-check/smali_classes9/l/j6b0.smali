.class public final synthetic Ll/j6b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/p6b0;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/p6b0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j6b0;->a:Ll/p6b0;

    iput-object p2, p0, Ll/j6b0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j6b0;->a:Ll/p6b0;

    iget-object p0, p0, Ll/j6b0;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/p6b0;->T(Ll/p6b0;Ll/y20;)V

    return-void
.end method
